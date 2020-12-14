public class Java03_02 {
	public static void main(String[] args) {
		int[] arr = { 1, 9, 4, 2, 5 };
		int[] copy = new int[5];
		for (int i = 0; i < arr.length; i++) {
			int j = i;
			copy[j] = arr[i];
			System.out.println("copy[" + j + "] = " + copy[i]);
		}
	}
}