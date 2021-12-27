import java.util.Scanner;

public class ContinueExample {

	public static void main(String[] args) {
		
		for(int i = 1; i <= 10; i++) {
			if(i == 5) {
				continue;
			}
			System.out.print(i + " ");
		}
		System.out.println("\n반복문 종료");
		
		System.out.println("\n--------------------------------");
		
		Scanner sc = new Scanner(System.in);
		System.out.println("정수를 입력하세요. ");
		
		while(true) {
			System.out.print("> ");
			int answer = sc.nextInt();
			
			if(answer == 1) {
				break;
		
			} else if (answer == 0) {
				System.out.println("다른 정수를 입력하세요.");
				continue;
			
			} else {
				System.out.println("입력한 정수와의 나눗셈 결과: " + (100 / answer));
			}
			
		}
		
		sc.close();
		
	}

}
