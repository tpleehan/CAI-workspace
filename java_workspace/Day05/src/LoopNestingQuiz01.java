
public class LoopNestingQuiz01 {

	public static void main(String[] args) {
		
		/*
		 1. 구구단을 다음과 같이 가로로 출력한다.
		 
		 2단: 2x1=2 2x2=4 2x3=6 .....
		 3단: 3x1=2 3x2=4 3x3=6 .....
		 4단: 4x1=2 4x2=4 4x3=6 .....
		 
		 2. 구구단을 다음과 같이 세로로 출력한다.
		 
		 2단		3단			4단
		 2x1=2		3x1=3		4x1=4
		 2x2=4		3x2=6		4x2=8
		 2x3=6		3x3=9		4x3=12
		 .			.			.
		 .			.			.
		 .			.			.
		 */

		//Q1.
		for(int dan = 2; dan <= 9; dan++) {
			System.out.print(dan + "단: ");
			for(int hang = 1; hang <= 9; hang++) {
				System.out.printf("%dx%d=%d ", dan, hang, dan * hang);
			}
			System.out.println();
		}
		System.out.println("\n---------------------------------------\n");
		
		//Q2.
//		for(int dan = 2; dan <= 9; dan++) {
//			System.out.printf("%d단\t", dan);
//		}
//		System.out.println();
//		for(int i = 1; i <= 9; i++) {
//			for(int j = 2; j <= 9; j++) {
//				System.out.printf("%dx%d=%d\t ", j, i, j * i);
//			}
//			System.out.println();
//		}
		
		for(int hang = 0 ; hang <= 9; hang++) {
			for(int dan = 2; dan <= 9; dan++) {
				if(hang == 0) {
					System.out.print(dan + "단\t");
				} else {
					System.out.printf("%dx%d=%d\t", dan, hang, dan * hang);
				}
			}
			System.out.println();
		}
		
	}

}
