package inherit.quizz;

public class Teacher extends Person {
	
	String subject;

	@Override
	String info() {
		return super.info() + ", 담당과목: " + subject;
	}
	
}
