package inherit.quizz;

public class Student extends Person {

	String studentId;
	
	@Override
	String info() {
		return super.info() + ", 학번: " + studentId;
	}
	
}
