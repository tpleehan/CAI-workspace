package com.spring.myweb.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.command.SNSBoardVO;
import com.spring.myweb.command.UserVO;
import com.spring.myweb.snsboard.service.ISNSBoardService;

@Controller
@RequestMapping("/snsBoard")
public class SNSBoardController {

	@Autowired
	private ISNSBoardService service;
	
	@GetMapping("/snsList")
	public void snsList() {}
	
	@PostMapping("/upload")
	@ResponseBody
	public String upload(MultipartFile file , String content, HttpSession session) {
		
		try {
			String writer = ((UserVO) session.getAttribute("login")).getUserId();
			
			// 날짜별로 폴더를 생성해서 파일 관리
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();	
			String fileLoca = sdf.format(date);
			
			// 저장할 폴더 경로
			String uploadPath = "C:\\test\\upload" + fileLoca;

			File folder = new File(uploadPath);
			
			if(!folder.exists()) {
				folder.mkdir(); // 폴더가 존재하지 않는다면 생성
			}
			
			String fileRealName = file.getOriginalFilename();
			
			// 파일명을 고유한 랜덤 문자로 생성
			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-", "");
			
			// 확장자 추출
			String fileExtension = fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());
			
			System.out.println("저장할 폴더 경로: " + uploadPath);
			System.out.println("실제 파일명: " + fileRealName);
			System.out.println("폴더명: " + fileLoca);
			System.out.println("확장자: " + fileExtension);
			System.out.println("고유랜던문자: " + uuids);
			
			String fileName = uuids + fileExtension;
			System.out.println("변경 후 저장된 파일명: " + fileName);
			
			// 업로드한 파일을 서버 컴퓨터의 지정한 경로 내에 실제로 저장
			File saveFile = new File(uploadPath + "\\" + fileName);
			file.transferTo(saveFile);
			
			// DB에 insert 작업 진행
			SNSBoardVO snsVO = new SNSBoardVO(0, writer, uploadPath, fileLoca, fileName, fileRealName, content, null);
			service.insert(snsVO);
			
			return "success";
		} catch (Exception e) {
			System.out.println("업로드 중 에러 발생: " + e.getMessage());
			return "fail"; // 에러 발생 시 실패 키워드 반환
		}
		
		
	}
	
	
}
