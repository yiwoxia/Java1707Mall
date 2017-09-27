package com.situ.mall.controller.back;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/upload")
public class UploadController {
	
	@RequestMapping("/uploadPic")
	@ResponseBody
	public Map<String,Object> uploadPic(MultipartFile pictureFile){
		//为了防止重名生成一个随机的名字:aa4fb86a7896458a8c5b34c634011ae3
		String name = UUID.randomUUID().toString().replace("-", "");
		//jpg,png
		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		String fileName = name + "." + ext; 
		System.out.println(fileName);
		String filePath = "D:\\pic\\" + fileName;
		   try {
			pictureFile.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		   
		 Map<String,Object> map = new HashMap<String,Object>();
		 map.put("fileName", fileName);
		return map;
	}
	
}
