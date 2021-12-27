package lambda.basic;

public class Person {

	public void greet(Say01 say) {
		say.talking();
	}

	public void greet(Say02 say) {
		say.talking();
	}
	
	public void greet(Say03 say) {
		say.talking("안녕하세요");
	}
	
	public String greet(Say04 say) {
		String result = say.talking("반갑습니다.", 3);
		return result;
	}

}
