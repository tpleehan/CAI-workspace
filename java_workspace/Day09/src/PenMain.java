
public class PenMain {

	public static void main(String[] args) {
		
		//설계도에 작성한 속성과 기능을 사용하려면
		//반드시 실체(객체)를 생성해야 한다.
		//클래스만 제작된 상태에선 아무 기능도 사용할 수 없다.
		
		//객체 생성 문법: 클래스타입 변수명 = new 클래스이름();
		Pen redPen = new Pen();
		
		//참조 연산자(.)를 통해 객체로 접근한 뒤 속성을 지정하고 기능을 사용한다.
		redPen.color = "빨간";
		redPen.price = 500;
		
		Pen bluePen = new Pen();
		bluePen.color = "파란";
		bluePen.price = 600;

		redPen.write();
		bluePen.write();
		
		redPen.priceInfo();
		bluePen.priceInfo();
	}

}
