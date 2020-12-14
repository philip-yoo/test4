<%@page import="study.java.myschool.service.impl.ProfessorServiceImpl"%>
<%@page import="study.java.myschool.service.ProfessorService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.java.myschool.model.Professor"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

	/** 파라미터 생성 */
	request.setCharacterEncoding("utf-8");
	String strProfno = request.getParameter("profno");
	int profno = 0;

	if (strProfno != null) {
	profno = Integer.parseInt(strProfno);
	}
	
	String name = request.getParameter("name");

	
	// 파라미터는  현재 클래스의 이름(String)
	Logger logger = LogManager.getFormatterLogger("prof_updete_profno_save.jsp");

	/** 수정될 데이터를 담고 있는 Beans 객체 생성 */
	Professor prof = new Professor();
	prof.setProfno(profno);
	prof.setName(name);

	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/** 데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	ProfessorService professorService = new ProfessorServiceImpl(sqlSession);
	// 수정된 결과를 리턴받기 위한 Beans 객체
	Professor result = null;

	try {
		// 학과 수정하기
		result = professorService.editProfnoProfessor(prof);
		// 수정 결과를 데이터베이스에 반영하기
		sqlSession.commit();
		// 처리 결과를 로그에 기록하기
		logger.debug("수정된 데이터 >> " + result.toString());
	} catch (NullPointerException e) {
 		// 수정된 데이터가 없는 경우
		logger.error("수정된 데이터가 없습니다.");
	} catch (Exception e) {
		// SQL문에 문제가 있는 경우
		logger.error("데이터 수정에 실패했습니다." + e.getMessage());
	}

	/** 데이터베이스 접속 해제 */
	sqlSession.close();
	
	
	response.sendRedirect("prof_list.jsp");
	

%>