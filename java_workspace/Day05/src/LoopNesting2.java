import java.util.Scanner;

public class LoopNesting2 {

	public static void main(String[] args) {
		
		/*
		 - 정수를 하나 입력 받아서 해당 숫자까지의 모든 소수를
		   가로로 출력하고, 그 소수들의 개수를 구하는 로직을 작성하라.
		   
		 ex)
		 입력받은 수 -> 12
		 소수: 2 3 5 7 11
		 소수의 개수: 5개
		 */
		
		Scanner sc = new Scanner(System.in);
		System.out.print("입력: ");
		int num = sc.nextInt();
		int cnt = 0; //소수의 개수를 세어 줄 변수
		
		for(int i = 1; i <= num; i++) {
			int count = 0; //소수 판별을 위해서 약수의 개수를 세어 줄 변수.
			for(int j = 1; j <= i; j++) {
				if(i % j == 0) {
					count++;
				}
			}
			if(count == 2) {
				cnt++;
				System.out.print(i + " ");
			}
		}
		
		System.out.println("\n소수의 개수: " + cnt + "개");
		sc.close();
	}

}
