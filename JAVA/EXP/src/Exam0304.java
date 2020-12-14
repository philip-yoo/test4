
public class Exam0304 {

	public static void main(String[] args) {

		int[] arr1 = { 1, 9, 4, 2, 5 };
		int[] arr2 = { 5, 8, 6, 3, 1 };

		System.out.println("일치하는 데이터는 총 " + compareArray(arr1, arr2) + "개 입니다.");

	}

	public static int compareArray(int[] arr1, int[] arr2) {

		int sum = 0;

		for (int i = 0; i < 5; i++) {
			for (int j = 0; j < 5; j++) {
				if (arr1[i] == arr2[j]) {
					sum += 1;
				}

			}

		}
		return sum;
	}

}
