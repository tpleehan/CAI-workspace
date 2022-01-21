package basic.quiz;

import org.springframework.beans.factory.annotation.Autowired;

public class Computer {

	@Autowired
	private Monitor monitor;
	
	@Autowired
	private Keyboard keyboard;
	
	@Autowired
	private Mouse mouse;
	
	/*
	예시2번) - 생성자를 통한 어노테이션
	@Autowired
	public Computer(Monitor monitor, Keyboard keyboard, Mouse mouse) {
		super();
		this.monitor = monitor;
		this.keyboard = keyboard;
		this.mouse = mouse;
	}
	*/

	public void computerInfo() {
		System.out.println("*** 컴퓨터의 정보 ***");
		System.out.println("삼성 컴퓨터");
		monitor.info();
		keyboard.info();
		mouse.info();
		
	}
}
