<%@page import="study.java.myschool.service.impl.DepartmentServiceImpl"%>
<%@page import="study.java.myschool.model.Department"%>
<%@page import="java.util.List"%>
<%@page import="study.java.myschool.service.DepartmentService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	/** 처리 결과를 기록할 Log4J 객체 생성*/
	//import org.apache.logging.log4j.Logger;
	//import org.apache.logging.log4j.LogManager;
	Logger logger = LogManager.getFormatterLogger("detp_view.jsp");
	
	request.setCharacterEncoding("UTF-8");
	String strDeptno = request.getParameter("deptno");
	int deptno = 0;
	if (strDeptno != null) {
		deptno = Integer.parseInt(strDeptno);
	}

	/** 조회할 데이터의 일련번호를 저장하고 있는 Beans 객체 생성 */
	Department dept = new Department();
	dept.setDeptno(deptno);

	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/** 데이터 처리 수행 */
	//비지니스 로직을 위한 Service 객체 생성
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);
	//조회 결과가 저장될 객체 선언
	Department item = null;
	
	try {
//		학과 삭제하기
		item = departmentService.getDepartmentItem(dept);
//		처리결과를 로그에 기록하기
		logger.debug("조회된 데이터 >> " + item.toString());
	} catch (NullPointerException e) {
//		수정된 데이터가 없는 경우
		logger.error("조회된 데이터가 없습니다.");
	} catch (Exception e) {
//		SQL문에 문제가 있는 경우.
		logger.error("데이터 조회에 실패했습니다." + e.getMessage());
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>My JSP Page</title>
<!-- Twitter Bootstrap3 & jQuery -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<h1 class="page-header">학과조회</h1>
		<p class="text-right">
			<a href="dept_list.jsp" class="btn btn-primary">목록</a> <a
				href="dept_add2.jsp?deptno=<%=item.getDeptno()%>" class="btn btn-primary">학과수정</a> <a
				href="dept_del.jsp?deptno=<%=item.getDeptno()%>" class="btn btn-primary">학과삭제</a>
		</p>
			<ul class="list-group">
    		<li class="list-group-item"><b>학과번호 :</b> <%=item.getDeptno()%></li>
    		<li class="list-group-item"><b>학과명 :</b> <%=item.getDname()%></li>
    		<li class="list-group-item"><b>주소 :</b> <%=item.getLoc()%></li>
    	</ul>
	</div>
</body>
</html>
<%
	/**데이터베이스 접속 해제 */
	sqlSession.close();
%>