package com.btf.tap.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
	
	// 특정 타겟의 이미지명 불러오기
	public List<Image> getTargetImage(String imageTargetCategory, int imageTarget){
		Image image = new Image();
		image.setImageTargetCategory(imageTargetCategory);
		image.setImageTarget(imageTarget);
		return imageMapper.selectTargetImage(image);
	}
	
	// 타겟의 이미지 삭제하기
	public void deleteImage(String imageTargetCategory, int imageTarget) {
		List<Image> imageList = getTargetImage(imageTargetCategory, imageTarget);
		
		for(Image i : imageList) {
			log.debug(Font.HJ + "삭제할 사진명 :" + i.getImageRealName() + Font.RESET);
	        String deleteImgName = "C:/Users/fjdks/Desktop/image/"+imageTargetCategory+"/"+ i.getImageName();
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

        String path = "C:/Users/fjdks/Desktop/image/"+imageTargetCategory+"/";
        
        for (MultipartFile mf : fileList) {
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
            image.setCreateTime(safeTime);
            String safeFile = path + safeTime + originFileName;
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
