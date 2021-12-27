import java.util.Scanner;

public class WhileQuiz02 {

	public static void main(String[] args) {
		
		//입력 받은 수의 약수의 총합을 구하라.
		//입력 받은 값: 12 -> 1 2 3 4 5 6 12 -> 28
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수를 입력하세요: ");
		int num = sc.nextInt();
		
		int i = 1; // begin
		int total = 0; //누적합을 담을 변수
		
		while (i <= num) {
			if (num % i == 0) {
				total += i;
			}
			i++;
			
		}
		System.out.println("입력받은 값: " + num + " -> " + total);
		
		sc.close();
		
	}

}
