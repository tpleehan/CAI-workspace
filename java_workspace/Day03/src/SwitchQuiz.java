import java.util.Scanner;

public class SwitchQuiz {

	public static void main(String[] args) {
		
		/*
		 - 정수를 하나 입력받고, 연산자를 하나 입력 받는다.
		   다시 정수를 입력받아서, 사용자가 선택한 연산자를 기준으로
		   연산 결과를 출력하자. (switch문 사용)
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수1 : ");
		int num1 = sc.nextInt();
		
		System.out.print("연산을 선택하세요 [+,-,*,/] : ");
		String operator = sc.next();
		
		System.out.print("정수2 : ");
		int num2 = sc.nextInt();
			
		switch (operator) {
			
		case "+" :
			System.out.println("두 수의 덧셈은: " + (num1 + num2));
			break;
		
		case "-" :
			System.out.println("두 수의 뺄셈은: " + (num1 - num2));
			break;
		
		case "*" :
			System.out.println("두 수의 곱셈은: " + (num1 * num2));
			break;
		
		case "/" :
			System.out.println("두 수의 나눗셈은: " + (num1 / num2));
			break;	
		
		default :
			System.out.println("사칙연산 기호를 입력해주세요.");
			System.out.println("[+,-,*,/]");
		}
		
		sc.close();
	}

}
