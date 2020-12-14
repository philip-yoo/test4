import java.sql.Connection;

import study.java.daoex.dao.StudentDao;
import study.java.daoex.dao.impl.StudentDaoImpl;
import study.java.daoex.model.Student;
import study.java.helper.DBHelper;

public class Main07 {

	public static void main(String[] args) {
//		1) 데이터베이스 접속
		Connection conn = DBHelper.getInstance().open();
		
		if (conn == null) {
			System.out.println("데이터베이스 접속 실패");
			return;
		}
		
//		2) INSERT를 수행할 데이터 생성
//		--> 사용되지 않는 값(deptno)는 0(int)이나 null(String)로 지정한다.
		Student model = new Student(0, "박지윤", "vngldgld", 4, "1111111111111", "1990-10-18 00:00:00", "02)888-888", 500, 50, 101, 9903);
		
//		3) 데이터 저장
		StudentDao dao = new StudentDaoImpl(conn);
		int result = dao.insert(model);
		
//		4) 결과 판별
		System.out.println(result + "번 데이터 저장됨");
		
//		5) DB 접속 해제
		DBHelper.getInstance().close();
	}

}
