package study.java;
public class MyMathHelper {
	private static MyMathHelper current;
		public static MyMathHelper getInstance() {
		if (current == null) {current = new MyMathHelper();}
		return current;}
		public static void freeInstance() { current = null; }
		private MyMathHelper() { super(); }
	public void gugu(int i) {
		for (int j = 1; j < 10; j++) {
			int num = i+j;
			System.out.println(i + " * " + j + " = " + num);}}}