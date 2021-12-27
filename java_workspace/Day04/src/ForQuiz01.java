
public class ForQuiz01 {

	public static void main(String[] args) {
		
		//2~19까지의 난수를 생성하여 구구단을 출력 (for)
		//19행까지 출력
		
		int dan = (int) ((Math.random() * 18) + 2);
		
		for(int hang = 1; hang <= 19; hang++) {
			System.out.println(dan + " x " + hang + " = " + dan * hang);
		}
		
		
		
	}

}
