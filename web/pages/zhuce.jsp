<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/6/10
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>注册</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css"> 
    <script src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">

<%--<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>--%>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    <script type="text/javascript">
        var  backg=[];
        backg[0]="images/login.jpg";
        backg[1]="images/1.jpeg";
        backg[2]="images/2.jpg";
        backg[3]="images/3.jpg";
        backg[4]="images/16397.jpg";
        var randomBgIndex = Math.round( Math.random() * 4 );
        document.write('<style>'+'.log{'+'width:100%;\n' +
            '    height:100% ;\n' +
            '    background-image: url('+backg[randomBgIndex]+');\n' +
            '    background-size:100% 100%;\n' +
            '    color:#ffffff;}'+'</style>')
    </script>
</head>
<body>
    <header>
        <div class="log-re">
           <a href="tologin.action"> <button type="button" class="am-btn am-btn-default am-radius log-button">登 录</button></a>
        </div>  
    </header>
    <div class="log" >
        <div class="am-g">
            <div class="am-u-lg-3 am-u-md-6 am-u-sm-8 am-u-sm-centered log-content">
                <h1 class="log-title am-animation-slide-top">注册</h1>
                <br>
                <form class="am-form " id="log-form" method="post">
                    <div class="am-input-group am-radius am-animation-slide-left">
                        <input name="email" type="email" id="doc-vld-email-2-1" class="am-radius" data-validation-message="请输入正确邮箱地址" placeholder="邮箱" required/>
                        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-user am-icon-sm am-icon-fw"></i></span>
                    </div>
                    <br>
                    <div class="am-input-group am-radius am-animation-slide-left">
                        <input type="email" id="doc-vld-email-2-2" class="am-radius" placeholder="验证码" required/>
                        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-user am-icon-sm am-icon-fw"></i></span>
                    </div>
                    <br>
                    <div class="am-input-group am-animation-slide-left log-animation-delay">
                        <input type="password" id="log-password" class="am-form-field am-radius log-input" placeholder="密码" minlength="11" required>
                        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-lock am-icon-sm am-icon-fw"></i></span>
                    </div>
                    <br>
                    <div class="am-input-group am-animation-slide-left log-animation-delay-a">
                        <input id="password" name="password" type="password" data-equal-to="#log-password" class="am-form-field am-radius log-input" placeholder="确认密码" data-validation-message="请确认密码一致" required>
                        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-lock am-icon-sm am-icon-fw"></i></span>
                    </div>
                    <br>
                    <button type="button" id="register" class="am-btn am-btn-primary am-btn-block am-btn-lg am-radius am-animation-slide-bottom log-animation-delay-b" >注 册</button>
                    <br>
                    <div class="am-btn-group am-animation-slide-bottom log-animation-delay-b">
                        <p>已有账号?</p>
                        <a href="tologin.action" class="am-btn am-btn-secondary am-btn-sm">立即登录</a>
                    </div>
                </form>
            </div>

        </div>
        <footer class="log-footer">
            © 2018 WERLS.TOP .
        </footer>
    </div>

<script type="text/javascript">
    /*用户注册*/
    $(document).ready(function(){
       
        $("#register").click(function () {

            if ($("#doc-vld-email-2-2").val()!=4396){
                alert("验证码错误！！请重新输入");
            }
            else if ($("#log-password").val()==$("#password").val()) {
            $.post("${pageContext.request.contextPath}/readerRegister.action",
             $("#log-form").serialize(),function (data) {
                    if (data == "ok"){
                        alert("注册成功!前往登录");
                        window.location.href = "${pageContext.request.contextPath}/tologin.action";
                    }else {
                        alert("注册失败");
                    }
                }   
            )
           }
            else {
                alert("两次密码错误请重新输入")
            }
        })

    }); 
</script>

</body>
</html>
