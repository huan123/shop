<%@ page import="java.util.List" %>
<%@ page import="edu.test.vo.Goods" %>
<%--
  Created by IntelliJ IDEA.
  User: huan
  Date: 2015/7/15 0015
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>欢淘网</title>
    <style type="text/css">
        th{
            width: 160px;
          }
        td{
            text-align: center;
          }
    </style>
    <script type="text/javascript" src="<%=path%>/js/jquery-1.6.4.js"></script>
    <script type="text/javascript">
        $(document).ready(function()
        {
            var id = "<%=request.getAttribute("numisless")%>";
            if(id!="null"){
                alert("sdsdsdsd");
                $("#num"+id).css("border","2px solid red");
                $("#num"+id).after("<div style='position: relative'>库存数量不足</div>");
            }

            $("#btn1").click(function(){
                var c = 0;
                $(":checkbox").each(function(){

                        if($(this).attr("checked")=="checked") {
                            ++c;
                        }
                });

                if(c==0){
                    alert("请选择结算商品");

                }
                else{
                    $("#form1").submit();
                }
            });



            $("#checkall").click(function(){

                $("td :checkbox").attr("checked",$(this).attr("checked")=="checked" ? true : false);
            });

           $("td :checkbox").click(function(){

               var size = $("td :checkbox").size();
               var count = 0;
               $("td :checkbox").each(function(){
                   if($(this).attr("checked")=="checked"){
                       count++;
                   }
               });

               if(size==count){
                   $("#checkall").attr("checked",true);
               }
               else{
                   $("#checkall").attr("checked",false);
               }
           });

            $("table :text").bind("change",function(){

               $(this).parent().next().text(Number($(this).val())* Number($(this).parent().prev().text()));
               var sum = 0;
               $("tr").not("tr:last").find("td:last").each(function(){
                   sum+=Number($(this).text());
               });
                $("tr:last span").text(sum);
                var str = $(this).parent().parent().find(":checkbox").val();
                $(this).parent().parent().children().find(":checkbox").val(str.substring(0,str.indexOf("|")+1)+$(this).val());
                alert($(this).parent().parent().children().find(":checkbox").val());
            });
        });

    </script>

</head>
<body>
<%
    Object object = session.getAttribute("shopCar");
    if (object==null){
        out.write("购物车暂时没有商品");
    }
    else {

%>
购物车信息如下:
<hr>
<form id="form1" action="<%=path%>/login/orderServlet" method="get" >
<table>

    <tr>
        <th><input id="checkall" type="checkbox"></th><th></th><th>名称</th><th>价格</th><th>数量</th><th>小计</th>
    </tr>
    <%
        List<Goods> list = (List<Goods>)object;

        int sum = 0;
        for (Goods g:list){

            sum += g.getBuyNum()*(int)g.getGoodsPrice();
    %>
    <tr>
        <td><input type="checkbox" name="selgoods" value="<%=g.getGoodsId()%>|<%=g.getBuyNum()%>"/></td>
        <td><img style="border: none" src="<%=path%>/images/<%=g.getGoodsImg()%>" width="60px" height="60px"/> </td>
        <td><%=g.getGoodsName()%></td>
        <td><%=g.getGoodsPrice()%></td>
        <td><input type="text" style="width: 30px"  id="num<%=g.getGoodsId()%>" value="<%=g.getBuyNum()%>" /></td>
        <td><%=g.getGoodsPrice()*g.getBuyNum()%></td>
        <td><a href="<%=path%>/carServlet?opt=del&id=<%=g.getGoodsId()%>" onclick="return confirm('您确定要移除吗')"/>移除</td>
    </tr>
<%
    }

%>
    <tr><td style="text-align: right;padding-right: 30px;border-top: 1px solid black"  colspan="6">总计:<span><%=sum%></span></td>
        <td><input id="btn1" type="button" value="结算"/></td></tr>
    <%
        }
    %>
</table>
</form>
<a href="<%=path%>/goodsServlet">继续逛</a>
</body>
</html>

