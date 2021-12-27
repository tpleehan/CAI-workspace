package exception.basic;

import java.util.Scanner;

public class MainClass2 {

	public static void main(String[] args) {
		
		/*
		 * - 난수 2개 생성해서 덧셈 문제를 만들기 (1~100)
		 * 
		 * - 만약 정답을 입력하는 곳에 정수가 아닌 문자열 등을
		 *   입력했을 시 잘못 입력했다고 출력을 하고 잘못 입력한 횟수를 센다. 
		 * 
		 * - 사용자가 0을 입력하면 프로그램이 종료되고
		 *   종료 시 정답 횟수와 오답 횟수, 잘못 입력한 횟수도 출력
		 */
		
		Scanner sc = new Scanner(System.in);
		int cCount = 0;
		int iCount = 0;
		int eCount = 0;
		
		System.out.println("*** 연산 퀴즈 ***");
		System.out.println("종료하시려면 0을 입력하세요.");
		
		while (true) {
			
			int rn1 = (int) ((Math.random() * 100) + 1);
			int rn2 = (int) ((Math.random() * 100) + 1);
			
			int correct = rn1 + rn2;
			
			System.out.printf("%d + %d = ???\n", rn1, rn2);
			
			int answer;
			try {
				System.out.print("> ");
				answer = sc.nextInt();
				
			} catch (Exception e) {
				System.out.println("잘 못 입력했습니다.");
				eCount++;
				sc.nextLine();
				continue;
			}
				
			if (answer == 0) {
				System.out.println("종료합니다.");
				break;
				
			} else if(answer == correct) {
				System.out.println("정답입니다.");
				cCount++;
				
			} else {
				System.out.println("오답입니다.");
				iCount++;
				
			}
				
		}
		
		System.out.println("-------------------------");
		System.out.println("정답 횟수: " + cCount + "회");
		System.out.println("오답 횟수: " + iCount + "회");
		System.out.println("잘못 입력한 횟수: " + eCount + "회");
		
		sc.close();
	}

}
