
public class Identifier {

	public static void main(String[] args) {
		
		//꼭 지켜야 할 규칙(지키지 않을 경우 에러가 발생한다.)
		//1. 식별자의 이름은 중복을 허용하지 않는다.
		//	 또한, 대/소문자를 철저하게 구분한다.
		
		int age = 35;
//		int age = 40; (x)
		int Age = 40;
		System.out.println(age);
		System.out.println(Age);
		
		//2. 식별자 이름은 숫자로 지정하거나 숫자로 시작하면 안된다.
//		int 700 = 365; (x)
//		int 7number = 7; (x)
		int number7111 = 7;
		int num7ber = 7;
		
		//3. 식별자 이름에 공백을 포함할 수 없다.
//		int my birth day = 20211020; (x)
		int mybirthday = 20211020;
		int myBirthDay = 20211020; //camel case
		
		//4. 식별자 이름에 쓸 수 있는 특수문자는 밑줄(_), 달러기호($)뿐이다.
		//   하지만 사용을 권장하지 않는다.
		//	 특수문자의 경우 사용하기로 약속한 곳이 지정되어 있다.
//		int customer_age = 10; //snake case (under bar 사용)
		
		//5. 키워드(예약어)는 식별자 이름으로 사용이 불가능하다.
		//   키워드는 이미 어떠한 기능을 내포하고 있는 지정 문자이다.
//		String class = "클래스"; (x)
		String Class = "클래스"; //(별로 권장하지 않음.)
		String className = "클래스";
		
		//6. 한글이나 한자 같은 식별자 이름도 지정이 가능하다.
		//	 그러나 사용을 권하지 않는다.
		int 숫자 = 10;
		String 名 = "홍길동";
		System.out.println(숫자);
		System.out.println(名);
		
	}

}
