public class Java03_11 {
	public static void main(String[] args) {
		int[] price = { 209000, 109000, 119000, 109000, 94000 };
		System.out.print("상품 가격 : ");
		for (int i = 0; i < price.length; i++) {
			if (i < price.length - 1) {
				System.out.print(price[i] + ", ");
			} else {
				System.out.println(price[i]);
			}
		}
		System.out.print("낮은 가격 : ");
		for (int i = 0; i < price.length; i++) {
			for (int j = i + 1; j < price.length; j++) {
				if (price[i] > price[j]) {
					int min = price[i];
					price[i] = price[j];
					price[j] = min;
				}
			}
		}
		for (int i = 0; i < price.length; i++) {
			if (i < price.length - 1) {
				System.out.print(price[i] + ", ");
			} else {
				System.out.println(price[i]);
			}
		}
	}
}