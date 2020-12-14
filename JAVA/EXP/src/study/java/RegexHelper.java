package study.java;
import java.util.regex.Pattern;
public class RegexHelper {
	private static RegexHelper current = null;
		public static RegexHelper getInstance() {
		if (current == null) {current = new RegexHelper();}
		return current;}
		public static void freeInstance() { current = null; }
		private RegexHelper() { super(); }
		
		
		/** 주어진 문자열이 공백이거나 null인지를 검사
		 * @param	str - 검사할 문자열
		 * @return	boolean - 공백, null이 아닐 경우 true 리턴 */
		public boolean isValue(String str) {
			boolean result = false;
			if (str != null) {
				result = !str.trim().equals("");
			}
			return result;
		}
				/** "-"없이 주민번호에 대한 형식 검사
		 * @param	str - 검사할 문자열
		 * @return	boolean - 형식에 맞을 경우 true, 맞지 않을 경우 false */
		public boolean isJumin(String str) {
			boolean result = false;
			if (isValue(str)) {
				result = Pattern.matches("^\\d{6}[1-4]\\d{6}", str);
			}
			return result;
		}}