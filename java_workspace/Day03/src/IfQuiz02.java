import java.util.Scanner;

public class IfQuiz02 {

	public static void main(String[] args) {
		
		/*
		 - 정수를 2개 입력 받아서, 두 정수 중 어느 수가 큰 수인지 혹은 같은 수인지 판별한다.
		 	ex)
		 		입력 받은 수 : 4, 7 -> 7이 큰 수 입니다.
		 		입력 받은 수 : 10, 3 -> 10이 큰 수 입니다.
		 		입력 받은 수 : 5, 5 -> 같은 수 입니다.
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("첫 번째 정수를 입력하세요. : ");
		int num1 = sc.nextInt();
		System.out.print("두 번째 정수를 입력하세요. : ");
		int num2 = sc.nextInt();
		
		if(num1 > num2) {
			System.out.println(num1 + "이(가) 큰 수 입니다.");
		} else if(num1 < num2) {
			System.out.println(num2 + "이(가) 큰 수 입니다.");
		} else {
			System.out.println("같은 수 입니다.");
		} 
			
		sc.close();
		
	}

}
