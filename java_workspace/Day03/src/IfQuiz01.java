import java.util.Scanner;

public class IfQuiz01 {

	public static void main(String[] args) {

		/*
		 - 요구사항
		  1. 사용자는 신장과 나이의 정보를 숫자로 입력할 수 있어야 한다.
		  2. 프로그램은 2가지 정보를 입력하고 엔터를 누르면 조건에 따라 다른 결과를 출력해야 한다.
		  3. 키가 140이상이고 나이가 8세 이상인 2개의 조건을 모두 만족할 경우 
		  	 "놀이기구에 탑승할 수 없습니다." 를 출력해야 한다.
		  4. 두 개의 조건 중 하나라도 만족하지 않을 시 "놀이기구에 탑승할 수 없습니다." 를 출력해야 한다.
		  5. 조건과 관계없이 "오늘 하루 즐거운 시간 되세요." 를 출력해야 한다.
		 
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("신장을 입력하세요. : ");
		int height = sc.nextInt();
		System.out.print("나이를 입력하세요. : ");
		int age = sc.nextInt();
		
		if (height >= 140 && age >= 8) {
			System.out.println("놀이기구에 탑승할 수 있습니다.");
		} else {
			System.out.println("놀이기구에 탑승할 수 없습니다.");
		}
		System.out.println("오늘 하루 즐거운 시간 되세요.");
		
		sc.close();
	}

}
