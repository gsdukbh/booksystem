<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/5/17
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<html>
  <head>
    <title>Login</title>
    <link rel="stylesheet" href="res/css/amazeui.min.css">
    <link rel="stylesheet" href="res/css/app.css">
    
  </head>
  <body>
  <header>
    <div class="log-re">
      <button type="button" class="am-btn am-btn-default am-radius log-button" onclick="function x() {
        window.location.href='register.jsp'
      }">注册</button>
    </div>
    
  </header>
  <div class="log">
    <div class="am-g">
      <div class="am-u-lg-3 am-u-md-6 am-u-sm-8 am-u-sm-centered log-content">
        <h1 class="log-title am-animation-slide-top">Werls.top</h1>
        <br>
        <form class="am-form" id="log-form" action="${pageContext.request.contextPath}/Login" method="post">
          <div class="am-input-group am-radius am-animation-slide-left">
            <input type="email" id="doc-vld-email-2-1" class="am-radius" data-validation-message="请输入正确邮箱地址" placeholder="邮箱" required name="usercode" value="admin@admin.com"/>
            <span class="am-input-group-label log-icon am-radius"><i class="am-icon-user am-icon-sm am-icon-fw"></i></span>
          </div>
          <br>
          <div class="am-input-group am-animation-slide-left log-animation-delay">
            <input type="password" class="am-form-field am-radius log-input" placeholder="密码" minlength="11" required name="password" value="qq1361404576">
            <span class="am-input-group-label log-icon am-radius"><i class="am-icon-lock am-icon-sm am-icon-fw"></i></span>
          </div>
          <br>
          <button type="submit" class="am-btn am-btn-primary am-btn-block am-btn-lg am-radius am-animation-slide-bottom log-animation-delay">登 录</button>
        </form>
      </div>
    </div>
    <footer class="log-footer">
      © 2018 WERLS.TOP .
    </footer>
  </div>
  </body>
</html>
