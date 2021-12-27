package modi.protec.pac2;

import modi.protec.pac1.A;

public class C extends A {

//	A b = new A(30); (x) protected
//	A a2 = new A(5.67); (x) default
	
	public C() {
		
		/*
		 - protected 제한자는 패키지가 다른 경우
		   두 클래스 사이에 상속 관계가 있다면
		   super 키워드를 통해 참조를 허용한다.
		 */
		
		super(30);
//		super(5.67); (x) default
		
		super.x = 1;
//		super.y = 2; (x) default
		
		super.method1();
//		super.method2(); (x) default
		
//		A a = new A(30); (x)
		
	}
	
}
