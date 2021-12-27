package obj_array;

import java.util.Scanner;

public class ScoreMain {

	public static void main(String[] args) {
		
		/*
		 * - Score 객체를 담을 수 있는 배열을 선언 배열의 크기는 100개로 지정 
		 * 
		 * - 반복문을 이용해서 사용자에게 이름, 국어, 영어, 수학 점수를 입력 받는다.
		 *   입력 받은 점수를 토대로 Score 객체를 생성 후 총점과 평균을 직접 구한다.
		 *   (직접 작성하거나 메서드를 이용해서 계산하는건 마음대로 한다.)
		 *   객체 생성 후 미리 만들어 놓은 배열에 객체를 추가한다.
		 *   이름 입력란에 '그만' 이라고 입력하면 반복문을 종료한다.
		 * 
		 * - 반복문이 종료되면 배열 내부에 있는 객체들을 순회하면서
		 *   scoreInfo()를 모두 부른다. (반복문)
		 * 
		 * 주의) 입력이 중간에 그만두어진다면, 배열의 나머지 인덱스는
		 *      모두 null로 가득 차게 된다. (null.scoreInfo() -> 에러)
		 */
		
		Scanner sc = new Scanner(System.in);
		
		Score[] scores = new Score[100];
		
//		int count = 0;
		
		for (int i = 0; i < scores.length; i++) {
			
			System.out.println("*** 학생 점수 입력 프로그램 ***");
			System.out.println("입력을 취소하려면 \"그만\"이라고 작성해주세요.");
			System.out.print("이름을 입력하세요: ");
			String name = sc.next();
			
			if (name.equals("그만")) {
				System.out.println("입력을 종료합니다.");
				break;
			}
			
			System.out.print("국어점수를 입력하세요: ");
			int kor = sc.nextInt();
			
			System.out.print("영어점수를 입력하세요: ");
			int eng = sc.nextInt();

			System.out.print("수학점수를 입력하세요: ");
			int math = sc.nextInt();
			
			scores[i] = new Score(name, kor, eng, math);
			
			/*
			Score s = new Score();
			int total = kor + eng + math;
			double avg = total / 3.0;
			scores[i] = new Score(name, kor, eng, math, total, avg);
			 */
			
		}

		System.out.println("-----------------------");
		
		for (Score s : scores) {
			if (s == null) {
				break;
			}
			s.scoreInfo();
		}

//		for (int i = 0; i < count; i++) {
//			scores[i].scoreInfo();
//		}
		
		sc.close();
	}

}
