package thread.ex05_join;

public class MainClass {

	public static void main(String[] args) {

		TestA a = new TestA();
		Thread t = new Thread(a);
		
		t.start();
		
		try {
			/*
			 * join() 메서드는 해당 쓰레드가 종료 될 때 까지 다른 쓰레드를 정지 시킨다.
			 * 다른 쓰레드가 종료 될 때 까지 기다리다가 실행해야 하는 경우 사용한다.
			 * ex) B라는 쓰레드가 계산을 마치고 그 결과값으로 A쓰레드가 로직을 처리할 때 등등
			 */
			
			t.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		System.out.println("계산 결과: " + a.getSum());
		
	}

}
