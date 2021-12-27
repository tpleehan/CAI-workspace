package encap.good;

public class MainClass {

	public static void main(String[] args) {

		MyBirth my = new MyBirth();
//		my.day = 25; (x)
		my.setYear(2021);
		my.setMonth(11);
		my.setDay(02);
		System.out.printf("내 생일은 %d년 %d월 %d일 입니다.\n", 
				my.getYear("abc1234"), my.getMonth(), my.getDay());
		
	}

}
