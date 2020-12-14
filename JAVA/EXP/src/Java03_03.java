public class Java03_03 {
	public static int[] printArray(int[] arr) {
		int j = 0;
		for (int i = arr.length - 1; i >= 0; i--) {
			System.out.println("arr[" + j + "] = " + arr[i]);
			j++;
		}
		return arr;
	}

	public static void main(String[] args) {
		int[] arr = { 1, 9, 4, 2, 5 };
		printArray(arr);
	}
}