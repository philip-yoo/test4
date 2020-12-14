<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Student JSP</title>
    <!-- Twitter Bootstrap3 & jQuery -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>

<body>
    <div class='container'>
    	<h1 class="page-header">학생 추가</h1>
    	<form name="myform" method="post" action="stud_save.jsp" role="form">
    		    			
    			
    			<div class="form-group">
    				<label for="name">이름</label>
    				<input type="text" name="name" id="name" class="form-control" />
    				<label for="userid">아이디</label>
    				<input type="text" name="userid" id="userid" class="form-control" />
    				<label for="grade">학년</label>
    				<input type="text" name="grade" id="grade" class="form-control" />
    				<label for="idnum">주민등록번호</label>
    				<input type="text" name="idnum" id="idnum" class="form-control" />
    				<label for="birthdate">생년월일(yyyy-mm-dd)</label>
    				<input type="text" name="birthdate" id="birthdate" class="form-control" />
    				<label for="tel">연락처</label>
    				<input type="text" name="tel" id="tel" class="form-control" />
    				<label for="height">키</label>
    				<input type="text" name="height" id="height" class="form-control" />
    				<label for="weight">몸무게</label>
    				<input type="text" name="weight" id="weight" class="form-control" />
    				<label for="deptno">학과번호</label>
    				<input type="text" name="deptno" id="deptno" class="form-control" />
    				<label for="profno">담당교수번호</label>
    				<input type="text" name="profno" id="profno" class="form-control" />
    			</div>
    			<button type="submit" class="btn btn-primary">입력하기</button>
    		
    	</form>
    </div>
</body>

</html>