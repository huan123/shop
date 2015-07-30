<%--
  Created by IntelliJ IDEA.
  User: huan
  Date: 2015/7/29 0029
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*,edu.test.vo.User" language="java" %>
<%@ page import="edu.test.vo.Goods" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title></title>
</head>
<body>
欢迎,
<c:if  test="${!empty sessionScope.curUser}">
    ${curUser.userName}
</c:if>
<%--sessionScope代表session.getAttribute--%>
<c:if test="${!empty sessionScope.curUser}">
    亲,<a href="<%=path%>/login.jsp">请登录
</c:if>

<hr>
    <c:if test="${empty list}">
        暂时没有商品
    </c:if>

    <c:if test="${!empty list}">
         <c:forEach items="${list}" var="goods">
            <div>
                <a href="<%=path%>/goodsServlet?opt=detail&id=${goods.getGoodsId()}">
                    <img alt="" style="border: none;" src="<%=path%>/images/${goods.getGoodsImg()}" width="100px" height="100px"/></a><br/>
                    <a href="<%=path%>/goodsServlet?opt=detail&id=${goods.getGoodsId()}">
                    ${goods.getGoodsName()}</a><br/>
                    ${goods.getGoodsPrice()}
            </div>
         </c:forEach>

    <div id="page">
        <c:if test="${curPage != null && maxPage!=null}"  >
            out.write("第"+curPage+"页，共"+maxPage+"页");
            <c:if test="${maxPage<=8}")>

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

    </c:if>




</body>
</html>
