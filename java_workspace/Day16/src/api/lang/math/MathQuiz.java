package api.lang.math;

public class MathQuiz {
	
	public static int page(int num) {
		
		return (int) Math.ceil(num / 10.0);
		
	}

	public static void main(String[] args) {
		
		/*
		 * - 1 ~ 10이 전달되면 1이 반환되고
		 *   11 ~ 20이 전달되면 2가 반환되고
		 *   21 ~ 30이 전달되면 3이 반환되는
		 *   page 메서드를 선언 (static)
		 */
		
		System.out.println(page(34));
		
	}

}
