package basic.quiz;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		
	  /**
	   * 1. quiz-config.xml 파일을 생성(auto-config.xml 파일을 복사)
	   *    Monitor, Keyboard, Mouse, Computer 빈을 생성 후
	   * 2. Computer 클래스에서 자동 주입을 설정
	   *    (Computer는 나머지 부속품 객체들과 의존 관계가 있다.) 
	   * 3. MainClass에서 xml에 등록된 빈을 얻은 후 computerInfo() 메서드를 실행 
	   *    computerInfo() 메서드는 각 부속품의 info()들을 한번에 출력      
	   */

		GenericXmlApplicationContext ct =
				new GenericXmlApplicationContext("classpath:quiz-config.xml");
		
		Computer computer = ct.getBean("computer", Computer.class);
		computer.computerInfo();
		
		ct.close();
	}

}
