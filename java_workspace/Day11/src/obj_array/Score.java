package obj_array;

public class Score {

	/*
	 * - 이름, 국어, 영어, 수학, 총점, 평균(double)
	 *   담을 수 있는 객체를 디자인
	 * 
	 * - 학생의 모든 정보를 한 눈에 확인할 수 있도록
	 *   scoreInfo() 메서드를 선언
	 *   메서드 내부에는 출력문을 이용해서 모든 정보를 출력
	 *   
	 * - 캡슐화를 구현해서 작성
	 */
	
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int total;
	private double avg;
	
	public Score() {
		
	}
	
	public Score(String name, int kor, int eng, int math) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		total = kor + eng + math;
		avg = total / 3.0;
	}


	public String getName() {
		return name;
	}


	public int getKor() {
		return kor;
	}


	public int getEng() {
		return eng;
	}


	public int getMath() {
		return math;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public double getAvg() {
		return avg;
	}


	public void setAvg(double avg) {
		this.avg = avg;
	}

	public void scoreInfo() {
		System.out.println("*** 학생의 정보 ***");
		System.out.println("이름: " + this.name);
		System.out.println("국어점수: " + this.kor + "점");
		System.out.println("영어점수: " + this.eng + "점");
		System.out.println("수학점수: " + this.math + "점");
		System.out.println("총점: " + this.total + "점");
		System.out.printf("평균점수: %.2f점 ", this.avg);
		System.out.println();
	}
	
}
