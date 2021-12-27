package poly.player;

public class Mage extends Player {

	int mana;
	
	Mage(String name) {
		super(name);
		this.mana = 100;
	}
	
	Player p = new Player();
	
	public void blizzard(Player[] target) {
		
		System.out.println(this.name + "님이 눈보라 시전" );
		System.out.println("--------------------------------");
		
		for (Player p : target) {
			int damege = (int) ((Math.random() * 6) + 10);
			p.hp -= damege;
			
			System.out.println(p.name + "님이 " + damege + "의 피해를 입었습니다."
					+  "(남은 체력: " + p.hp + ")");
			
		}
		
	}
	
	@Override
	void characterInfo() {
		super.characterInfo();
		System.out.println("# 정신력: " + mana);
	}
	
}
