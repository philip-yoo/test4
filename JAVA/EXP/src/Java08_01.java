import java.util.Calendar;
import java.util.regex.Pattern;
import javax.swing.JOptionPane;
public class Java08_01 {
	public static void main(String[] args) {
//		현재 년도
		int now_year = Calendar.getInstance().get(Calendar.YEAR);
//		다이얼로그에서 입력값 받기
		String jumin = JOptionPane.showInputDialog(
				"당신의 주민번호를 '-' 없이 입력해 주세요.");
//		값 출력하기
		System.out.println("년도 : " + now_year + " / 입력값 : " + jumin);
		/** 1) 주민번호 형식 검사.
		 * 형식에 맞지 않을 경우 return 처리
		 * --> main 메서드 종료
		 * --> 프로그램 종료 */
		boolean isJumin = Pattern.matches("^\\d{6}[1-4]\\d{6}", jumin);
		if (!isJumin) {
			System.out.println("주민번호 형식에 맞지 않습니다.");
			return;}		
		/** 2) 주민번호를 사용하여 나이 계산하기 */
		String yy = jumin.substring(0, 2);
		int b = Integer.parseInt(yy);
		int a = 1900 + b;
		int year = now_year - a;
		System.out.println(year);	
	}}