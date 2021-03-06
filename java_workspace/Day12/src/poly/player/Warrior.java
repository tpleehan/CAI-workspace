package poly.player;
	
public class Warrior extends Player {

	int rage;
	
	Warrior(String name) {
		super(name);
		this.rage = 60;
	}
	
	public void rush(Player p) {
		
		/*
		 * 1. rush라는 기술을 사용하는 사람의 이름을 적절한 키워드를 사용하여 출력
		 * 
		 * 2. 이 기술을 맞는 사람의 피해량을 출력
         *    전사는 10의 피해, 마법사는 20의 피해, 사냥꾼은 15의 피해를 각각 입는다.
		 * 
		 * 3. 직업별로 다른 피해량을 instanceof 키워드를 사용하여 구분해서 출력
		 * 
		 * 4. 남은 체력들도 마찬가지로 출력
		 */
		
		System.out.println(this.name + "님이 " + p.name + "님에게 돌진을 시전 했습니다.");

		if (p instanceof Warrior) {
			p.hp -= 10;
			System.out.println(p.name + "(전사)님이 10의 피해를 입었습니다.");

		} else if (p instanceof Mage) {
			p.hp -= 20;
			System.out.println(p.name + "(마법사)님이 20의 피해를 입었습니다.");
			
		} else if (p instanceof Hunter){
			p.hp -= 15;
			System.out.println(p.name + "(사냥꾼)님이 15의 피해를 입었습니다.");
		} 
		System.out.println(p.name + "님의 남은 체력: " + p.hp);
		System.out.println("--------------------------------");
		
		/*
		String job = null;
		int damage = 0;
		if (p instanceof Warrior) {
			damage = 10;
			job = "전사";

		} else if (p instanceof Mage) {
			damage = 20;
			job = "마법사";
		
		} else if (p instanceof Hunter) {
			damage = 150;
			job = "사냥꾼";
		}
		
		p.hp -= damage;
		System.out.printf("%s(%s)님이 %d의 피해를 입었습니다.\n", p.name, job, damage);
		 */
	}
	
	
	@Override
	void characterInfo() {
		super.characterInfo();
		System.out.println("# 분노: " + rage);
	}
	
}
