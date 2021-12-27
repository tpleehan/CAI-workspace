import java.util.Scanner;

public class ForExample {

	public static void main(String[] args) {
		
		/*
		int i = 1;
		int total = 0;

		while(i <= 10) {
			total += i;
			i++;
		}
		System.out.println(total);
		 */
		
		int total = 0;
		for (int i = 1; i <= 10; i++) {
			total += i;
		}
		
		//1~200까지의 정수 중 6의 배수이면서 12의 배수는 아닌 수를 가로로 출력 (for)
		
		for (int i = 1; i <= 200; i++) {
			if(i % 6 == 0 && i % 12 != 0) {
				System.out.print(i + " ");
			} 
		}
		
		System.out.println();
		
		//1~60000까지의 정수 중 177의 배수의 개수를 출력 (for)
		int count = 0;
		
		for (int i = 1; i <= 60000; i++) {
			if(i % 177 == 0) {
				count++;
			} 
		}
		System.out.print("1~60000 중 177의 배수의 개수: " + count + "개");
		
		System.out.println();
	
		//입력 받은 정수까지의 팩토리얼 값을 구하라.
		//팩토리얼) 5! -> 5 x 4 x 3 x 2 x 1
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수 입력: ");
		int num = sc.nextInt();
		
		int fac = 1; //팩토리얼 최종 결과를 담을 변수
		
		for (int i = 1; i <= num;  i++) {
			fac = fac * i;
		}
		
//		for (int i = num; i >= 1; i--) {
//			fac *= i;
//		}
		
		System.out.println(num + "! -> " + fac);
		
		sc.close();
	}

}
