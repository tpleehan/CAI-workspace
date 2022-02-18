package com.spring.myweb.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.myweb.command.MultiUploadVO;
import com.spring.myweb.command.UploadVO;

@Controller
@RequestMapping("/fileupload")
public class UploadController {

	@GetMapping("/upload")
	public void form() {}
	
	@PostMapping("/upload_ok")
	public String upload(@RequestParam("file") MultipartFile file) {
		
		try {
			String fileRealName = file.getOriginalFilename(); // 사용자가 전송한 파일명
			long fileSize = file.getSize(); // 사용자가 전송한 파일 크기 (Byte 단위)
			
			System.out.println("파일명: " + fileRealName);
			System.out.println("파일크기: " + fileSize);
			
			// 서버에서 저장할 파일 경로
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			String uploadFoler = "C:\\test\\upload";
			
			/*
			 * 파일 업로드 시 파일명이 동일한 파일이 이미 존재할 수 있고
			 * 업로드하는 파일명이 영어 이외의 언어로 되어 있을 수 있다.
			 * 타 언어를 지원하지 않는 환경에서 정상 동작이 되지 않는다. (리눅스)
			 * 고유한 램덤 문자를 통해 DB와 서버에 저장할 파일명을 새롭게 만들어 준다.
			 * 
			 */
			UUID uuid = UUID.randomUUID();
			System.out.println("uuid.toString() : " + uuid.toString());
			
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			System.out.println("생성된 고유 문자열: " + uniqueName);
			System.out.println("확장자명: " + fileExtension);
			
			File savaFile = new File(uploadFoler + "\\" + uniqueName + fileExtension);

			// 실제 파일 저장 메서드(fileWriter 작업을 한번에 손쉬운 방법으로 처리)
			file.transferTo(savaFile);
			
			System.out.println("savaFile: " + savaFile);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return "fileupload/upload_ok";
		
	}
	
	@PostMapping("/upload_ok2")
	public String upload2(MultipartHttpServletRequest files) {
		
		// 서버에서 저장할 파일 경로
		String uploadFoler = "C:\\test\\upload";
		
		List<MultipartFile> list = files.getFiles("files");
		
		/*
		for(int i = 0; i < list.size(); i++) {
			String fileRealName = list.get(i).getOriginalFilename(); // 사용자가 전송한 파일명
			long fileSize = list.get(i).getSize(); // 사용자가 전송한 파일 크기 (Byte 단위)
			
			System.out.println("파일명: " + fileRealName);
			System.out.println("파일크기: " + fileSize);
			
			File saveFile = new File(uploadFoler + "\\" + fileRealName);
			
			try {
				list.get(i).transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		*/
		
		for(MultipartFile m : list ) {
			String fileRealName = m.getOriginalFilename();
			long fileSize = m.getSize();
			
			System.out.println("파일명: " + fileRealName);
			System.out.println("파일크기: " + fileSize);
			
			File saveFile = new File(uploadFoler + "\\" + fileRealName);
		
			try {
				m.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return "fileupload/upload_ok";
	}
	
	@PostMapping("/upload_ok3")
	public String upload3(@RequestParam("file") List<MultipartFile> list) {
		
		String uploadFoler = "C:\\test\\upload";
		
		for(MultipartFile m : list ) {
			String fileRealName = m.getOriginalFilename();
			long fileSize = m.getSize();
			
			System.out.println("파일명: " + fileRealName);
			System.out.println("파일크기: " + fileSize);
			
			File saveFile = new File(uploadFoler + "\\" + fileRealName);
		
			try {
				m.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return "fileupload/upload_ok";
	}
	
	@PostMapping("/upload_ok4")
	public String upload4(MultiUploadVO vo) {
		
		System.out.println("vo: " + vo);
		
		String uploadFoler = "C:\\test\\upload";
		
		List<UploadVO> list = vo.getList();
		
		try {
			
			for(UploadVO uvo : list) {
				String fileRealName = uvo.getFile().getOriginalFilename();
				long fileSize = uvo.getFile().getSize();
				
				System.out.println("파일명: " + fileRealName);
				System.out.println("파일크기: " + fileSize);
				
				File saveFile = new File(uploadFoler + "\\" + fileRealName);
				
				uvo.getFile().transferTo(saveFile);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "fileupload/upload_ok";
		
	}
	
}
