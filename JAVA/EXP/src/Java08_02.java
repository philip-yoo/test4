import javax.swing.JOptionPane;
public class Java08_02 {
	public static void main(String[] args) {
//		다이얼로그에서 입력값 받기
		String input = JOptionPane.showInputDialog("1/2) 문장을 입력하세요.");
		String find = JOptionPane.showInputDialog("2/2) 문장에서"
		+ " 포함 여부를 검사한 단어를 입력하세요.");
		if (input == null || input.trim().equals("")) {
			System.out.println("문장이 입력되지 않았습니다.");
		} else if (input != null) {if (find == null || find.trim().equals(""))
		{System.out.println("검사할 단어가 입력되지 않았습니다.");} else {
		if (input.contains(find)) {System.out.println(find + "(이)가 검색됨.");
		} else {System.out.println(find + "(이)가 검색되지 않음.");}}}}}