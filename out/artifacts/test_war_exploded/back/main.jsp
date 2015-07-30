<%--
  Created by IntelliJ IDEA.
  User: huan
  Date: 2015/7/23 0023
  Time: 17:43
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
</head>
<body>
<div>

<form action="" method="post">

    <table>
        <tr><td>商品名</td><td><input name="goodsName"/></td></tr>
        <tr><td>商品价格</td><td><input name="goodsPrice"></td></tr>
        <tr><td>商品数量</td><td><input name="goodsNum"/><input type="hidden" name="goodsImg" id="imghidden"/></td></tr>

    </table>

</form>
<form action="<%=path%>/UpServlet" method="post" enctype="multipart/form-data" target="upframe">
        <table>
            <tr><td>相关图片</td><td><input type="file" name="goodsImg"/><input type="submit" value="上传"/></td></tr>
            <tr><td></td><td><img id="upimg" src="<%=path%>/upload/<%=request.getAttribute("upname")%>"/></td></tr>
           <!-- <tr><td></td><td><img id="upimg"/></td></tr>-->
            <tr><td></td><td><input type="button" value="保存"/></td></tr>
        </table>
    <iframe name="upframe" style="display: none"></iframe>
</form>
</div>
</body>
</html>
