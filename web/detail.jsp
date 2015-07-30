<%--
  Created by IntelliJ IDEA.
  User: huan
  Date: 2015/7/15 0015
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*,edu.test.vo.*" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <title>欢淘网</title>
</head>
<body>
欢迎,
<%
    Object obj = session.getAttribute("curUser");
    if(obj != null)
    {
        User user = (User)obj;

%>
<%=user.getUserName()%>

<%
}else{

%>
亲 <a href="/login.jsp">请登录</a>

<%
    }
%>
<a href="<%=path%>/car.jsp">查看购物车</a>
<%

    if (request.getAttribute("putCar")!=null){
        out.write("成功添加购物车");
    }

    Object object = request.getAttribute("curGoods");
    if (object!=null){
        Goods goods = (Goods)object;

%>

<form action="<%=path%>/carServlet" method="post">
    <table>
        <tr>
            <td rowspan="6"><input type="hidden" value="<%=goods.getGoodsId()%>" name="id">
            <img style="border: none" align="" src="<%=path%>/images/<%=goods.getGoodsImg()%>" width="300" height="300"/>
            </td>
        </tr>
        <tr><td>名字:<%=goods.getGoodsName()%></td></tr>
        <tr><td>价格:<%=goods.getGoodsPrice()%></td></tr>
        <tr><td>库存:<%=goods.getGoodsNum()%></td></tr>
        <tr><td>购买数量:<input type="text" style="width: 30px" name="buyNum" value="1"></td></tr>
        <tr><td><input type="button" value="购买"></td><td><input type="submit" value="加入购物车"/></td></tr>
    </table>
</form>
<%
    }else {
        out.write("暂时没有商品");
    }
%>
</body>
</html>
