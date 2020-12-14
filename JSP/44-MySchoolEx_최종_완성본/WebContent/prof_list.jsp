<%@page import="study.java.myschool.model.Professor"%>
<%@page import="java.util.List"%>
<%@page import="study.java.myschool.service.impl.ProfessorServiceImpl"%>
<%@page import="study.java.myschool.service.ProfessorService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.LogManager;
	// --> import org.apache.logging.log4j.Logger;
	Logger logger = LogManager.getFormatterLogger("prof_list.jsp");
	
	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
		
	/** 데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	ProfessorService professorService = new ProfessorServiceImpl(sqlSession);
	// 조회 결과가 저장될 객체 선언
	List<Professor> list = null;
	
	try {
		// 학과 조회하기
		list = professorService.getProfessorList();
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
		<h1 class="page-header">교수목록</h1>
		 <p class="text-right">
			<a href="prof_add.jsp" class="btn btn-primary"> 교수추가</a>
			<a href="index.jsp" class="btn btn-primary"> 인덱스로</a>
		</p>
		<ul class="list-group">
			<li class="list-group-item"> 
				교수번호 / 이름 / ID / 보직 <br>
				월급(만원) / 고용일 / 보직수당(만원) / 학과번호
			</li>
		<%
			if (list != null) {
				// 조회 결과를 반복문으로 스캔하면서 출력한다.
				for (int i = 0; i < list.size(); i++) {
					Professor temp = list.get(i);
					logger.debug(String.format("조회결과[%d] >> %s", i, temp.toString()));
		%>
			<li class="list-group-item">
				<a href="prof_view.jsp?profno=<%=temp.getProfno()%>">
					<%=temp.getProfno()%> / <%=temp.getName()%> / <%=temp.getUserid()%> / <%=temp.getPosition()%> <br>
					<%=temp.getSal()%> / <%=temp.getHiredate()%> / <%=temp.getComm()%> / <%=temp.getDeptno()%>					
				</a>
			</li>
		<%
				}
			}
		%>
		</ul>	
	</div>    
</body>
</html>
<%
	/** 데이터베이스 접속 해제 */
	sqlSession.close();
%>