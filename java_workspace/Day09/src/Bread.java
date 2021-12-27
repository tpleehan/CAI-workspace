
public class Bread {

	String name;
	int price;
	String ingredient;
	
	//직접 기본 생성자를 생성해야 한다.
	Bread() {}
	
	//생성자를 선언 했을 경우 JVM은 기본 생성자를 생성하지 않는다.
	Bread(String bName, int bPrice, String bIngredient) {
		name = bName;
		price = bPrice;
		ingredient = bIngredient;
	}
	
	void info() {
		System.out.println("*** 빵의 정보 ***");
		System.out.println("빵 이름: " + name);
		System.out.println("빵 가격: " + price + "원");
		System.out.println("주 재료: " + ingredient);
	}

	
}
