import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import study.java.helper.DBHelper;

public class Main01 {
	public static void main(String[] args) {

		/** 저장할 데이터와 SQL 구문 정의하기 */
//		저장할 데이터
		String dname = "정보통신과";
		String loc = "공학관";

//		'department'테이블에 `컴퓨터정보과`를 추가하기 위한 SQL의 템플릿
//		deptno 칼럼은 AUTO_INCREMENT 이므로 INSERT에서 명시하지 않아도 된다.

		String sql = "INSERT INTO department (dname, loc) VALUES (?, ?)";

		/** DBHelper를 통한 DB 접속 처리 */
		DBHelper db = DBHelper.getInstance();
		Connection conn = db.open();

		/** SQL 구문 실행하기 */
//		SQL문의 템플릿을 사용하여 쿼리 실행을 준비하는 객체
		PreparedStatement pstmt = null;
//		처리결과를 받을 객체
		ResultSet rs = null;

//		결과값 (저장된 데이터의 수)
		int result = 0;
//		결과값 (생성된 AUTO_INCREMENT 값)
		int autoGeneratedID = 0;

		try {

//		pstmt 객체 할당 --> AUTO_INCREMENT 조회 옵션 사용함
			pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

//		템플릿에 데이터 설정
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);

//		SQL문 실행하기 --> 결과 행 리턴됨
			result = pstmt.executeUpdate();

//		생성된 AUTO)INCREMENT 값 얻기
			rs = pstmt.getGeneratedKeys();
			rs.next();
			autoGeneratedID = rs.getInt(1);

		} catch (SQLException e) {
			System.out.println("MySQL SQL Fail : " + e.getMessage());
		} finally {
			if (rs != null) {
//				객체 닫기
				try {
					rs.close();
				} catch (Exception e) {
				}
			}
		}

		/** 결과출력 */
		System.out.println(result + " Record Insert");
		System.out.println("New Deptno = " + autoGeneratedID);

		/** DB 접속 해제 */
		db.close();

	}
}