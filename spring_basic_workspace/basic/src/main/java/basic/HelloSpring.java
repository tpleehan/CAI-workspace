package basic;

import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloSpring {

	public static void main(String[] args) {

		// 평소에 사용하던 객체 사용 방식
//		SpringTest st = new SpringTest();
//		st.hello();

		GenericXmlApplicationContext ct =
				new GenericXmlApplicationContext("classpath:test-config.xml");
		
		SpringTest st = ct.getBean("test", SpringTest.class);
		st.hello();
		
		ct.close();
		
	}

}
