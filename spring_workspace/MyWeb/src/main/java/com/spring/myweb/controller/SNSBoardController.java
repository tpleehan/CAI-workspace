package com.spring.myweb.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.command.SNSBoardVO;
import com.spring.myweb.command.UserVO;
import com.spring.myweb.snsboard.service.ISNSBoardService;
import com.spring.myweb.util.PageVO;

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
			String uploadPath = "C:\\test\\upload\\" + fileLoca;

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
			System.out.println("고유랜덤문자: " + uuids);
			
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
	
	// 비동기 통신 후 가져올 목록
	@GetMapping("/getList")
	@ResponseBody
	public List<SNSBoardVO> getList(PageVO paging) {
		paging.setCountPerPage(3);
		return service.getList(paging);
	}
	
	// 게시글 이미지 파일 전송 요청
	// ResponseEntity: 응답으로 변환될 정보를 모두 담은 요소들의 객체로 만들어서 반환해준다.
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileLoca, String fileName) {
		System.out.println("fileName: " + fileName);
		System.out.println("fileLoca: " + fileLoca);
		
		File file = new File("C:\\test\\upload\\" + fileLoca + "\\" + fileName);
		System.out.println("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders headers = new HttpHeaders();
			
			// probeContentType: 파라미터로 전달받은 파일의 타입을 문자열로 변환해 주는 메서드
			// 사용자에게 보여주고자 하는 데이터가 어떤 파일인지 검사해서 응답 상태 코드를 다르게 리턴할 수 있다.
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			
			// ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메시지)
			// FileCopyUtils: 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메서드의 집합체
			// file 객체 안에 있는 내용을 복사해서 byte 배열로 변환해서 바디에 담아 화면에 전달
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	// 상세보기 처리
	@GetMapping("/getDetail/{bno}")
	@ResponseBody
	public SNSBoardVO getDetail(@PathVariable int bno) {
		return service.getDetail(bno);
	}
	
	// 삭제 처리
	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody int bno, HttpSession sesson) {
		System.out.println("삭제 글 번호: " + bno);
		SNSBoardVO vo = service.getDetail(bno);
		
		UserVO user = (UserVO) sesson.getAttribute("login");
		
		// 로그인을 하지 않았거나, 작성자와 현재 로그인한 id가 일치하지 않는 경우
		if(user == null || !user.getUserId().equals(vo.getWriter())) { 
			return "noAuth";
		}
		
		service.delete(bno);
		
		// 파일 객체를 생성해서 지워지고 있는 게시물의 파일을 지목
		File file = new File(vo.getUploadpath() + "\\" + vo.getFilename());
		System.out.println("파일 삭제 완료");
		
		return file.delete() ? "Success" : "fail"; // 파일 삭제 메서드
		
	}
	
	// 다운로드 비동기 처리(화면에서 a태그를 클릭스 download 요청이 들어올 수 있게 처리)
	@GetMapping("/download")
	@ResponseBody
	public ResponseEntity<byte[]> download(String fileLoca, String fileName) {
		System.out.println("fileName: " + fileName);
		System.out.println("fileLoca: " + fileLoca);
		
		File file = new File("C:\\test\\upload\\" + fileLoca + "\\" + fileName);
		System.out.println("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			// 응답하는 본문을 브라우저가 어떻게 표시해야 하는지 알려주는 헤더 정보를 추가
			// inline인 경우 웹 페이지 화면에 표시되고, attachment인 경우 다운로드를 제공한다.
			
			// request객체의 getHeader("User-Agent") -> 단어를 뽑아서 확인
	        // ie: Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko  
	        // chrome: Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36
			
			// 파일명한글처리(Chrome browser) 크롬
	        // header.add("Content-Disposition", "attachment; filename=" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1"));
	        // 파일명한글처리(Edge) 엣지 
	        // header.add("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));
	        // 파일명한글처리(Trident) IE
	        // Header.add("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", " "));
			
			HttpHeaders headers = new HttpHeaders();
			
			headers.add("Content-Disposition", "attachment; filename=" + fileName);
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
}
