<%@page import="study.java.myschool.service.impl.ProfessorServiceImpl"%>
<%@page import="study.java.myschool.service.ProfessorService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.java.myschool.model.Professor"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	/** 파라미터 생성 */
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String userid = request.getParameter("userid");
	String position = request.getParameter("position");
	String strSal = request.getParameter("sal");
	String hiredate = request.getParameter("hiredate");
	String strComm = request.getParameter("comm");
	String strDeptno = request.getParameter("deptno");
	
	int sal = 0, comm = 0, deptno = 0;

	if (strSal != null) {
		sal = Integer.parseInt(strSal);
	}
	if (strComm != null) {
		comm = Integer.parseInt(strComm);
	}
	if (strDeptno != null) {
		deptno = Integer.parseInt(strDeptno);
	}
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger = LogManager.getFormatterLogger("prof_save.jsp");

	/** 저장될 데이터를 담고 있는 Beans 객체 생성 */
	Professor prof = new Professor();
	prof.setName(name);
	prof.setUserid(userid);
	prof.setPosition(position);
	prof.setSal(sal);
	prof.setHiredate(hiredate);
	prof.setComm(comm);
	prof.setDeptno(deptno);

	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/**  데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	ProfessorService professorService = new ProfessorServiceImpl(sqlSession);
	// 저장된 결과를 리턴받기 위한 Beans 객체
	Professor result = null;

	try {
		// 학과 저장하기
		result = professorService.addProfessor(prof);
		// 저장결과를 데이터베이스에 반영하기
		sqlSession.commit();
		// 처리 결과를 로그에 기록하기
		logger.debug("저장된 데이터 >> " + result.toString());
	} catch (NullPointerException e) {
		// 저장된 데이터가 없는 경우
		logger.error("저장된 데이터가 없습니다.");
	} catch (Exception e) {
		// SQL문에 문제가 있는 경우.
		// 데이터베이스로부터 전달되는 에러메시지를 상세히 확인하기 위하여
		//  e.getMessage()의 리턴값을 함께 기록한다.
		logger.error("데이터 저장에 실패했습니다." + e.getMessage());
	}

	/** 데이터베이스 접속 해제 */
	sqlSession.close();

	response.sendRedirect("prof_list.jsp");
%>
