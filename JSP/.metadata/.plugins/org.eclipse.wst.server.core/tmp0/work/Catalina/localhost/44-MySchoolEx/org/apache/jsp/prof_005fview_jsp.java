/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.43
 * Generated at: 2020-11-04 07:11:23 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import study.java.myschool.service.impl.ProfessorServiceImpl;
import study.java.myschool.service.ProfessorService;
import study.java.myschool.MyBatisConnectionFactory;
import study.java.myschool.model.Professor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.ibatis.session.SqlSession;

public final class prof_005fview_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("study.java.myschool.service.ProfessorService");
    _jspx_imports_classes.add("org.apache.logging.log4j.Logger");
    _jspx_imports_classes.add("study.java.myschool.MyBatisConnectionFactory");
    _jspx_imports_classes.add("study.java.myschool.service.impl.ProfessorServiceImpl");
    _jspx_imports_classes.add("org.apache.logging.log4j.LogManager");
    _jspx_imports_classes.add("org.apache.ibatis.session.SqlSession");
    _jspx_imports_classes.add("study.java.myschool.model.Professor");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;


	/** 파라미터 생성 */
	request.setCharacterEncoding("utf-8");
	String strProfno = request.getParameter("profno");
	int profno = 0;

	if (strProfno != null) {
	profno = Integer.parseInt(strProfno);
	}

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger = LogManager.getFormatterLogger("prof_view.jsp");

	/** 조회할 데이터의 일련번호를 저장하고 있는 Beans 객체 생성 */
	Professor prof = new Professor();
	prof.setProfno(profno);

	/** 데이터베이스 접속 */
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

	/** 데이터 처리 수행 */
	// 비지니스 로직을 위한 Service 객체 생성
	ProfessorService professorService = new ProfessorServiceImpl(sqlSession);
	// 조회 결과가 저장될 객체 선언
	Professor item = null;

	try {
		// 학과 조회하기
		item = professorService.getProfessorItem(prof);
		// 처리 결과를 로그에 기록하기
		logger.debug("조회된 데이터 >> " + item.toString());
	} catch (NullPointerException e) {
		logger.error("조회된 데이터가 없습니다.");
	} catch (Exception e) {
		logger.error("데이터 조회에 실패했습니다." + e.getMessage());
	}


      out.write("<!doctype html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\" />\r\n");
      out.write("    <title>MY JSP Page</title>\r\n");
      out.write("    <!--  Twitter Bootstrap3 &jQuery -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css\" />\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bpptstrap-theme.min.css\" />\r\n");
      out.write("    <script src=\"http://code.jquery.com/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js\"></script> \r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<h1 class=\"page-header\">조회하기</h1>\r\n");
      out.write("\t\t<p class=\"text-right\">\r\n");
      out.write("\t\t\t<a href=\"prof_update.jsp?profno=");
      out.print(profno);
      out.write("\" class=\"btn btn-primary\"> 수정하기 </a>\r\n");
      out.write("\t\t\t<a onclick=\"return confirm('정말로 삭제하시겠습니까?')\" href=\"prof_delete.jsp?profno=");
      out.print(profno);
      out.write("\" class=\"btn btn-primary\">삭제하기</a>\r\n");
      out.write("\t\t\t<a href=\"prof_list.jsp\" class=\"btn btn-primary\"> 목록으로 </a>\r\n");
      out.write("\t\t</p>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<ul class=\"list-group\">\r\n");
      out.write("\t\t<li class=\"list-group-item\"> 교수번호 : ");
      out.print( item.getProfno() );
      out.write("</li>\r\n");
      out.write("\t\t<li class=\"list-group-item\"> 이름 : ");
      out.print( item.getName() );
      out.write("</li>\r\n");
      out.write("\t\t<li class=\"list-group-item\"> 아이디 : ");
      out.print( item.getUserid() );
      out.write("</li>\r\n");
      out.write("\t\t<li class=\"list-group-item\"> 직급 : ");
      out.print( item.getPosition() );
      out.write("</li>\r\n");
      out.write("\t\t<li class=\"list-group-item\"> 급여 : ");
      out.print( item.getSal() );
      out.write("</li>\r\n");
      out.write("\t\t<li class=\"list-group-item\"> 입사일 : ");
      out.print( item.getHiredate() );
      out.write("</li>\r\n");
      out.write("\t\t<li class=\"list-group-item\"> 보직수당 : ");
      out.print( item.getComm() );
      out.write("</li>\r\n");
      out.write("\t\t<li class=\"list-group-item\"> 부서(학과)번호 : ");
      out.print( item.getDeptno() );
      out.write("</li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t</div>\r\n");
      out.write("    \r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");

 sqlSession.close();
 
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
