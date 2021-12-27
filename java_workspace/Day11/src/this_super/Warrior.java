package this_super;
	
public class Warrior extends Player {

	int rage;
	
	/*
	Warrior() {
		// 모든 생성자에는 super()가 기본 내장되어 있다.
		// 자식 객체가 생성될 때는 부모의 객체도 생성이 되어야
		// 부모의 속성과 기능이 실존하게 되고, 자식에게 물려 줄 수 있기 때문이다.
		super(); 
	}
	*/
	
	Warrior(String name) {
		super(name);
		this.rage = 60;
	}
	
	@Override
	void characterInfo() {
		super.characterInfo();
		System.out.println("# 분노: " + rage);
	}
	
}
