package basic.quiz;

import org.springframework.beans.factory.annotation.Autowired;

public class Computer {

	@Autowired
	private Monitor monitor;
	
	@Autowired
	private Keyboard keyboard;
	
	@Autowired
	private Mouse mouse;
	
	public void computerInfo() {
		monitor.info();
		keyboard.info();
		mouse.info();
		System.out.println("삼성 컴퓨터");
		
	}
}
