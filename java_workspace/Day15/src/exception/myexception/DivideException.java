package exception.myexception;

public class DivideException extends Exception {

	private final int errCode;
	
	/*
	 * - 기존에 정의된 예외 클래스 외에 필요에 따라 
	 *   개발자가 새로운 예외 클래스를 정의해서 사용할 수 있다.
	 *   대부분의 경우 Exception을 상속받아서 클래스를 디자인한다.
	 */
	
//	public DivideException() {
//	
//	}
	
	public DivideException(String message, int code) {
		super(message);
		errCode = code;
	}
	
	public int getErrCode() {
		return errCode;
	}
	
}
