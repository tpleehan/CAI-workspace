import java.util.Scanner;

public class IfQuiz05 {

	public static void main(String[] args) {


		Scanner sc = new Scanner(System.in);
		
		/*
		 # 국어, 영어, 수학 점수를 각각 입력받아서 평균을 구하라. 
		   (평균은 소수점 첫째 자리까지 출력)
		   평균이 90점이 넘는다면, 다시 한 번 조건을 검사해서
		   95 ~ 100 -> A+
		   94 ~ 90 -> A0
		   80점대는 B, 70점대는 C, 60점대는 D, 나머지는
		   모두 F 처리하면 된다. (100점이 만점)
		    ex)
		 	 평균 점수: 95.5
		 	 당신의 학점은 A+ 이다.
		 */
		
		System.out.print("국어 점수를 입력하세요. : ");
		int kor = sc.nextInt();
		System.out.print("영어 점수를 입력하세요. : ");
		int eng = sc.nextInt();
		System.out.print("수학 점수를 입력하세요. : ");
		int math = sc.nextInt();
		
		double avg = (kor + eng + math) / 3.0;
		System.out.printf("평균 점수: %.1f점\n", avg);
		
		if (avg >= 90) {
			if (avg > 100) {
				System.out.println("잘 못된 점수 입니다.");
			} else if (avg >= 95) {
				System.out.println("당신의 학점은 A+ 입니다.");
			} else {
				System.out.println("당신의 학점은 A 입니다.");
			}
				
		} else if (avg >= 80) {
			System.out.println("당신의 학점은 B 입니다.");

		} else if (avg >= 70) {
			System.out.println("당신의 학점은 C 입니다.");
			
		} else if (avg >= 60) {
			System.out.println("당신의 학점은 D 입니다.");
			
		} else {
			System.out.println("당신의 학점은 F 입니다.");
		}
		
		sc.close();
		
	}

}
