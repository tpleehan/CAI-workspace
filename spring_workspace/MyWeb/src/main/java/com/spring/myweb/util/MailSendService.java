package com.spring.myweb.util;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {

	@Autowired
	private JavaMailSender mailSender;
	
	private int authNum;
	
	// 인증코드 난수 발생
	private void makeRandomNumber() {
		// 난수의 범위: 111111 ~ 999999
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호: " + checkNum);
		authNum = checkNum;
		
	}
	
	
	
	// 회원 가입 시 사용할 이메일 전송 양식
	public String joinEmail(String email) {
		makeRandomNumber();
		
		String setFrom = "testleehan@gmail.com"; // email-config에 설정한 이메일 주소 입력
		String toMail = email; // 수신 받을 이메일
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." +
				"<br><br>" + 
				"인증 번호는 " + authNum + "입니다." + 
				"<br>" + 
				"해당 인증번호를 인증번호 확인란에 기입해 주세요."; //이메일 내용 삽입
		
		mailSend(setFrom, toMail, title, content);
		
		return Integer.toString(authNum);
		
	}
	
	// 이메일 전송 메서드 (공통된 양식 메서드) 
	// 비밀번호 찾기 이메일 전송이나 기타 등등 이메일 전송을 사용할 때 메서드를 따로 생성하는게 좋다.
	private void mailSend(String setFrom, String toMail, String title, String content) {
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			// true 매개값을 전달하면 MultiPart 형식의 메시지 전달이 가능하다.
			// MultiPart: 다중 이미지, 영상 등 전달 가능하다.
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// boolean 타입의 true를 전달하면 html 형식으로 전송한다.
			// true를 작성하지 않을 경우 텍스트로 전달된다.
			helper.setText(content, true);
			
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
