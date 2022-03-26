package com.spring.dct.visit;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.spring.dct.visit.mapper.IVisitorMapper;

@WebListener
public class VisitSessionListener implements HttpSessionListener {
	
	private IVisitorMapper mapper;
	
	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
		WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
		
		mapper = context.getBean(IVisitorMapper.class);
		
        // 전체 방문자 수 증가
        mapper.setVisitTotalCount();
        // 총 방문자 수
        int totalCount = mapper.getTotalCount();
        // 오늘 방문자 수
        int todayCount = mapper.getTodayCount();
        
        HttpSession session = sessionEve.getSession();
        
        // 세션에 방문자 수를 담는다.
        session.setAttribute("totalCount", totalCount);
        System.out.println("totalCount : " + totalCount);
        session.setAttribute("todayCount", todayCount);
        System.out.println("todayCount : " + todayCount);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
	}

}
