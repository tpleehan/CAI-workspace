import java.util.Scanner;

public class BreakQuiz2 {

	public static void main(String[] args) {
		
		/* 
		 # UP&DOWN 게임을 제작
		 1. 기준이 되는 수는 난수 범위 1~100까지로 지정한다.
		 2. 사용자에게 정답을 입력받아, 기준이 되는 수보다
		 	작은 수를 입력하면 UP, 큰 수를 입력하면 DOWN이라고 출력해서
		 	정답에 근접할 수 있도록 유도한다.
		 3. 승리 조건 횟수는 7회로 제한한다.
		 	7회가 넘어가도 정답은 계속 맞출 수 있도록 작성한다.
		 	정답을 맞췄다면, 반복문 종료와 함께 승리/패배 여부를 알려준다.
		 */
		
		Scanner sc = new Scanner(System.in);
		System.out.println("*** UP & DOWN GAME ***");
		System.out.println("# 1부터 100까지의 정수 중 숫자를 선택하세요.");
		
		int secret = (int) ((Math.random() * 100) + 1);
		int count = 0;
		
		while(true) {
			System.out.print("> ");
			int answer = sc.nextInt();
			
			if (answer > 100 || answer < 1) {
				System.out.println("입력을 제대로 해주세요.");
				continue;
			}
			
			count++;
			
			if (answer > secret) {
				System.out.println("Down");
			} else if (answer < secret) {
				System.out.println("Up");
			} else {
				System.out.println("정답입니다.");
				break;
			}
			
			if(count < 7) {
				System.out.println("정답 기회 " + (7-count) + "번 남았습니다.");
			} else {
				System.out.println("정답 기회를 모두 소진했습니다.");
				System.out.println("정답을 맞춰주시기 바랍니다.");
			}
			
		}
		
		System.out.println(count + "번 만에 맞췄습니다.");
		
		if(count <= 7) {
			System.out.println("승리했습니다.");
		} else {
			System.out.println("패배했습니다.");
		}
		
		sc.close();
		
	}

}

