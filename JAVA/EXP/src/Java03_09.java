public class Java03_09 {
	public static void main(String[] args) {
		int[] price = { 38000, 20000, 17900, 17900 };
		int[] qty = { 6, 4, 3, 5 };
		int[] sum = new int[4];
		int max = sum[0];
		for (int i = 0; i < price.length; i++) {
			sum[i] = price[i] * qty[i];
			if (sum[i] >= max) {
				max = sum[i];
			}
		}
		System.out.println("가장 높은 상품 금액 : " + max + "원");
	}
}