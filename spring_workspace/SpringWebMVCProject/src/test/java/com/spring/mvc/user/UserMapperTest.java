package com.spring.mvc.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.mvc.user.model.UserVO;
import com.spring.mvc.user.repository.IUserMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/mvc-config.xml"})
public class UserMapperTest {

	// Mapper 계층의 객체
	@Autowired
	private IUserMapper mapper;
	
	// 회원 가입 진행
	@Test
	public void registTest() {
		UserVO vo = new UserVO();
		
		vo.setAccount("admin");
		vo.setPassword("admin");
		vo.setName("admin");
		
		mapper.register(vo);
		
	}
	   
	// 회원 가입한 아이디로 중복 확인 후 COUNT(*)를 이용해서 1이 리턴이 되는지 확인
   @Test
   public void checkIdTest() {
	   int result = mapper.checkId("abc1234");
	   
	   if (result == 1) {
		   System.out.println("존재하는 아이디 입니다.");
	   } else {
		   System.out.println("아이디 사용 가능합니다.");
	   }
   }
   
   // 가입한 회원의 모든 정보를 얻어내서 출력
   @Test
   public void selectTest() {
	   System.out.println(mapper.selectOne("abc1234"));
   }
   
   // 가입한 계정의 탈퇴를 진행
   // 탈퇴가 정상적으로 됐는지 여부 체크
   @Test
   public void deleteTest() {
	   mapper.delete("abc1234");
	   if(mapper.selectOne("abc1234") == null) {
		   System.out.println("삭제 완료");
	   } else {
		   System.out.println("삭제 실패");
	   }
   }
	
	
}
