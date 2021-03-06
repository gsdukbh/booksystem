<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/6/12
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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


<div class="container">
    <div class="row clearfix">
        <div class="col-md-3 column"></div>
        <div class="col-md-6 column">

            <section class="am-panel am-panel-default">
                <header class="am-panel-hd">
                    <h3 class="am-panel-title">读者查找</h3>
                </header>
                <div class="am-panel-bd">

                    <form class="am-form" action="${pageContext.request.contextPath}/reader/find.action" method="post">
                        <div class="am-form-group ">

                            <label class="control-label" >借阅证号</label>
                            <p><input type="text" class="am-form-field am-round" placeholder="读者借阅账号" name="borrowID" /></p>

                        </div>

                        <div class="am-form-group ">

                            <label class="control-label" >姓名</label>
                            <p><input type="text" class="am-form-field am-round" placeholder="书名"name="readerName"/></p>

                        </div>

                        <div class="am-form-group ">

                            <label class="control-label" >单位</label>
                            <p><input type="text" class="am-form-field am-round" placeholder="作者" name="readerUnit"/></p>

                        </div>

                        <div class="am-form-group ">

                            <label class="control-label" >电话</label>
                            <p><input type="text" class="am-form-field am-round" placeholder="出版社" name="readerPhone"/></p>

                        </div>

                        <div class="am-form-group ">
                            <button type="submit" class="am-btn am-btn-primary am-btn-block am-round">搜索</button>
                        </div>

                    </form>

                </div>
            </section>

        </div>
    </div>
</div>
</body>
</html>
