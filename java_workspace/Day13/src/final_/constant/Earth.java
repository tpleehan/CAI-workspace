package final_.constant;

public class Earth {

	static final double RADIUS = 6400;
	
	static final double SURFACE_AREA;
	
	static {
		SURFACE_AREA = RADIUS * RADIUS * Math.PI * 4;
	}
	
}
