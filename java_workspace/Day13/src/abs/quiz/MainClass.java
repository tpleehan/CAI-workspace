package abs.quiz;

public class MainClass {

	public static void main(String[] args) {


		/*
		 * - Shape를 상속받는 Circle과 Rect 클래스를 생성
		 * 
		 * - Circle 객체를 생성할 때, 반지름도 받아서 초기화 할 수 있는 생성자를 선언
         *   Rect 객체를 생성할 때, 이름과 변의 길이를 받도록 처리
		 * 
		 * - 오버라이딩이 강제되는 메서드에는 각 도형의 넓이를 구하는 로직을 알아서 작성
		 * 
		 * - MainClass에서 길이가 5인 정사각형, 반지름이 4인 원의 모든 내용을 호출
		 */

		Shape r = new Rect("정사각형", 5);
		System.out.println(r.getName());
		System.out.println("넓이: " + r.getArea());
		
		System.out.println("---------------------------------");
		
		Shape c = new Circle("원", 4);
		System.out.println(c.getName());
		System.out.printf("넓이: %.2f\n", c.getArea());
				
	}

}
