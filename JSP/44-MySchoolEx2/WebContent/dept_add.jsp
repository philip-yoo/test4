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
