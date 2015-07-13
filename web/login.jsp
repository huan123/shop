<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv=   "keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
	
	 .in{width:200px;height: 30px;border: 1px solid gray;font-size: 16;padding-top: 5px;}
	 tr{height: 50px}
	 #bn1{width: 80px;height: 25px;background-color:blue;color: #fff;border:none}
	</style>
  </head>
  
  <body>
      <%
          if(request.getAttribute("curUser")=="error")
          {
      %>
      <font color="green">用户名或密码错误</font>
      <%
          }
      %>

    <form id="f1" action="/userServlet" method="get">
     <input type="hidden" name="opt" value="login">
    <table>
        <tr><td align="right"></td><td><div id="msg"></div></td></tr>
    	<tr><td align="right">用户名</td><td><input  id="txt1" type="text" name="username" class="in"/></td></tr>
    	<tr><td align="right">密码</td><td><input id="pwd1" type="password" name="userpwd" class="in"/></td></tr>	
        <tr><td align="right"></td><td><input id="bn1" type="submit" value="登录"/></td></tr>
    </table>
    </form>
  </body>
</html>
