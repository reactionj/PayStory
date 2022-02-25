package com.AourZ.PayStory.model;

import java.io.File;
import java.util.Iterator;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUtils {
	private static final String filePath = "C:\\PayStory\\images\\"; // 파일이 저장될 위치
	
	public static String updateImg(
			MultipartHttpServletRequest mpRequest) throws Exception{
		
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		String memberImage = "";
		
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				memberImage = storedFileName;
			}
		}
		return memberImage;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
