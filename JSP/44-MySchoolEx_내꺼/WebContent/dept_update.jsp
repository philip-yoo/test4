<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	/** 파라미터 생성 */
	request.setCharacterEncoding("utf-8");
	String strDeptno = request.getParameter("deptno");
	int deptno = 0;

	if (strDeptno != null) {
	deptno = Integer.parseInt(strDeptno);
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
		<h1 class="page-header">학과수정</h1>
			<form name="myform" method="post" action="dept_updete_save.jsp" role="form">
			
				<div style="font-size:20px; font-weight:bold;"> 학과번호 : <%=deptno %> </div>
				<br>
				<div class="form-group">
					<label for="deptno">학과번호(기존번호입력)</label>
					<input type="text" name="deptno" id="deptno" class="form-control" />
				</div>
				
				<div class="form-group">
					<label for="dname">학과명</label>
					<input type="text" name="dname" id="dname" class="form-control" />
				</div>
				
				<div class="form-group">
					<label for="loc">위치</label>
					<input type="text" name="loc" id="loc" class="form-control" />
				</div>
				
				<button onclick="return confirm('정말로 수정하시겠습니까?')" type="submit" class="btn btn-danger">수정하기</button>
			</form>
	</div>
</body>
</html>
