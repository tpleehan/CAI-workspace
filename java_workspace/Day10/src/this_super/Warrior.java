package this_super;
	
public class Warrior extends Player {

	int rage;
	
	@Override
	void characterInfo() {
		super.characterInfo();
		System.out.println("# 분노: " + rage);
	}
	
}
