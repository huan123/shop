<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	
	 .in{width:200px;height: 30px;border: 1px solid gray;font-size: 16;padding-top: 5px;}
	 tr{height: 50px}
	 #bn1{width: 80px;height: 25px;background-color:blue;color: #fff;border:none}
	</style>
	<script type="text/javascript" src="<%=path%>/js/jquery-1.6.4.js"></script>
	<script type="text/javascript">
	//取对象
	//window.document.getElementById();
	//document.getElementsByName();
	
	//document.getElementsByTagName("input");
	//操作对象
	var obj = [{name:'aa',pwd:'1234'},{name:'aa',pwd:'1234'}];
	
	var arr = [1,2,3];
	$(document).ready(function (){
	
		$("#txt1").blur(function(){
			$.ajax({
				url:"<%=path%>/userServlet",
				data:"opt=exist&name="+ $(this).val(),

				success:function(r){
                  //  alert(r);

                    $("#warn").html(r);
					
				}
						
			});
			
		
		});
	});
	
	
	
	function _$(id){
		return document.getElementById(id);
	}
	window.onload = function(){
		var obj = _$("txt1");
		obj.onfocus=function(){
			this.style.border="1px solid blue";
		};
		obj.onblur=function(){
			this.style.b
			order="1px solid gray";
			var exp = /^\w{6,}_$/;
			
			if(!exp.test(this.value)){
			  this.style.border="1px solid red";
			  _$("msg").innerHTML="<font color='red'>名字格式不对</font>";
			}
		};
		
		_$("pwd2").onblur=function(){
			if(_$("pwd1").value != _$("pwd2").value){
				_$("msg").innerHTML="<font color='red'>两次密码不一致</font>";
			}
		};
		
		_$("bn1").onclick=function(){
		    
			_$("f1").submit();
		};
		
		
// 		_$("txt1").onblur=function(){
		
// 			var xmlhttp;
// 			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
// 			  xmlhttp=new XMLHttpRequest();
// 		    }else{// code for IE6, IE5
// 			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
// 			}
			
// 			xmlhttp.onreadystatechange=function(){
			
// 				if(xmlhttp.readyState==4 && xmlhttp.status==200){
// 					var text = xmlhttp.responseText;
					
// 					if(text==0){
// 						_$("warn").innerHTML = "<font color='green'>恭喜你用户名可以使用</font>";
// 					}else{
// 						_$("warn").innerHTML = "<font color='red'>对不起，用户名已被使用</font>";
// 					}
// 				}
// 		    };
		    
// 			xmlhttp.open("POST","<%=path%>/aa/bb/cc/userServlet.do?opt=exist&name=" + this.value ,true);
// 			xmlhttp.send();
// 			/*
// 			0: 请求未初始化 
// 			1: 服务器连接已建立 
// 			2: 请求已接收 
// 			3: 请求处理中 
// 			4: 请求已完成，且响应已就绪 
// 			*/
			
			
// 		}; 
	};
	</script>
  </head>

  <body>
     <% if(request.getAttribute("regist") != null){%>
     	<font color="green">注册成功</font>
     <% } %>
    <form id="f1" action="<%=path %>/userServlet?opt=reg" method="post">
   	 
    <table>
        
        <tr><td align="right"></td><td><div id="msg"></div></td></tr>
    	<tr><td align="right">用户名</td><td><input  id="txt1" type="text" name="username" class="in" /><span id="warn"></span></td></tr>
    
    	<tr><td align="right">密码</td><td><input id="pwd1" type="password" name="userpwd" class="in"/></td></tr>
   		<tr><td align="right">确认密码</td><td><input id="pwd2" type="password"  class="in"/></td></tr>
        <tr><td align="right"></td><td><input id="bn1" type="button" value="注册"/></td></tr>
    </table>
    </form>
    
   
  </body>
</html>
