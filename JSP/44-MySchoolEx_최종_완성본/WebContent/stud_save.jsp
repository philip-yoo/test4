<%@page import="study.java.myschool.service.impl.StudentServiceImpl"%>
<%@page import="study.java.myschool.service.StudentService"%>
<%@page import="study.java.myschool.model.Student"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	// 파라미터 수신에 사용할 문자셋 설정 (각 페이지당 최 상단에서 1회 설정)
	request.setCharacterEncoding("UTF-8");

	// <input>태그의 name속성값을 사용하여 사용자의 입력값을 받는다.
	String studno = request.getParameter("studno");
	String name = request.getParameter("name");
	String userid = request.getParameter("userid");
	String strGrade = request.getParameter("grade");
	String idnum = request.getParameter("idnum");
	String birthdate = request.getParameter("birthdate");
	String tel = request.getParameter("tel");
	String strHeight = request.getParameter("height");
	String strWeight = request.getParameter("weight");
	String strDeptno = request.getParameter("deptno");
	String strProfno = request.getParameter("profno");
	int grade = 0;
	int height = 0;
	int weight = 0;
	int deptno = 0;
	int profno = 0;
	
	if (strGrade != null) {
		grade = Integer.parseInt(strGrade);
	}
	
	if (strHeight != null) {
		height = Integer.parseInt(strHeight);
	}
	
	if (strWeight != null) {
		weight = Integer.parseInt(strWeight);
	}
	
	if (strDeptno != null) {
		deptno = Integer.parseInt(strDeptno);
	}
	
	if (strProfno != null) {
		profno = Integer.parseInt(strProfno);
	}

	/** 저장될 데이터를 담고 있는 Beans 객체 생성 */
	// --> import study.java.myschool.model.Department;
	Student stud = new Student();
	stud.setName(name);
	stud.setUserid(userid);
	stud.setGrade(grade);
	stud.setIdnum(idnum);
	stud.setBirthdate(birthdate);
	stud.setTel(tel);
	stud.setHeight(height);
	stud.setWeight(weight);
	stud.setDeptno(deptno);
	stud.setProfno(profno);

	Logger logger = LogManager.getFormatterLogger("stud_save.jsp");

	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/** 데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	StudentService studentService = new StudentServiceImpl(sqlSession);
	// 저장된 결과를 리턴받기 위한 Beans 객체
	Student result = null;

	try {
		// 학과 저장하기
		result = studentService.addStudent(stud);
		// 저장결과를 데이터베이스에 반영하기
		sqlSession.commit();
	} catch (NullPointerException e) {
		// 저장된 데이터가 없는 경우
		logger.error("저장된 데이터가 없습니다.");
	} catch (Exception e) {
		// SQL문에 문제가 있는 경우
		// 데이터베이스로부터 전달되는 에러메시지를 상세히 확인하기 위하여
		// e.getMessage()의 리턴값을 함께 기록한다.
		logger.error("데이터 저장에 실패했습니다." + e.getMessage());
	}

	/** 데이터베이스 접속 해제 */
	sqlSession.close();

	response.sendRedirect("stud_list.jsp");
%>
