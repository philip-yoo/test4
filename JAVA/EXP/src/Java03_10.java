public class Java03_10 {
	public static void main(String[] args) {
		int[] price = { 38000, 20000, 17900, 17900 };
		int[] qty = { 6, 4, 3, 5 };
		int[] sum = new int[4];
		int free = 0 ;
		for (int i = 0; i < price.length; i++) {
			sum[i] = price[i] * qty[i];
			if (sum[i] >= 80000) {
				free++;
			}
		}
		System.out.println("무료 배송 학몽 : " + free + "건");
	}
}