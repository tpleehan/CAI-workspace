//1. Scanner api 로딩 (제공되는 Scanner 정보를 현재 클래스로 가져오기)
import java.util.Scanner;

public class ScannerExample {

	public static void main(String[] args) {
		
		//2. Scanner 객체 생성.
		Scanner sc = new Scanner(System.in);

		/*
		 3. Scanner의 함수들을 이용하여 데이터를 입력 받을 수 있다.
		   - next() : 공백이 없는 문자열을 입력 받는다.
		   - nextLine() : 공백을 포함한 문자열을 입력 받는다.
		   - next + 기본타입이름() : 해당 타입에 맞는 데이터를 입력 받는다.
		   ex) 
		   	 nextInt() : 정수 데이터를 입력 받는다.
		   	 nextDouble() : 실수 데이터를 입력 받는다.
		 */
		
		System.out.print("이름을 입력하세요: ");
		String name = sc.nextLine();
		System.out.print("나이를 입력하세요: ");
		int age = sc.nextInt();
		
//		System.out.println("제 이름은 " + name + "이고, 나이는 " + age + "세 입니다.");
		System.out.printf("제 이름은 %s이고, 나이는 %d세 입니다.", name, age);
		
		//4. Scanner 객체 반납
		//	 객체를 반납 -> Scanner를 메모리에서 해제.
		sc.close();
		
	}

}
