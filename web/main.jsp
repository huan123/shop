<%@ page language="java" import="java.util.*,edu.test.vo.User" pageEncoding="UTF-8"%>
<%@ page import="edu.test.vo.Goods" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
  <hr/>
    <%
        Object obj1 = request.getAttribute("list");
        Object objCurPage = request.getAttribute("curPage");
        Object objMaxPage = request.getAttribute("maxPage");

        if(obj1 != null)
        {
            List<Goods> list = (List<Goods>)obj1;

            if (list.size()>0)
            {
                for (Goods goods:list){
    %>

                <div>
                   <img alt="" src="<%=path%>/images/<%=goods.getGoodsImg()%>" width="100px" height="100px"/><br/>
                    <%=goods.getGoodsName() %><br/>
                    <%=goods.getGoodsPrice() %>
                </div>
    <%
                }
            }
        }else {
     %>
        暂时没有商品信息

     <%
             }

    %>
        <br/>
    <%
        if (objCurPage != null && objMaxPage != null)
        {
            int curPage = Integer.parseInt(objCurPage.toString());
            int maxPage = Integer.parseInt(objMaxPage.toString());

            out.write("第"+curPage+"页，共"+maxPage+"页");

            int start = maxPage <= 10 ? 1 :(curPage<10 ? 1:curPage-5);

            int end = maxPage <=10 ? maxPage : (curPage+4)>maxPage ? maxPage : curPage+4;

            for (int i = start;i<=end;i++)
            {
                if (i==curPage) {
     %>
        <a href = "<%=path%>/goodsServlet?curPage=<%=i%>" style="background-color: gray;color:white"><%=i%></a>
     <%
                           }else{
     %>
        <a href="<%=path%>/goodsServlet?curPage=<%=i%>"><%=i%></a>
        <%

                                }
            }
        }
    %>

    </body>
</html>
