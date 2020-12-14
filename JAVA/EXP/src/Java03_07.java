public class Java03_07 {
	public static void main(String[] args) {
		int[][] inven = { { 291, 500 }, { 586, 320 }, { 460, 100 }, { 558, 120 }, { 18, 92 }, { 72, 30 } };
		int total = 0, j = 0; // 아이템 판매 금액의 총 합
		for (int i = 0; i < inven.length; i++) {
			total += (int) (inven[i][j] * inven[i][j + 1] * 0.9);
		}
		System.out.println("총 골드의 합 : " + total + " G");
	}
}