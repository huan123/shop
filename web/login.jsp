
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <base href="<%=basePath%>">
    <title>欢淘网</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/body.css"/>
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

<div class="container">
    <section id="content">
        <form action="/userServlet" method="get">
            <input type="hidden" name="opt" value="login">
            <h1>会员登录</h1>
            <div>
                <input type="text" placeholder="用户名" required="" id="username" name="username" />
            </div>
            <div>
                <input type="password" placeholder="密码" required="" id="password" name="userpwd"/>
            </div>
            <div class="">
                <span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
                <span><input type="checkbox" name="status" value="1"/>一周内记住我</span>
            </div>
            <div>
                <!-- <input type="submit" value="Log in" /> -->
                <input type="submit" value="登录" class="btn btn-primary" id="js-btn-login"/>
                <a href="/regist2.jsp">注册</a>
                <!-- <a href="#">Register</a> -->
            </div>
        </form><!-- form -->

    </section><!-- content -->
</div>
<!-- container -->


<br><br><br><br>

</body>
</html>