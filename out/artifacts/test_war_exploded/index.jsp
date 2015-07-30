<%--
  Created by IntelliJ IDEA.
  User: huan
  Date: 2015/7/8 0008
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>欢淘网</title>
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

                  if(!exp.test(this.value))
                  {
                      this.style.border = "1px solid red";
                      $("msg").innerHTML="<font color='red'>名字格式不对</font>";
                  }
              };

              $("pwd2").onblur = function()
              {
                  if($("pwd1").value != $("pwd2").value)
                  {
                      $("msg").innerHTML="<font color='red'>两次密码不一致</font>";
                  }
              };

          };
      </script>
  </head>
  <body>
      <form action = "/userServlet" method="post">
          <h1 align = "center">用户注册</h1>
          <table align="center">
              <tr><td align="right"></td><td><div id = "msg"></div></td></tr>
              <tr><td align="right">用户名:</td> <td><input id = 'txt1' type = "text" name = "username" class="in"/></td></tr>
              <tr><td align="righ">密码：</td> <td><input id = "pwd1" type = "password" name = "userpwd" class="in"></td></tr>
              <tr><td align="right">确认密码:</td> <td><input id = "pwd2" type = "password" class = "in" class="in"/></td></tr>
              <tr><td align="right"></td><td><input id = "bn1" type = "submit" value = "注册"/></td></tr>
          </table>
      </form>
  </body>
</html>
