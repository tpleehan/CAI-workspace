package api.lang.String;

import java.util.Scanner;

public class StringQuiz01 {

	public static void main(String[] args) {

		/*
		 * 1. 스캐너를 통해서 id를 입력 받는다.
		 * 2. 참고로 아이디는 공백을 포함할 수 있다. 
		 * 3. 공백을 제거한 아이디가 5글자 미만이라면 다시 입력 받는다.
		 * 4. 5글자 이상 입력되었다면 "id가 등록되었습니다." 라고 출력 후 종료
		 */
		
		Scanner sc = new Scanner(System.in);
		
		while (true) {
			System.out.print("ID를 입력하세요. ");
			String id = sc.nextLine().trim();
			id = id.replace(" ", "");
			
			if (id.length() < 5) {
				System.out.println("아이디는 5글자 이상입니다. 다시 입력하세요.");
				
			} else {
				System.out.println("ID가 등록되었습니다.");
				break;
				
			}
		}
		sc.close();

	}

}
