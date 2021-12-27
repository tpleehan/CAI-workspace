
public class Account {

	String name;
	int password;
	int balance;
	
	Account() {}
	
	Account(String aName, int aPassword, int aBalance) {
		name = aName;
		password = aPassword;
		balance = aBalance;
	}
	
	//입금기능
	void deposit(int money) {
		if(money <= 0) {
			System.out.println("입금액은 0원 이상이어야 합니다.");
			return;
		} 
		balance += money;
	}
	
	//출금기능
	void withDrwa(int money, int pw) {
		if (pw == password) {
			if(money > balance) {
				System.out.println("잔액이 부족합니다.");
				
			} else {

				balance -= money;
				
			}
			
		} else {
			System.out.println("비밀번호가 틀렸습니다.");
		}
		
	}
	
	//잔액조회 기능
	int getbalance() {
		return balance;
	}
}
