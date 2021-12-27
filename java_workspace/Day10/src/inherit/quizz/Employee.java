package inherit.quizz;

public class Employee extends Person {

	String departments;

	@Override
	String info() {
		return super.info() + ", 부서: " + departments;
	}

}
