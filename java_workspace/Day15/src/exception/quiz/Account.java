package exception.quiz;

public class Account {

	/*
	 * 1. 잔액(balance: long)으로 멤버변수를 선언 (private 제한자) 
	 * 
	 * 2. deposit: 입금기능
	 *    withDraw: 출금기능
	 *    getBalance: 잔액확인기능 (return -> long)
	 * 
	 * 3. withDraw에서 잔액이 출금금액보다 작다면 
	 *    예외를 발생시키는 코드를 작성(MyException)
	 * 
	 * 4. AccountMain이라는 클래스를 작성하셔서 예외처리가 잘 되는지 확인
	 * 
	 */
	
	private long balance;
	
	public Account(int money) throws MyException {
		if (money <= 0) {
			throw new MyException("입금을 해야 계좌를 개설할 수 있습니다.");
			
		}
		this.balance = money;
	}
	
	public void deposit(int money) throws MyException {
		
		if (money <= 0) {
			throw new MyException("입금액은 0원 이상이어야 합니다.");
		}
		
		this.balance += money;
		
	}
	
	public void withDraw(int money) throws Exception {
		
		if (this.balance < money) {
			throw new MyException("잔액이 부족합니다.\n" + "부족한 금액: " + (money - this.balance) + "원");
			
		} else {
			this.balance -= money;
			return;
		}
	}
	
	public long getBalance() {
		return this.balance;
		
	}
}
