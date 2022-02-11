package com.spring.myweb;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.myweb.command.FreeBoardVO;
import com.spring.myweb.freeboard.mapper.IFreeBoardMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class FreeBoardMapperTest {

	@Autowired
	private IFreeBoardMapper mapper;
	
	@Test
	public void registTest() {
		for(int i = 1; i <= 320; i++) {
			FreeBoardVO vo = new FreeBoardVO();
			vo.setTitle("테스트 제목 " + i);
			vo.setWriter("김테스트 " + i);
			vo.setContent("테스트 내용 " + i);
			mapper.regist(vo);
		}
	}
}
