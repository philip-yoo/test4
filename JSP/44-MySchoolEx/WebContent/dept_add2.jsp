<%@page import="study.java.myschool.model.Department"%>
<%@page import="java.util.List"%>
<%@page import="study.java.myschool.service.impl.DepartmentServiceImpl"%>
<%@page import="study.java.myschool.service.DepartmentService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	String strDeptno = request.getParameter("deptno");
	int deptno = 0;

	if (strDeptno != null) {
		deptno = Integer.parseInt(strDeptno);
	}

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// 파라미터는  현재 클래스의 이름(String)
	Logger logger = LogManager.getFormatterLogger(dept_add2.jsp);
	/** 삭제될 데이터를 담고 있는 Beans 객체 생성 */
	Department dept = new Department();
	String Dname = request.getParameter("Dname");
	String Loc = request.getParameter("Loc");

	/** 처리 결과를 기록할 Log4J 객체 생성*/
//	파라미터는 현재 클래스의 이름(String)
//	import org.apache.logging.log4j.Logger;
//	import org.apache.logging.log4j.LogManager;
	Logger logger = LogManager.getFormatterLogger(Main01.class.getName());
	
	/** 저장될 데이터를 담고 있는 Beans 객체 생성 */
	Department dept = new Department();
	dept.setDname("정보통신학과");
	dept.setLoc("통신관");;
	
	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	
	/** 데이터 처리 수행 */
//	비지니스 로직을 위한 Service 객체 생성
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);
//	저장된 결과를 리턴받기 위한 Beans 객체
	Department result = null;
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
			<h1 class="page-header">학과추가하기</h1>
		<form name="myform" method="post" action="dept_action.jsp" role="form">
			<fieldset>
				<div class="form-group">
					<label for="Dname">학과이름</label> <input type="text"
						name="Dname" id="Dname" class="form-control" />
				</div>
				
				<div class="form-group">
					<label for="Loc">학과 위치</label> <input type="text"
						name="Loc" id="Loc" class="form-control" />
				</div>
			<button type="submit" class="btn btn-primary">Submit</button>
			</fieldset>
		</form>
		</div>

</body>

</html>
<%	/**데이터베이스 접속 해제 */
sqlSession.close();
response.sendRedirect("dept_list.jsp");%>
