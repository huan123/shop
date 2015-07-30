<%--
  Created by IntelliJ IDEA.
  User: huan
  Date: 2015/7/23 0023
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        var name = "<%=request.getAttribute("upname")%>";
        window.parent.document.getElementById("upimg").src="<%=path%>/upload/"+name;
        window.parent.document.getElementById("imghidden").value = name;

    </script>
</head>
<body>
<img src="<%=path%>/upload/<%=request.getAttribute("upname")%>"/>
</body>
</html>
