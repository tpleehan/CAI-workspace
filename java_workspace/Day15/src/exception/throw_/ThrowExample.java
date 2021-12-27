package exception.throw_;

public class ThrowExample {

	static int calcTotal(int num) throws Exception {
		
		/*
		 * # 예외를 강제로 발생시키는 키워드 throw
		 * 
		 * - 메서드나 생성자 실행 도중에 throw 키워드를 만나면
		 *   즉시 throw로 생성한 예외가 발생한다.
		 *   
		 * - 예외가 발생되면 실행되던 코드는 즉시 중단되고 
		 *   예외를 처리할 수 있는 catch문으로 바로 이동하게 된다.
		 * 
		 * - 적절히 활용하면 void가 아닌 메서드를 강제로 종료시킬 때 사용된다.
		 *   또한, 에러 상황이 아니지만 프로그램 실행에
		 *   적절치 못한 상황에서 코드의 흐름을 바꿔 줄 수 가 있다.
		 */
		
		if(num <= 0) {
			// 이 시점에서 강제로 예외를 발생 시킨다.
			throw new Exception();
			
//			System.out.println("매개값을 양수로 주세요.");
//			return 0;
		}
		
		int total = 0;
		for (int i = 1; i <= num; i++) {
			total += i;
			
		}
		return total;
	}
	
	public static void main(String[] args) {
		
		try {
			System.out.println(calcTotal(100));
			System.out.println(calcTotal(-120));
			
		} catch (Exception e) {
			System.out.println("매개값을 양수로 주세요.");
			
		}

		
	}

}
