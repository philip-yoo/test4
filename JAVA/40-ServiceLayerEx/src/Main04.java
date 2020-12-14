import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.java.myschool.MyBatisConnectionFactory;
import study.java.myschool.model.Department;
import study.java.myschool.service.DepartmentService;
import study.java.myschool.service.impl.DepartmentServiceImpl;

public class Main04 {
	public static void main(String[] args) {
		
		/** 처리 결과를 기록할 Log4J 객체 생성*/
//		import org.apache.logging.log4j.Logger;
//		import org.apache.logging.log4j.LogManager;
		Logger logger = LogManager.getFormatterLogger(Main03.class.getName());
		
		/** 조회할 데이터의 일련번호를 저장하고 있는 Beans 객체 생성 */
		Department dept = new Department();
		dept.setDeptno(201);
		
		/** 데이터베이스 접속 */
		SqlSession session = MyBatisConnectionFactory.getSqlSession();
		
		/** 데이터 처리 수행 */
//		비지니스 로직을 위한 Service 객체 생성
		DepartmentService departmentService = new DepartmentServiceImpl(session);
//		조회 결과가 저장될 객체 선언
		Department item = null;

			try {
//				학과 삭제하기
				item = departmentService.getDepartmentItem(dept);
//				처리결과를 로그에 기록하기
				logger.debug("조회된 데이터 >> " + item.toString());
			} catch (NullPointerException e) {
//				수정된 데이터가 없는 경우
				logger.error("조회된 데이터가 없습니다.");
			} catch (Exception e) {
//				SQL문에 문제가 있는 경우.
				logger.error("데이터 조회에 실패했습니다." + e.getMessage());
			}
		
		/** 데티어베이스 접속 해제 */
		session.close();
		
	}
}