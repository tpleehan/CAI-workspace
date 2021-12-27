package kr.co.jsp.score.model;

// 자바빈 클래스란
// 데이터베이스의 반복적인 작업을 쉽게 처리하기 위해 디자인하는 클래스

// 자바빈 클래스는 기본적으로 은닉(캡슐화)을 사용하여 설계한다.
// 데이터베이스와의 컬럼과 1:1로 매칭되는 멤버변수를 사용한다. (규약)

public class ScoreVO {

	private int id;
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int total;
	private double average;
	
	// 자바빈 클래스는 기본 생성자(필수) 제작한다.
	public ScoreVO() {}

	// 자바빈 클래스는 모든 필드값을 매개값으로 받는 생성자(선택사항)를 제작한다.
	public ScoreVO(int id, String name, int kor, int eng, int math, int total, double average) {
		super();
		this.id = id;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		this.total = total;
		this.average = average;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public double getAverage() {
		return average;
	}

	public void setAverage(double average) {
		this.average = average;
	}
	
}
