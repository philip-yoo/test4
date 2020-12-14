<%@page import="study.java.myschool.service.impl.DepartmentServiceImpl"%>
<%@page import="study.java.myschool.service.DepartmentService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.java.myschool.model.Department"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	//파라미터의 문자열 셋을 설정한다. (페이지 상단에서 최초 1회)
	request.setCharacterEncoding("UTF-8");
	//<input>태그의 name속성값을 사용하여 사용자의 입력값을 받는다.
	String Dname = request.getParameter("Dname");
	String Loc = request.getParameter("Loc");
	
	/** 처리 결과를 기록할 Log4J 객체 생성*/
//	파라미터는 현재 클래스의 이름(String)
//	import org.apache.logging.log4j.Logger;
//	import org.apache.logging.log4j.LogManager;
	Logger logger = LogManager.getFormatterLogger("dept_action.jsp");
	
	/** 저장될 데이터를 담고 있는 Beans 객체 생성 */
	Department dept = new Department();
	dept.setDname(Dname);
	dept.setLoc(Loc);
	
	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	
	/** 데이터 처리 수행 */
//	비지니스 로직을 위한 Service 객체 생성
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);
//	저장된 결과를 리턴받기 위한 Beans 객체
	Department result = null;
	
	try {
//		학과 저장하기
		result = departmentService.addDepartment(dept);
//		저장결과를 데이터베이스에 반영하기
		sqlSession.commit();
//		처리 결과를 로그에 기록하기
		logger.debug("저장된 데이터 >> " + result.toString());			
	} catch (NullPointerException e) {
//		저장된 데이터가 없는 경우
		logger.error("저장된 데이터가 없습니다.");
	} catch (Exception e) {
//		SQL문에 문제가 있는 경우.
//		데이터베이스로부터 전달되는 에러메시지를 상세히 확인하기 위하여
//		e.printStackTrace()의 리턴값을 함께 기록한다.
		logger.error("데이터 저장에 실패했습니다." + e.getMessage());
	}
%>

 <% response.sendRedirect("dept_list.jsp");%>