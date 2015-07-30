<%--
  Created by IntelliJ IDEA.
  User: huan
  Date: 2015/7/17 0017
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.List" %>
<%@ page import="edu.test.vo.Goods" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢淘网</title>
    <style type="text/css">
        th{
            text-align: center;
        }
        #lef{
            margin-left: 180px;;
        }
        *{
            font-size:12px;
        }
      #cen{
          text-align: center;
      }
    </style>
    <script type="text/javascript" src="/jquery-1.6.4.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var map = {
                '山东省':['济宁市','济南市','淄博市'],
                '浙江省':['杭州市','金阳市']

            };

            var map1 ={
                '济宁市':['金乡县','鱼台县','单县'],
                '济南市':['泉城广场','高新区'],
                '淄博市':['张店区','博山区'],
                '杭州市':['幸福区','西湖区'],
                '金阳市':['花园区','开心区']
            };
            var citys =  map.山东省;
            var len = citys.length;
            var capitals = map1.济宁市;
            var length = capitals.length;
            $("#s2").empty();
            for(var i = 0; i < len; i++ ){

                $("#s2").append("<option value='" + citys[i]+ "'>" + citys[i] + "</option>");
                $("#s3").append("<option value='"+capitals[i]+"'>"+capitals[i]+"</option>");

            }

            $("#s1").change(function(){

                var  city;
                if(  $("#s1").val() == "0"){
                    city = map.山东省;
                }
                else {
                    city = map.浙江省;
                }

                var le = city.length;

                $("#s2").empty();
                for(var i =0 ;i<le;i++){

                    $("#s2").append("<option value='"+city[i]+"'>"+city[i]+"</option>");

                }

            });


            $("#s3").empty();
            for(var i = 0;i<length;i++){

                $("#s3").append("<option value='"+capitals[i]+"'>"+capitals[i]+" </option>");

            }
            $("#s2").change(function(){

                var city1;
                if($("#s2").val()=='济宁市'){
                    city1 = map1.济宁市;
                }else if($("#s2").val()=='济南市'){
                    city1 = map1.济南市;
                }
                else if($("#s2").val()=='淄博市'){
                    city1 = map1.淄博市;
                }
                else if($("#s2").val()=='杭州市'){
                    city1 = map1.杭州市;
                }
                else if($('#s2').val()=='金阳市'){
                    city1 = map1.金阳市;
                }

                var length1 = city1.length;
                $("#s3").empty();
                for(var i = 0;i<length1;i++){
                    $("#s3").append("<option value='"+city1[i]+"'>"+city1[i]+" </option>");
                }

            });

        });



    </script>
</head>
<body>
<%=request.getAttribute("order")!=null ? "提交订单失败" : ""%>
<div align="center">
<table align="center">
    <tr><td>确认收货地址</td><td></td></tr>
    <tr><td>寄送至</td><td><input type="radio"/>山东省 济南市 历下区 舜华路街道 凤凰路与世纪大道交叉路口 济南市高新区高端人才实训基地 (蔡欢欢 收) 1709</td></tr>
    <tr><td></td><td><input type="radio"/>山东省 济宁市 金乡县 金乡街道 金城路御景花园  (蔡欢欢 收) 1709</td></tr>
    <tr><td></td><td><input type="radio"/>浙江省 杭州市 余杭区 五常街道 文一西路969号阿里巴巴西溪园区5号楼 (蔡欢欢 收) 1709</td></tr>
    <tr><td>使用其他地址</td><td></td></tr>

</table>
</div>
<div id="lef">
    <br>
    <select id="s1" style="text-align: left">
        <option value="0" selected="selected">山东省</option>
        <option value="1">浙江省</option>
    </select>
    <select id="s2">
        <option value="0" `selected="selected">济宁市</option>
        <option value="1">济南市</option>
        <option value="2">淄博市</option>
        <option value="3">杭州市</option>
        <option value="4">金阳市</option>


    </select>
    <select id="s3">

    </select>
    <br>

<span style="font-size: larger">女神驿站免费代收服务[?]</span><br>
    <br><br>
<input type="checkbox" name="" value=" "/>[女神驿站] 山东省 济南市 历下区 山东省济南市高新区工业南路55号（未来城商业街16号）(电话:18866110866) （ 蔡欢欢 收）


<div  id = "d1" style="margin-left: 180px" align="center">
<p style="margin-left: 0px">确认订单详情</p>
</div>
<hr style="margin-left: 0px">

<form action="<%=path%>/login/orderServlet?opt=create" method="post">
    <table bgcolor="#afeeee" style="margin-right: 100px;"  border="0" width="1000px;">

        <tr id="cen">
            <th><input id="checkall" type="hidden"></th><th></th><th>名称</th><th>价格</th><th>数量</th><th>小计</th>
        </tr>
        <%
            Object object = request.getAttribute("list");
            int buyNum = Integer.parseInt(request.getAttribute("buyNum").toString());
            List<Goods> list = (List<Goods>)object;
            int sum = 0;
            for (Goods g:list){
                sum += g.getBuyNum()*g.getGoodsPrice();
        %>
        <tr id="cen">
            <td><input type="hidden" name="selgoods" value="<%=g.getGoodsId()%>|<%=buyNum%>"/></td>
            <td><img style="border: none" src="<%=path%>/images/<%=g.getGoodsImg()%>" width="60px" height="60px"/> </td>
            <td><%=g.getGoodsName()%></td>
            <td><%=g.getGoodsPrice()%></td>
            <input type="hidden" name="ids" value="<%=g.getGoodsId()%>">
            <input type="hidden" name="num<%=g.getGoodsId()%>" value="<%=buyNum%>">
            <!--<td><input type="text" style="width: 30px" id="num<%=g.getGoodsId()%>" value="<%=buyNum%>" /></td>-->
            <td><%=buyNum%></td>
            <td><%=g.getGoodsPrice()*g.getBuyNum()%></td>

        </tr>
        <%
            }

        %>
        <tr><td colspan="7"><hr>选择付款方式<br>
            <input type="radio" name="payType" value="在线支付">在线支付
            <input type="radio" name="payType" value="货到付款">货到付款
            <hr>优惠券
        </td>
        </tr>
        <tr><td style="text-align: right;padding-right: 30px;border-top: 1px solid black"  colspan="6">总计:<span><%=sum%></span></td><td><input type="submit" width="30px" height="20px" value="提交订单"/></td></tr>

    </table>
</form>
</div>
<a href="<%=path%>/goodsServlet" style="margin-left: 180px">继续逛</a>

</body>
</html>
