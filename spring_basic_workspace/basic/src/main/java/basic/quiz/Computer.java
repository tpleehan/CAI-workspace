package basic.quiz;

import org.springframework.beans.factory.annotation.Autowired;

public class Computer {
	
	/**
	 * 객체, 변수에 @Autowired 선언하면 생성자를 생성할 필요 없다.
	 * 
	 * @Qualifier 는 단독적으로 사용할 수 없으며, @Autowired 와 함께 사용된다. 
	 */

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
