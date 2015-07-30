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
    
    <title>欢淘网</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

      <style type = "text/css">

          #page a{width: 20px;height: 20px;border: 1px solid black;margin: 0px 10px;text-align: center;text-decoration: none;}

      </style>

      <script type="text/javascript" src="<%=path%>/js/jquery-1.6.4.js"></script>

      <script type="text/javascript">
            $(document).ready(function () {
                    $("strong").click(function() {
                        document.getElementById("f1").style.backgroundColor;
                    });

                $(":text").keyup(function () {
                        var reg = /^\d+$/;
                        if(reg.test($(this).val())){
                            if( !$(this).val() >= 1)
                            {
                                $(this).val("1");
                            }
                        }
                        else{
                            $(this).val("1");
                        }
                }
                );
            });

      </script>

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
                    <a href="<%=path%>/goodsServlet?opt=detail&id=<%=goods.getGoodsId()%>">
                    <img alt="" style="border: none;    " src="<%=path%>/images/<%=goods.getGoodsImg()%>" width="100px" height="100px"/></a><br/>
                    <a href="<%=path%>/goodsServlet?opt=detail&id=<%=goods.getGoodsId()%>">
                     <%=goods.getGoodsName() %></a><br/>
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
        <form class="" style="display:inline" id = "f1"  action="<%=path%>/goodsServlet" method="post">
        <div id="page">
        <%if (objCurPage != null && objMaxPage!=null) {
            int curPage = Integer.parseInt(objCurPage.toString());
            int maxPage = Integer.parseInt(objMaxPage.toString());

            out.write("第"+curPage+"页，共"+maxPage+"页");

            if (maxPage<8){
                for (int i = 1; i <=maxPage ; i++) {
                    if (curPage==i) {
        %>
            <a id="a1" href="<%=path%>/goodsServlet?opt=aa&curPage=<%=i%>" style="background-color: gray;color: #ffffff"><%=i%></a>

        <%

                    }else {%>
        <a id="a1" href="<%=path%>/goodsServlet?curPage=<%=i%>"><%=i%></a>
        <%
                    }
                 }

            }else {
                if (curPage==1){
        %>
        <a href="<%=path%>/goodsServlet?curPage=<%=curPage%>" style="background-color: gray;color: #ffffff"><%=curPage%></a>
        <a href="<%=path%>/goodsServlet?curPage=<%=curPage+1%>"><%=curPage+1%></a>
        <a href="<%=path%>/goodsServlet?curPage=<%=curPage+2%>"><%=curPage+2%></a>
        ......

        <a href="<%=path%>/goodsServlet?curPage=<%=maxPage-2%>"><%=maxPage-2%></a>
        <a href="<%=path%>/goodsServlet?curPage=<%=maxPage-1%>"><%=maxPage-1%></a>
        <a href="<%=path%>/goodsServlet?curPage=<%=maxPage%>"><%=maxPage%></a>

        <%
               }else if (curPage+6<=maxPage){
        %>
        <a href="<%=path%>/goodsServlet?curPage=<%=curPage-1%>">上一页</a>
        <a href="<%=path%>/goodsServlet?curPage=<%=curPage-1%>"><%=curPage-1%></a>
        <a href="<%=path%>/goodsServlet?curPage=<%=curPage%>" style="background-color:gray;color:#ffffff"><%=curPage%></a>
        <a href="<%=path%>/goodsServlet?curPage=<%=curPage+1%>"><%=curPage+1%></a>
        ......
        <a href="<%=path%>/goodsServlet?curPage=<%=maxPage-2%>"><%=maxPage-2%></a>
        <a href="<%=path%>/goodsServlet?curPage=<%=maxPage-1%>"><%=maxPage-1%></a>
        <a href="<%=path%>/goodsServlet?curPage=<%=maxPage%>"><%=maxPage%></a>
        <%
                }else {
                    for (int i=curPage-1;i<=maxPage;i++)
                    {
                        if (curPage==i){
         %>
                        <a href="<%=path%>/goodsServlet?curPage=<%=i%>" style="background-color: gray;color:#ffffff"><%=i%></a>
          <%
                              } else { %>
                   <a href="<%=path%>/goodsServlet?curPage=<%=i%>"><%=i%></a>

        <%

                        }
                    }
                }

             }
        }
        %>
            <input type="text" style="width: 30px"  name="curPage"/>
            <!--<strong style="cursor:pointer">GO</strong>-->
            <input type="submit" id="bt1" value="GO"/>

        </form>
        </div>
    </body>
</html>
