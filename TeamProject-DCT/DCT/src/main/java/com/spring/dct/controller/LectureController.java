package com.spring.dct.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dct.lecture.service.ILectureService;
import com.spring.dct.vo.OnlineLectureUplaodVO;
import com.spring.dct.vo.UsersVO;
import com.spring.dct.util.PageCreator;
import com.spring.dct.util.PageVO;



@Controller
@RequestMapping("/lecture")
public class LectureController {

	@Autowired
	private ILectureService service;
	
	
	//강의 수강평 화면 처리
		@GetMapping("/lectureWrite")
		public void lectureWrite() {
			System.out.println("/lecture/lectureWrite: GET");
		}
		
	
	
	
		//강의 업로드 등록처리
		@PostMapping("/lectureRegist")
		public String  lectureRegist(@RequestParam("lectureThumbnail") MultipartFile lectureThumbnail,
				@RequestParam("lectureVideo") MultipartFile lectureVideo , OnlineLectureUplaodVO vo, RedirectAttributes ra, HttpSession session) {
			
			System.out.println(vo);
			
			int userNo = ((UsersVO)session.getAttribute("login")).getUserNo();
			System.out.println("userNo:" + userNo);
			
			try {
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				
				Date date = new Date();
				
				String thumbnailFileLoca = sdf.format(date);
				
				//저장할 썸네일파일 경로
				String thumbnailUploadpath = "C:\\upload\\thumbnail\\" + thumbnailFileLoca;
				
				
				File thumbnailfolder = new File(thumbnailUploadpath);
				if(!thumbnailfolder.exists()) {
					thumbnailfolder.mkdir();
				}
				
				String thumbnailFilerealname = lectureThumbnail.getOriginalFilename();
				
				//파일명을 고유한 랜덤 문잔로 생성
				UUID uuid = UUID.randomUUID();
				String uuids = uuid.toString().replaceAll("-","");
				
				//확장자를 추출
				String thumbnailFileExtionsion = thumbnailFilerealname.substring(thumbnailFilerealname.indexOf("."), thumbnailFilerealname.length());
				
				String thumbnailFilename = uuids + thumbnailFileExtionsion;
				System.out.println("변경해서 저장할 썸네일 파일명: " + thumbnailFilename);
				
				File saveThumbnailFile = new File(thumbnailUploadpath + "\\" + thumbnailFilename);
				lectureThumbnail.transferTo(saveThumbnailFile);
				
				
				System.out.println("-------------------------------------");
				
				String videoFileLoca = sdf.format(date);
				
				String videoUploadpath =  "C:\\upload\\video\\" + videoFileLoca;
				
				File videofolder = new File(videoUploadpath);
				if(!videofolder.exists()) {
					videofolder.mkdir();
				}
				
				String videoFilerealname = lectureVideo.getOriginalFilename();
				
				String videoFileExtionsion = videoFilerealname.substring(videoFilerealname.indexOf("."), videoFilerealname.length());
				
				String videoFilename = uuids + videoFileExtionsion;
				System.out.println("변경해서 저장할 비디오 파일명: " + videoFilename);
				
				File saveVideoFile = new File(videoUploadpath + "\\" + videoFilename);
				
				lectureVideo.transferTo(saveVideoFile);
			
				OnlineLectureUplaodVO lectureVo = new OnlineLectureUplaodVO(0, userNo, vo.getCategoryNo(),
						vo.getAdminId(), vo.getLectureWriter() ,vo.getLectureTitle(),vo.getLectureContent(),vo.getLecturePrice(), vo.getLectureDiscountPrice(), vo.getLectureLike(),
						thumbnailUploadpath, thumbnailFileLoca, thumbnailFilename, thumbnailFilerealname,
						videoUploadpath, videoFileLoca, videoFilename, videoFilerealname, null);
				
				
				
				service.regist(lectureVo);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			ra.addFlashAttribute("msg", "정상등록 처리되었습니다.");
			
			return "redirect:/lecture/lecturePage";
			
		}
	
	
	//강의 화면 처리(리스트 불러오기)
	@GetMapping("/lecturePage")
	public String lecturePage(PageVO vo, Model model) {
		System.out.println("/lecture/lecturePage: GET");
		
		System.out.println("페이지 번호: " + vo.getPageNum());
		System.out.println("검색어: " + vo.getKeyword());
		System.out.println("검색조건: " + vo.getCondition());
		System.out.println("categoryNum: " + vo.getCategoryNum());
		
		
		PageCreator pc = new PageCreator();
		
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		
		System.out.println(pc);
		
		List<OnlineLectureUplaodVO> list = new ArrayList<>();
		list = service.getList(vo);
		
				
		model.addAttribute("lectureList", list);
		model.addAttribute("pc", pc);
		
		return "lecture/lecturePage";
		
		
		
	}
	
	
	
	//강의 업로드 화면 처리
	@GetMapping("/lectureDisplay")
	public ResponseEntity<byte[]> thumbnailFile(String thumbnailFileLoca, String thumbnailFilename) {
		System.out.println("/lecture/lectureDisplay: GET");
		
				
		//가져올 파일의 경로를 설정
		File file = new File("C:\\upload\\thumbnail\\" + thumbnailFileLoca + "\\" + thumbnailFilename);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			//httpHeaders->org.spring.framwork, 응답할 정보를 전달할 수 있게 담는 곳
			HttpHeaders headers = new HttpHeaders();
			//probeContentType: 파라미터를 전달받은 파일의 타입을 문자열로 변환해 주는 메서드(/Files-> java.nio)
			//사용자에게 보여주고자 하는 데이터가 어떤 파일인지를 검사해서 응답 상태 코드를 다르게 리턴할 수도 있습니다.
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			//headers.add("merong", "hello"); 
			
			//byte[]로 리턴을 할 수 있어서 responseEntity를 사용 안해도 되지만 상태메시지들을 보내기 위해 res~를 사용
			//단, copyToByteArray는 꼭 사용해야 하고 byte[](바이트 배열)로 전달해야 하는 것도 중요하다.(사진들을 보낼때는 byte[])
			//ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메시지);	
			//FileCopyUtils: 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메서드의 집합체.
			//file 객체 안에 있는 내용을 복사해서 byte 배열로 변환해서 바디에 담아 화면에 전달.
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
		
		
	}
	
	
	
	
	
	//강의 상세 화면 처리
	@GetMapping("/lectureDetail")
	public void lectureDetailPage(int lectureNo, @ModelAttribute("p") PageVO vo, Model model) {
		System.out.println("/lecture/lectureDetailPage: GET");
		
		model.addAttribute("lectureArticle", service.getContent(lectureNo));
		
		
	}
	
	
	//강의 업로드 화면 처리
		@GetMapping("/videoDisplay")
		public ResponseEntity<byte[]> videoFile(String videoFileLoca, String videoFilename) {
			System.out.println("/lecture/lectureDisplay: GET");
			
						
			//가져올 파일의 경로를 설정
			File file = new File("C:\\upload\\video\\" + videoFileLoca + "\\" + videoFilename);
						
			ResponseEntity<byte[]> result = null;
			
			try {
				//httpHeaders->org.spring.framwork, 응답할 정보를 전달할 수 있게 담는 곳
				HttpHeaders headers = new HttpHeaders();
				
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
			
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			return result;
			
			
		}
		
	//강의 수정페이지 이동
	@GetMapping("/lectureUpdate")
	public String lectureUpdate(int lectureNo, Model model) {
		System.out.println("/lecture/lectureUpdate: GET");
		
		model.addAttribute("lectureArticle", service.getContent(lectureNo));
		
		return "lecture/lectureUpdate";
	}
	
	//강의 수정 등록
	@PostMapping("/lectureModify")
	public String lectureModify(@RequestParam("lectureThumbnail") MultipartFile lectureThumbnail, @RequestParam("lectureVideo") MultipartFile lectureVideo,
			OnlineLectureUplaodVO vo, HttpSession session, RedirectAttributes ra, PageVO page, Model model, @RequestParam("lectureNo") int lectureNo) {
		System.out.println("/lecture/lectureModify: POST");
		
		System.out.println("업데이트 수정전 vo: "+ vo);
		
		int userNo = ((UsersVO)session.getAttribute("login")).getUserNo();
		System.out.println("userNo:" + userNo);
		
		try {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			
			Date date = new Date();
			
			String thumbnailFileLoca = sdf.format(date);
			
			//저장할 썸네일파일 경로
			String thumbnailUploadpath = "C:\\upload\\thumbnail\\" + thumbnailFileLoca;
			
			
			File thumbnailfolder = new File(thumbnailUploadpath);
			if(!thumbnailfolder.exists()) {
				thumbnailfolder.mkdir();
			}
			
			String thumbnailFilerealname = lectureThumbnail.getOriginalFilename();
			
			//파일명을 고유한 랜덤 문잔로 생성
			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-","");
			
			//확장자를 추출
			String thumbnailFileExtionsion = thumbnailFilerealname.substring(thumbnailFilerealname.indexOf("."), thumbnailFilerealname.length());
			
			String thumbnailFilename = uuids + thumbnailFileExtionsion;
			
			
			File saveThumbnailFile = new File(thumbnailUploadpath + "\\" + thumbnailFilename);
			lectureThumbnail.transferTo(saveThumbnailFile);
			
			
			System.out.println("-------------------------------------");
			
			String videoFileLoca = sdf.format(date);
			
			String videoUploadpath =  "C:\\upload\\video\\" + videoFileLoca;
			
			File videofolder = new File(videoUploadpath);
			if(!videofolder.exists()) {
				videofolder.mkdir();
			}
			
			String videoFilerealname = lectureVideo.getOriginalFilename();
			
			String videoFileExtionsion = videoFilerealname.substring(videoFilerealname.indexOf("."), videoFilerealname.length());
			
			String videoFilename = uuids + videoFileExtionsion;
			
			File saveVideoFile = new File(videoUploadpath + "\\" + videoFilename);
			
			lectureVideo.transferTo(saveVideoFile);
		
			System.out.println("-----------------------수정 시작--------------------");
			
			OnlineLectureUplaodVO modifylectureVo = new OnlineLectureUplaodVO(lectureNo, userNo, vo.getCategoryNo(),
					vo.getAdminId(), vo.getLectureWriter() ,vo.getLectureTitle(),vo.getLectureContent(),vo.getLecturePrice(), vo.getLectureDiscountPrice(), vo.getLectureLike(),
					thumbnailUploadpath, thumbnailFileLoca, thumbnailFilename, thumbnailFilerealname,
					videoUploadpath, videoFileLoca, videoFilename, videoFilerealname, null);
			
			
			service.update(modifylectureVo);
			
			PageCreator pc = new PageCreator();
			
			List<OnlineLectureUplaodVO> list = new ArrayList<>();
			list = service.getList(page);
			
			pc.setPaging(page);
			pc.setArticleTotalCount(service.getTotal(page));
			
			model.addAttribute("lectureList", list);
			model.addAttribute("pc", pc);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		ra.addFlashAttribute("updateSuccess", "정상수정 처리되었습니다.");
		
		
		return "redirect:/lecture/lecturePage";
	}
		
	//강의 삭제
	
	
	//강의 수강평 화면 처리
	@GetMapping("/lectureEva")
	public void lectureEvaPage() {  
		System.out.println("/lecture/lectureEva: GET");
	}
	
	
	
	@GetMapping("/mentoringList")
	public String mentoringList() {
		System.out.println("멘토링 - mentoringList");
		return "lecture/mentoringList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
