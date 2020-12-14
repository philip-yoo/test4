public class Java02_01 {
	public static void main(String[] args) {
		double myHeight = 172, myWeight = 83;
		double standardWeight = 0, obesity = 0;
		if (myHeight >= 151) {
			standardWeight = (myHeight - 110) * 0.9;
		} else {
			standardWeight = myHeight - 110;
		}
		obesity = ((myWeight - standardWeight) / standardWeight) * 100;
		System.out.printf("표준 체중 = %.2f\n", standardWeight);
		System.out.printf("비만도 = %.2f\n", obesity);
		if (obesity <= 20) {
			System.out.println("정상(안심)");
		} else if (20 < obesity && obesity <= 30) {
			System.out.println("경도비만(주의)");
		} else if (30 < obesity && obesity <= 50) {
			System.out.println("중등도 비만!! (위험)합니다.");
		} else {
			System.out.println("고도비만!! (매우위험)합니다.");
		}
	}
}