<%--
  Created by IntelliJ IDEA.
  User: huan
  Date: 2015/7/22 0022
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script type="text/javascript" src="<%=path%>/js/jquery-1.6.4.js"></script>
    <script type="text/javascript">
        function f(){
            if($("#time").text()=="1"){
                window.location.href="<%=path%>/login.jsp";
            }
            $("#time").text(Number($("#time").text())-1);
        }
        $(document).ready(function(){
            setInterval("f()",1000);
        });
    </script>
    <title                          ></title>
</head>
<body>
请先登陆<br>
将在<span id="time">5</span>秒后跳转，如未跳转，请点击登陆<a href="<%=path%>/login.jsp">登录</a>
</body>
</html>
