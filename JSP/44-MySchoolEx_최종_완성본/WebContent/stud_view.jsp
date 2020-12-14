<%@page import="study.java.myschool.model.Student"%>
<%@page import="study.java.myschool.service.impl.StudentServiceImpl"%>
<%@page import="study.java.myschool.service.StudentService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="study.java.myschool.MyBatisConnectionFactory"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// 파라미터는 현재 클래스의 이름(String)
	// --> import org.apache.logging.log4j.LogManager;
	// --> import org.apache.logging.log4j.Logger;
	Logger logger = LogManager.getFormatterLogger("stud_view.jsp");
	
	request.setCharacterEncoding("UTF-8");
	String strStudno = request.getParameter("studno");
	
	int studno = 0;
	
	if (strStudno != null) {
		studno = Integer.parseInt(strStudno);
	}

	
	/** 조회할 데이터의 일련번호를 저장하고 있는 Beans 객체 생성 */
	// --> import study.java.myschool.model.Department;
	Student stud = new Student();
	stud.setStudno(studno);

	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/** 데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	// --> import study.java.myschool.service.DepartmentService;
	// --> import study.java.myschool.service.impl.DepartmentServiceImpl;
	StudentService studentService = new StudentServiceImpl(sqlSession);
	Student item = null;

	try {
		// 학과 삭제하기
		item = studentService.getStudentItem(stud);
		// 삭제결과를 데이터베이스에 반영하기
		sqlSession.commit();
		// 처리 결과를 로그에 기록하기
		logger.debug("조회된 데이터 >>" + item.toString());
	} catch (NullPointerException e) {
		logger.error("조회된 데이터가 없습니다.");
	} catch (Exception e) {
		logger.error("데이터 조회에 실패했습니다." + e.getMessage());
	}

	/** 데이터베이스 접속 해제 */
	sqlSession.close();
%>
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
    <div class="container">
    	<h1 class="page-header">학생조회</h1>
    	<p class="text-right">
    		<a href="stud_update.jsp?studno=<%=item.getStudno()%>&name=<%=item.getName()%>&userid=<%=item.getUserid()%>
    			&grade=<%=item.getGrade()%>&idnum=<%=item.getIdnum()%>&birthdate=<%=item.getBirthdate()%>
    			&tel=<%=item.getTel()%>&height=<%=item.getHeight()%>&weight=<%=item.getWeight()%>&deptno=<%=item.getDeptno()%>
    			&profno=<%=item.getProfno()%>" class="btn btn-primary">정보수정</a>
    		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="stud_delete.jsp?studno=<%=item.getStudno()%>" class="btn btn-primary">학생삭제</a>
    		<a href="stud_list.jsp" class="btn btn-primary">학생목록</a>
    	</p>
    	

    	<ul style="padding-inline-start: 0px;">
    		<li class="list-group-item"><b>학생번호 :</b> <%=item.getStudno()%></li>
    		<li class="list-group-item"><b>이름 :</b> <%=item.getName()%></li>
    		<li class="list-group-item"><b>아이디 :</b> <%=item.getUserid()%></li>
    		<li class="list-group-item"><b>학년 :</b> <%=item.getGrade()%></li>
    		<li class="list-group-item"><b>주민등록번호 :</b> <%=item.getIdnum()%></li>
    		<li class="list-group-item"><b>생년월일 :</b> <%=item.getBirthdate()%></li>
    		<li class="list-group-item"><b>연락처 :</b> <%=item.getTel()%></li>
    		<li class="list-group-item"><b>키 :</b> <%=item.getHeight()%></li>
    		<li class="list-group-item"><b>몸무게 :</b> <%=item.getWeight()%></li>
    		<li class="list-group-item"><b>학과번호 :</b> <%=item.getDeptno()%></li>
    		<li class="list-group-item"><b>담당교수번호 :</b> <%=item.getProfno()%></li>
    	</ul>
    	
    </div>
</body>

</html>