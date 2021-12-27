import java.util.Scanner;

public class IfQuiz04 {

	public static void main(String[] args) {

		/*
		 - 정수 3개를 입력 받습니다.
		 - 가장 큰 값, 가장 작은 값, 중간 값을 구해서 출력한다.
		 
		 # max, mid, min이라는 변수를 미리 선언하여 판별이 될 때마다
		   각각의 변수에 값을 넣고 마지막에 한번에 출력하면 된다.
		 */

		Scanner sc = new Scanner(System.in);
		
		System.out.print("첫 번째 정수를 입력하세요. : ");
		int num1 = sc.nextInt();
		System.out.print("두 번째 정수를 입력하세요. : ");
		int num2 = sc.nextInt();
		System.out.print("세 번째 정수를 입력하세요. : ");
		int num3 = sc.nextInt();
		
		int max, mid, min;
		
		if (num1 > num2 && num1 > num3) { //num1이 제일 큰 값
			max = num1;
			if (num2 > num3) {
				mid = num2;
				min = num3;
			} else {
				mid = num3;
				min = num2;
			}
		} else if (num2 > num1 && num2 > num3) { //num2가 제일 큰 값
			max = num2;
			if (num1 > num3) {
				mid = num1;
				min = num3;
			} else {
				mid = num3;
				min = num1;
			}
			
		} else { //num3가 제일 큰 값
			max = num3;
			if (num1 > num2) {
				mid = num1;
				min = num2;
			} else {
				mid = num2;
				min = num1;
			}
		}
		
		System.out.println("최대값 : " + max + " 입니다.");
		System.out.println("중간값 : " + mid + " 입니다.");
		System.out.println("최소값 : " + min + " 입니다.");
		
		sc.close();
	}

}
