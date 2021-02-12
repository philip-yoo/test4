<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/src/main/webapp/WEB-INF/views/assets/css/header.css" />
</head>
<body>
<%@ include file="assets/top.jsp" %>
<h1>
	${pageContext.request.contextPath} 
</h1>

<%@ include file="assets/foot.jsp" %>
</body>
</html>
