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
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger = LogManager.getFormatterLogger("prof_update_sal.jsp");
	
	/** 조회할 데이터의 일련번호를 저장하고 있는 Beans 객체 생성 */
	Professor prof = new Professor();
	prof.setProfno(profno);
	
	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	
	/** 데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	ProfessorService professorService = new ProfessorServiceImpl(sqlSession);
	// 조회 결과가 저장될 객체 선언
	Professor item = null;
	
	try {
		// 학과 조회하기
		item = professorService.getProfessorItem(prof);
		// 처리 결과를 로그에 기록하기
		logger.debug("조회된 데이터 >> " + item.toString());
	} catch (NullPointerException e) {
		logger.error("조회된 데이터가 없습니다.");
	} catch (Exception e) {
		logger.error("데이터 조회에 실패했습니다." + e.getMessage());
	}
%>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>MY JSP Page</title>
    <!--  Twitter Bootstrap3 &jQuery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bpptstrap-theme.min.css" />
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<h1 class="page-header">교수수정</h1>
			<form name="myform" method="post" action="prof_update_sal_save.jsp?profno=<%=item.getProfno()%>" role="form">
			
				<div style="font-size:20px; font-weight:bold;"> 기존 월급(만원) : <%=item.getPosition() %></div>
				<br>
				<div class="form-group">
					<label for="sal">변경할 월급(만원)</label>
					<input type="text" name="sal" id="sal" class="form-control" />
				</div>
				
				<ul class="list-group">
					<li class="list-group-item"> 교수번호 : <%=item.getDeptno()%> </li>
					<li class="list-group-item"> 이름 : <%=item.getName()%> </li>
					<li class="list-group-item"> 교수ID : <%=item.getUserid()%> </li>
					<li class="list-group-item"> 보직 : <%=item.getPosition()%> </li>
					<li class="list-group-item"> 고용일 : <%=item.getHiredate()%> </li>
					<li class="list-group-item"> 보직수당(만원) : <%=item.getComm()%> </li>
					<li class="list-group-item"> 학과번호 : <%=item.getDeptno()%> </li>
				</ul>
				
				<button onclick="return confirm('정말로 수정하시겠습니까?')" type="submit" class="btn btn-danger">수정하기</button>
			</form>
	</div>
</body>
</html>

<%
 sqlSession.close();
 %>