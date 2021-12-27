package inherit.quizz;

public class MainClass {

	public static void main(String[] args) {

		/*
	     - 학생(Student), 선생(Teacher), 종업원(Employee) 클래스를 생성
	     
	     - 세 클래스는 공통적으로 이름과 나이를 가지고 있다.
	     
	     - 세 클래스는 공통적으로 info() 메서드를 가지고 있다.
	       (리턴 타입: String, 이름: XXX, 나이: XXX )
	     
	     - 학생은 학번(studentId)을 가지고 있고,
	       선생은 담당 과목(subject)를 가지고 있고,
	       종업원은 부서 (departments)를 가지고 있다.
	        
	     - 부모 클래스의 이름은 Person으로 지정
	       Person 클래스 생성 후 각각의 자식 클래스 생성 하고
	       MainClass에서 정보를 출력
	     */
		
		Student stu = new Student();
		stu.name = "홍길동";
		stu.age = 21;
		stu.studentId = "a001";
		System.out.println(stu.info());
		
		System.out.println("--------------------------------");
		
		Teacher t = new Teacher();
		t.name = "김철수";
		t.age = 40;
		t.subject = "수학";
		System.out.println(t.info());
		
		System.out.println("--------------------------------");

		Employee e = new Employee();
		e.name = "김영희";
		e.age = 28;
		e.departments = "영업팀";
		System.out.println(e.info());
	
	}

}
