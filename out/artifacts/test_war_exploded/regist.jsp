<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		 .in{width:200px; height:30px; border:1px solid gray;font-size:16px;padding-top:5px;}
		tr{height:50px;}
		#bn1{width:80px;height:25px;background-color:blue;color:#fff;border:none;}
	    #b1{align:center;color:#fff;}
	</style>
	
	<script type = "text/javascript">
		
		function $(id) {
		
			return document.getElementById(id);
		}
		
		window.onload = function()
		{
			var obj = $("txt1");
			
			obj.onfocus = function(){
				this.style.border = "1px solid blue";
			};
			
			$("pwd1").onfocus = function(){
				this.style.border = "1px solid blue";
			};
			
			$("pwd2").onfocus = function(){
				this.style.border = "1px solid blue";
			};
			
			obj.onblur = function()
			{
				this.style.border = "1px solid gray";
				var exp = /^\w{6,}$/;
				
				if(!exp.test(obj.value))
				{
					obj.style.border = "1px solid red";
					$("msg").innerHTML="<font color='red'>名字格式不对</font>";
				}else{
					$("msg").innerHTML="";
				}
			};
		 
			$("pwd2").onblur = function()
			{
				if($("pwd1").value != $("pwd2").value)
				{
					$("msg").innerHTML="<font color='red'>两次密码不一致</font>";
				}
			};
			
			$("bn1").onclick=function()
			{
				$("f1").submit();
			};
            function f2()
            {
                alert("hahah");
                window.location.href ="login.jsp";
            }
			
		};
	</script>
	
  </head>
  
  <body>

	<%
		if(request.getAttribute("regist")!=null)
		{
	 %>
	    <font color="green">注册成功</font>
	 <%
	 	}
	  %>
    <form id="f1" action = "/userServlet?opt=reg" method="post">
     <h1 align = "center">用户注册</h1>
     <table align="center">
        <tr><td align="right"></td><td><div id = "msg"></div></td></tr>
     	<tr><td align="right">用户名:</td> <td><input id = 'txt1' type = "text" name = "username" class="in"/></td></tr>
     	<tr><td align="right">密码：</td> <td><input id = "pwd1" type = "password" name = "userpwd" class="in"></td></tr>
     	<tr><td align="right">确认密码:</td> <td><input id = "pwd2" type = "password" class = "in" class="in"/></td></tr>
     	<tr><td align="right"></td> <td><input id = "bn1" type = "button" value = "注册"/></td></tr>

     </table>
     </form>

    <form id="f2" action = "/userServlet?opt=login2" method="post">
           <input  type="submit" value="登录">
    </form>

  </body>
</html>
	