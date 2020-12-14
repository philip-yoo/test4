
<%@page import="study.java.myschool.service.impl.DepartmentServiceImpl"%>
<%@page import="study.java.myschool.service.DepartmentService"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="study.java.myschool.model.Department"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
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

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger = LogManager.getFormatterLogger("dept_view.jsp");

	/** 조회할 데이터의 일련번호를 저장하고 있는 Beans 객체 생성 */
	Department dept = new Department();
	dept.setDeptno(deptno);

	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/** 데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	DepartmentService departmentService = new DepartmentServiceImpl(sqlSession);
	// 조회 결과가 저장될 객체 선언
	Department item = null;

	try {
		// 학과 조회하기
		item = departmentService.getDepartmentItem(dept);
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
		<h1 class="page-header">조회하기</h1>
		<p class="text-right">
			<a href="dept_update.jsp?deptno=<%=deptno %>" class="btn btn-primary"> 수정하기 </a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="dept_delete.jsp?deptno=<%=item.getDeptno()%>" class="btn btn-primary">삭제하기</a>
			<a href="dept_list.jsp" class="btn btn-primary"> 목록으로 </a>
		</p>
		<ul class="list-group">
		<li class="list-group-item"> 학과번호 : <%= item.getDeptno() %> </li>
		<li class="list-group-item"> 학과명 : <%= item.getDname() %> </li>
		<li class="list-group-item"> 장소 : <%= item.getLoc() %> </li>
		</ul>
	</div>
    
</body>
</html>

<%
 sqlSession.close();
 %>