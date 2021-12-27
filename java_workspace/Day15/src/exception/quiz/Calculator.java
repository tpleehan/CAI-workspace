package exception.quiz;

import java.util.Scanner;

public class Calculator {

	/*
	 * # 메서드 이름은 input이고 return type: int
	 * 1. 정수 2개를 입력받는다. 
	 * 
	 * 2. 입력된 값이 정수라면 합계를 반환한다.
	 *  
	 * 3. 예외가 발생할 수 있는 상황이라면 메서드를
	 *    강제로 종료하고 예외 메세지를 전달한다. (생성되는 예외 객체는 Exception)
	 *    (throw를 사용해서 예외 객체를 생성할 때, 
	 *     생성자의 매개값으로 원하는 메세지를 문자열 형태로 전달하면 된다.)
	 *      
	 * 4. MainClass를 생성해서 객체 생성 후 메서드를 호출한다.
	 *    예외가 발생했을 시 e.getMessage()를 호출해서 메세지 내용을 출력 
	 *  
	 * 5. Scanner의 close()는 항상 진행
	 */
	
	public int input() throws Exception {
		Scanner sc = new Scanner(System.in);
		
		try {
			System.out.print("정수1: ");
			int num1 = sc.nextInt();
			
			System.out.print("정수2: ");
			int num2 = sc.nextInt();
			
			return num1 + num2;
			
		} catch (Exception e) {
			throw new Exception("정수를 입력하시기 바랍니다.");
			
		} finally {
			sc.close();
			
		}
		
	}
	
}
