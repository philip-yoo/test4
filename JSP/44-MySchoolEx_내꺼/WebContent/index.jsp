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
    
    <style>
    	.btn-left {float:left; width:33%;}
 		#btn-box {font-size:25px; text-align:center; height:150px;}
 		#btn-box a {border-radius: 6px; border:1px solid #A6A6A6; padding:50px 150px; background:#F6F6F6;}
 		#btn-box a:hover{background-color:#EAEAEA; text-decoration:none; color:#003399;}
 		.btn-right {float:right; width:33%;}
	</style>
</head>
<body>
	<div class="container">
		<h1 class="page-header" style="margin-bottom:170px;">4조 리스트 조회</h1>
		
		<div class="top_space"></div>
		
		<div class="btn_left"></div>
		<div id="btn-box"><a href="dept_list.jsp">학과리스트</a></div>
		<div class="btn_right"></div>
		
		<div class="btn_left"></div>
		<div id="btn-box"><a href="prof_list.jsp">교수리스트</a></div>	
		<div class="btn_right"></div>
		
		<div class="btn_left"></div>
		<div id="btn-box"><a href="stud_list.jsp">학생리스트</a></div>	
		<div class="btn_right"></div>	
	</div>     
</body>
</html>