package modi.member.pac2;

import modi.member.pac1.A;

public class C {

	public C() {
		
		A a = new A();
		a.x = 1; // public
//		a.y = 2; (x) default
//		a.z = 3.14 (x) private
		
		a.method1(); // public
//		a.method2(); (x) default
//		a.method3(); (x) private
		
	}
	
}
