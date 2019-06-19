<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/5/17
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<html>
  <head>
    <title>Login</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
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
     <a href="${pageContext.request.contextPath}/toRegister.action"><button type="button" class="am-btn am-btn-default am-radius log-button" >注册</button></a>
    </div>
  </header>
  <div class="log">
    <div class="am-g">
      <div class="am-u-lg-3 am-u-md-6 am-u-sm-8 am-u-sm-centered log-content">
        <h1 class="log-title am-animation-slide-top">图书管理系统</h1>
        <c:if test="${msg} !null" >
          <h2 class="log-title am-animation-slide-top">
            <c:out value="${msg}">
            </c:out>
          </h2>
        </c:if>
        <br>
        <form class="am-form" id="log-form" action="${pageContext.request.contextPath}/login.action" method="post">
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
