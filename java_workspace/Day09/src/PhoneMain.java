
public class PhoneMain {

	public static void main(String[] args) {
		
		Phone basic = new Phone();
		basic.showSpec();
		
		System.out.println("----------------------------");
		
		Phone galaxyS21 = new Phone("갤럭시 s21");
		galaxyS21.showSpec();
		
		System.out.println("----------------------------");
		
		Phone iPhone13Pro = new Phone("아이폰 13Pro", "시에라블루");
		iPhone13Pro.showSpec();
		
	}

}
