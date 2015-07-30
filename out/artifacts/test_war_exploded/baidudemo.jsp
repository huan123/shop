<%--
  Created by IntelliJ IDEA.
  User: huan
  Date: 2015/7/29 0029
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="<%=path%>/js/jquery-1.6.4.js"></script>

    <style>
        .bg{
            background-color:#d4d4d4;
        }
    </style>
    <script type="text/javascript">


        $(document).ready(function() {
            $("#txtkey").bind("input", function () {
               // alert("我是绑定事件");
                var txtval = $(this).val();
               // alert(txtval);
                $("#vallist").remove();
                $.ajax(
                {
                    url:"<%=path%>/goodsServlet",
                    type:"post",
                    data:"opt=key&keyval="+txtval,
                    success:function(rel){

                    var s = "<div id='vallist' style='width: 150px;height: 300px;border: 1px solid #000000;margin: 0px 0px '>"+rel+"</div>";
                    var offset = $("#vallist").offset;
                   // alert(s);
                    $("#vallist").show();
                    $("#vallist").width($("#txtkey").width()+4);
                    $("#vallist span").css('width','100%');
                    $("#vallist").offset({left:offset.left,top:offset.top+$("vallist").height + 4 });
                    $("#vallist").css({'margin':'2px 0px','text-align':'right','border':'1px solid  black'});
                    $(document.body).append(s);
                   // alert($("#vallist span:first").text());

                    // alert("我是ajax");
                    $("#vallist span").mouseover(function () {
                        $("#vallist span").removeClass("bg");
                        $(this).addClass("bg");
                    });

                    $(document).keyup(function(e){
                        //上箭头
                        if(e.keyCode==38){
                            //alert("我是上箭头");
                            if($("#vallist .bg").size()==0 || $("#vallist span").index($("#vallist .bg"))==0){
                                $("#vallist span").removeClass("bg");
                                $("#vallist span:last").addClass("bg");
                              //  $("#vallist span").index($("#vallist .bg").size()-1).addClass("bg");
                            }
                            else{
                                var ind = $("#vallist span").index($("#vallist .bg"))-1;
                                $("#vallist span").removeClass("bg");
                                $("#vallist span").eq(ind).addClass("bg");
                            }

                        }
                        //下箭头
                        else if(e.keyCode==40){
                           // alert("我是下箭头");
                            if($("#vallist .bg").size()==0 || $("#vallist span").index($("#vallist .bg"))==$("#vallist span").size()-1){
                             // alert("ty");
                                $("#vallist span").removeClass("bg");
                                $("#vallist span").eq(0).addClass("bg");
                            }else{
                                var ind = $("#vallist span").index($("#vallist .bg"))+1;
                                $("#vallist span").removeClass("bg");
                                $("#vallist span").eq(ind).addClass("bg");
                            }

                        }
                        //enter回车
                        else if(e.keyCode==13){
                            $("#txtkey").unbind("input");
                            $("#txtkey").val($("#vallist .bg").text());
                        }
                    });
                }

            });


            });

        });

    </script>
</head>
<body>
<div style="height: 20px;width: 200px">
<form>
<input type="text"  id="txtkey" style="width: 150px;height: 100%"/><input type="button" value="提交"/>
</form>
</div>
</body>
</html>
