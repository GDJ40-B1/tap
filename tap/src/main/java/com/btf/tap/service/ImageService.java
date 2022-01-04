package com.btf.tap.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.ImageMapper;
import com.btf.tap.vo.Image;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class ImageService {
	@Autowired ImageMapper imageMapper;
	
	// 타겟의 이미지 수정하기
	public void modifyTargetImage(MultipartHttpServletRequest mtRequest, String imageTargetCategory, int imageTarget) {
		List<MultipartFile> fileList = mtRequest.getFiles("file");
		
		if(fileList.get(0).getOriginalFilename()!=null && !fileList.get(0).getOriginalFilename().equals("")) {
			removeImage(mtRequest, imageTargetCategory, imageTarget);
			addImage(mtRequest, imageTargetCategory, imageTarget);
		}
	}
	
	// 특정 타겟의 이미지명 불러오기
	public List<Image> getTargetImage(String imageTargetCategory, int imageTarget){
		Image image = new Image();
		image.setImageTargetCategory(imageTargetCategory);
		image.setImageTarget(imageTarget);
		return imageMapper.selectTargetImage(image);
	}
	
	// 타겟의 이미지 삭제하기
	public void removeImage(HttpServletRequest request, String imageTargetCategory, int imageTarget) {
		List<Image> imageList = getTargetImage(imageTargetCategory, imageTarget);
		
		for(Image i : imageList) {
			log.debug(Font.HJ + "삭제할 사진명 :" + i.getImageRealName() + Font.RESET);
	        String deleteImgName = request.getSession().getServletContext().getRealPath("/resources/img/") +imageTargetCategory+"/"+ i.getImageName();
	        File deleteImg = new File (deleteImgName);
	        if (deleteImg.exists() && deleteImg.isFile()){
	        	deleteImg.delete();// 사진 삭제
	        	imageMapper.deleteImage(i.getImageName());
	        }
		}
	}
	
	// 이미지 추가하기
	public void addImage(MultipartHttpServletRequest mtRequest, String imageTargetCategory, int imageTarget) {
		List<MultipartFile> fileList = mtRequest.getFiles("file");

        String path = mtRequest.getSession().getServletContext().getRealPath("/resources/img/"+imageTargetCategory+"/");
        
        int i=0;
        for (MultipartFile mf : fileList) {
        	if(i>5) {
        		break;
        	} else {
        		i++;
        	}
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            log.debug(Font.HJ + "사진 명 :" + originFileName + Font.RESET);
            if(originFileName==null || originFileName.equals("")) {
            	return;
            }
            long fileSize = mf.getSize(); // 파일 사이즈
            
            Image image = new Image();
            image.setImageTarget(imageTarget);
            image.setImageTargetCategory(imageTargetCategory);
            image.setImageName(System.currentTimeMillis() + originFileName);
            image.setImageRealName(originFileName);
            image.setCreateTime(path);
            
            // 밀리세컨드로 시간을 쪼갠 정보
            String safeTime = "" + System.currentTimeMillis();
            String safeFile = path + safeTime + originFileName;
            image.setCreateTime(safeTime);
            
            // 저장하려는 경로에 디렉터리가 없으면 생성
            File dir = new File(path);
        	if (!dir.exists()) {
        		dir.mkdirs();
        	}
        	
            try {
            	// 이미지 파일 해당 위치에 저장
                mf.transferTo(new File(safeFile));
                // 이미지 정보 DB에 저장
                imageMapper.insertImage(image);
                
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
	}
}
