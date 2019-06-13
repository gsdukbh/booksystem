<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/6/13
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <%--<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <%--<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>--%>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%--  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css" />
</head>
<body>
<div class="container-fluid">
    <div class="row-content ">
        <div class="widget ">
            <div class="widget-body">
                <div class="tpl-page-state">
                    <div class="tpl-page-state-title am-text-center tpl-error-title">404</div>
                    <div class="tpl-error-title-info">Page Not Found</div>
                    <div class="tpl-page-state-content tpl-error-content">

                        <p>对不起,没有找到您所需要的页面,可能是URL不确定,或者页面已被移除。</p>
                        <button type="button" class="am-btn am-btn-secondary am-radius tpl-error-btn">Back Home</button></div>

                </div>
            </div>
        </div>
    </div>
    
</div>
</body>
</html>
