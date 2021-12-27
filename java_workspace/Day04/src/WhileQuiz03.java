import java.util.Scanner;

public class WhileQuiz03 {

	public static void main(String[] args) {
		
		/*
		 1. 정수를 두개 입력 받는다. (x, y)
		 2. x부터 y까지의 누적합계를 while을 사용하여 구하는 코드를 작성
		 ex) 입력 3, 7 -> "3부터 7까지의 누적합계: 25"
		 
		 처음에는 x에 무조건 작은 값을 들어올 것이라고 예상하고 작성한다.
		 완료 후 x에 큰 값이 들어왔을 경우 어떻게 대처할 지 생각하라.
		 (x에 큰 값이 들어와도 정삭적으로 출력이 되어야 한다.
		 입력: 7, 3 -> "3부터 7까지의 누적합계: 25")
		 - while문을 if else 로 나눠서 두번 쓰는 것을 지양
		 
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("첫 번째 정수를 입력하세요: ");
		int num1 = sc.nextInt();
		
		System.out.print("두 번째 정수를 입력하세요: ");
		int num2 = sc.nextInt();
		
		if (num1 > num2) {
			int temp = num2;
			num2 = num1;
			num1 = temp;
		}

		int total = 0;
		
		int start = num1;
		
		while (start <= num2) {
			total += start;
			start++;
		
		}
		
		System.out.println(num1 + "부터 " + num2 +  "까지의 누적합계: " + total);
		
		sc.close();
		
	}

}
