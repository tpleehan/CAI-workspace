package final_.method;

public class Parent {

	/*
	 * - 클래스 선언 시 final을 사용하면 해당 클래스는 상속이 불가능해진다.
	 *  
	 * - final 클래스는 자식 클래스를 가질 수 없고, 
	 *   오직 외부에서 객체 생성을 통해서만 가능하다.
	 *   
	 * - 더 이상의 개념 확장을 막기 위해 사용한다.
	 */
	
	void method1() {}
	void method2() {}
	final void method3() {}
	
}
