
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <base href="<%=basePath%>">
    <title>欢淘网</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/body.css"/>

    <style type="text/css">
        .in{width:200px; height:30px; border:1px solid gray;font-size:16px;padding-top:5px;}
        tr{height:50px;}
        #bn1{width:80px;height:25px;background-color:blue;color:#fff;border:none;}
        #b1{align:center;color:#fff;}

    </style>
    <script type="text/javascript" src="<%=path%>/js/jquery-1.6.4.js"></script>
    <script type = "text/javascript">
        $(document).ready(function(){

            $("#txt1").blur(function(){
                alert("hhaa");
                $.ajax({
                        url:"<%=path%>/userServlet",
                        data:"opt=exist&name="+$(this).val(),
                        success:function(rel){
                            alert(rel);
                        if(rel==0){
                            $("#warn").html("<font color='green'>恭喜您用户名可以使用</font>");
                        }else{
                            $("#warn").html("<font color='red'>用户名已经被占用</font>");
                        }
                }
            });
        });
        function $(id) {

            return document.getElementById(id);
        }

        window.onload = function() {
            var obj = $("txt1");
            obj.onfocus = function () {
                this.style.border = "1px solid blue";
            };
            $("pwd1").onfocus = function () {
                this.style.border = "1px solid blue";
            };

            $("pwd2").onfocus = function () {
                this.style.border = "1px solid blue";
            };

            obj.onblur = function () {
                this.style.border = "1px solid gray";
                var exp = /^\w{6,}$/;

                if (!exp.test(obj.value)) {
                    obj.style.border = "1px solid red";
                    $("msg").innerHTML = "<font color='red'>名字格式不对</font>";

                } else {
                    $("msg").innerHTML = "";
                }
            };

            $("pwd2").onblur = function () {
                if ($("pwd1").value != $("pwd2").value) {
                    $("msg").innerHTML = "<font color='red'>两次密码不一致</font>";
                }
            };

            $("bn1").onclick = function () {
                $("f1").submit();
            };
            function f2() {
                //alert("hahah");
                window.location.href = "login.jsp";
            }
        }
        });
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

<div class="container">
    <section id="content">
        <form action="/userServlet?opt=reg" method="post">
            <input type="hidden" name="opt" value="login">
            <h1>用户注册</h1>
            <div id="msg">
            </div>

            <div>
                <input type="text" placeholder="用户名" required="" id="txt1" name="username" />

            </div>

            <div>
                <input type="password" placeholder="密码" required="" id="pwd1" name="userpwd"/>
            </div>
            <div>
                <input type="password" placeholder="确认密码" required="" id="pwd2" name="userpwd"/>
            </div>
            <div class="">
                <span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>			</div>
            <div>
                <!-- <input type="submit" value="Log in" /> -->
                <input type="submit"id="bn1" value="注册" class="btn btn-primary" id="js-btn-login"/>
                 <a href="/login.jsp">登录</a>
                <!-- <a href="#">Register</a> -->
            </div>
        </form><!-- form -->

    </section><!-- content -->
</div>
<!-- container -->


<br><br><br><br>

</body>
</html>