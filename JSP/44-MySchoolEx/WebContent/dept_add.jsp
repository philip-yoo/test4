<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

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
		<h1 class="page-header">학과추가</h1>
			<form name="myform" method="post" action="dept_save.jsp" role="form">
			
				<div class="form-group">
					<label for="dname">학과명</label>
					<input type="text" name="dname" id="dname" class="form-control" />
				</div>
				
				<div class="form-group">
					<label for="loc">위치</label>
					<input type="text" name="loc" id="loc" class="form-control" />
				</div>
				
				<button type="submit" class="btn btn-danger">입력하기</button>
			</form>
	</div>
    
</body>
</html>