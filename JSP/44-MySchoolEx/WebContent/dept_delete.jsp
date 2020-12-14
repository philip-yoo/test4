<%@page import="study.java.myschool.service.impl.DepartmentServiceImpl"%>
<%@page import="study.java.myschool.service.DepartmentService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.java.myschool.model.Department"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

	/** 파라미터 생성 */
	request.setCharacterEncoding("utf-8");
	String strDeptno = request.getParameter("deptno");
	int deptno = 0;

	if (strDeptno != null) {
	deptno = Integer.parseInt(strDeptno);
	}
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// 파라미터는  현재 클래스의 이름(String)
	Logger logger = LogManager.getFormatterLogger("dept_delete.jsp");

	/** 삭제될 데이터를 담고 있는 Beans 객체 생성 */
	Department dept = new Department();
	dept.setDeptno(deptno);

	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/** 데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);

	try {
		// 학과 삭제하기
		departmentService.deleteDepartment(dept);
		// 삭제 결과를 데이터베이스에 반영하기
		sqlSession.commit();
		// 처리 결과를 로그에 기록하기
		logger.debug("데이터 삭제 완료");
	} catch (NullPointerException e) {
		// 삭제된 데이터가 없는 경우
		logger.error("삭제된 데이터가 없습니다.");
	} catch (Exception e) {
		// SQL문에 문제가 있는 경우
		logger.error("데이터 삭제에 실패했습니다." + e.getMessage());
	}

	/** 데이터베이스 접속 해제 */
	sqlSession.close();
	
	
	response.sendRedirect("dept_list.jsp");
%>
