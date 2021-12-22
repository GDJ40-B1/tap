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
            image.setImagePath("/image/"+imageTargetCategory+"/");

            String safeFile = path + System.currentTimeMillis() + originFileName;
            try {
                mf.transferTo(new File(safeFile));
                imageMapper.insertImage(image);
                
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
	}
}
