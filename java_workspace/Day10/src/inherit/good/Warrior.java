package inherit.good;

/*
 # 자식 클래스, 하위 클래스 (Child, Sub Class)
 
 - 부모 클래스로부터 멤버변수(필드)와 메서드를 물려받는 클래스를 자식 클래스라고 한다.
 - 상속을 적용시키려면 자식 클래스 선언부의 클래스 이름 뒤에
   키워드 extends를 쓰고, 물려 받을 부모 클래스의 이름을 적어야 한다.
 */
	
public class Warrior extends Player {

	int rage;
	
	/*
	 # 메서드 오버라이딩(재 정의)
	 - 부모가 물려주는 메서드는 모든 자식들에게 맞게 설계되기 힘들기 때문에
	   부족한 점이 있거나 아예 맞지 않는 경우에는 자식 클래스 쪽에서 
	   내용을 추가하거나 수정할 수 있다. 이를 오버라이딩 이라고 한다. 
	   
	 - 만약 자식 클래스에서 부모가 물려준 메서드를 새롭게 재정의한다면
	   자식이 수정한 메서드가 우선적으로 호출된다.
	 
	 - 오버라이딩의 규칙
	 1. 부모가 물려주는 메서드와 이름이 똑같아야 한다.
	 2. 부모가 물려주는 메서드와 리턴 타입이 똑같아야 한다.
	 3. 부모가 물려주는 메서드와 매개변수의 선언이 똑같아야 한다.
	 */
	
	//alt + shift + s -> override/implement method
	@Override
	void characterInfo() {
		super.characterInfo();
		System.out.println("# 분노: " + rage);
	}
	
}
