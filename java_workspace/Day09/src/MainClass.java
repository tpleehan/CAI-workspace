
public class MainClass {

	
	public static void main(String[] args) {
		
		Bread pizzaBread = new Bread("피자빵", 500, "밀가루");
		Bread chocoBread = new Bread("초코케이크", 1500, "초콜렛");
		
		pizzaBread.info();
		System.out.println();
		chocoBread.info();
		
	}

}
