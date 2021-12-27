import java.util.Scanner;

public class MethodQuiz03 {

	static int calcGCD(int num1, int num2) {
		/*
		int min;
		int gcd = 0;
		if(num1 < num2) {
			min = num1;
			
		} else {
			
			min = num2;
		}

		for(int i = 1; i <= min; i++) {
			if(num1 % i == 0 && num2 % i == 0) {
				gcd = i;
			}
		}
		
		return gcd;
		 */
		//무조건 n1이 크다고 가정했기 때문에 
		//n2가 만약 더 크다면 값을 서로 바꿔주는 if문 로직이다.
		
		if (num1 < num2) {
			int temp = num1;
			num1 = num2;
			num2 = temp;  
		}
//		1.
		while(num2 > 0) {
			int temp = num1;
			num1 = num2;
			num2 = temp % num2;
		}
		
		return num1;
		
		/*
		 2.
		 while(num1 % num2 != 0) {
			int temp = num1 % num2;
		 	num1 = num2;
		 	num2 = temp;
		 }
		 return num2;
		 */
	}
	
	public static void main(String[] args) {

		/*
		 - 정수 2개를 입력 받아서(main) 
		   두 숫자의 최대 공약수를 구해주는
		   메서드 calcGCD()를 선언
		    
		 - 최대공약수: 두 숫자의 공통된 약수 중 가장 큰 약수
		   ex) 12, 18의 최대공약수 -> 6
		 # 임의의 두 자연수 a, b가 주어졌을 때, 둘 중 큰 값이 a라고 가정.
		   a를 b로 나눈 나머지를 n이라고 했을 때 (a % b -> n)
		   n이 0이 된다면 b가 최대 공약수
		 # 만약 n이 0이 아니라면 (나누어 떨어지지 않았다면)
		   a의 자리에 b값을 다시 넣고 b의 자리에 n의 값을 대입한 후에 위의 행동을 반복 
		 */
		
		Scanner sc = new Scanner(System.in);
		System.out.print("num1 입력> ");
		int num1 = sc.nextInt();
		System.out.print("num2 입력> ");
		int num2 = sc.nextInt();
		
		int gcd = calcGCD(num1, num2);
		
		System.out.println("최대 공약수: " + gcd);
		System.out.printf("%d와 %d의 최대 공약수: %d\n", num1, num2, calcGCD(num1, num2));
		
		
	}

}
