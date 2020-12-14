public class Rect extends Shape {
	/**
	 * 생성자
	 * @param width -가로길이
	 * @param height -세로길이
	 * */
	public Rect(int width, int height) {
		super(width, height); }
	
	public int getArea() {
		int x = this.getWidth();
		int y = this.getHeight();
		int z = x * y;
		return z;
	}
	
	public int getRound() {
		int x = this.getWidth();
		int y = this.getHeight();
		int z = (x * 2) + (y * 2);
		return z;
	}
	
	public int getArea(int x, int y) {
		setWidth(x);
		setHeight(y);
		int z = x * y;
		return z;
		}
	public int getRound(int x, int y) {
	;
		setWidth(x);
		setHeight(y);
		int z = (x * 2) + (y * 2);
		return z;}
}