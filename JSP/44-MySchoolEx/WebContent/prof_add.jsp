<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

// 파라미터 수신에 사용할 문자셋 설정 (각 페이지당 최 상단에서 1회 설정)
request.setCharacterEncoding("UTF-8");

// 파라미터 받기
String prof_add = request.getParameter("prof_list");

// 화면에 출력할 결과 문자열
String result = null;

if (prof_add == null) {
   // 파라미터가 URL에 명시되지 않은 경우
   result = "응답 내용이 없습니다.";
   } else {
      // 파라미터가 URL에 명시 된 경우
      int user_select = 0;
      
      try {
         user_select = Integer.parseInt(prof_add);
      } catch (Exception e) {}
      
   }
   %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8" />
    <title>교수정보추가</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
    ></script>
</head>

<body>
    <div class="container">
    <form name="myform" method="post" action="prof_add_ok.jsp" role="form">
    <fieldset>
    <legend>교수정보추가</legend>
    <div class="form-group">
    <label for="name">교수이름</label>
    <input type="text" name="name" id="name"
    class="form-control" />
    <label for="userid">아이디</label>
    <input type="text" name="userid" id="userid"
    class="form-control" />
    <label for="position">직급</label>
    <input type="text" name="position" id="position"
    class="form-control" />
    <label for="sal">급여</label>
    <input type="text" name="sal" id="sal"
    class="form-control" />
    <label for="hiredate">입사일</label>
    <input type="text" name="hiredate" id="hiredate"
    class="form-control" />
    <label for="comm">보직수당</label>
    <input type="text" name="comm" id="comm"
    class="form-control" />
    <label for="deptno">학과번호</label>
    <input type="text" name="deptno" id="deptno"
    class="form-control" />
    </div>
    <button type="submit" class="btn btn-primary">추가하기</button>
    </fieldset>
    </form>
    </div>
</body>