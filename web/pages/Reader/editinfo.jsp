<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/6/12
  Time: 23:36
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
        <div class="col-md-12 column">

            <section class="am-panel am-panel-default">
                <header class="am-panel-hd">
                    <h3 class="am-panel-title">我的信息</h3>
                </header>
                <div class="am-panel-bd ">
                   
                    <form class="form-horizontal">
                        <fieldset>
                            <div class="control-group">

                                <!-- Text input-->
                                <label class="control-label" >你的名字</label>
                                <div class="controls">
                                    <input type="text" placeholder="输入你姓名" class="input-xlarge">
                                    <p class="help-block"></p>
                                </div>
                            </div>

                            <div class="control-group">

                                <!-- Text input-->
                                <label class="control-label" >电话</label>
                                <div class="controls">
                                    <input type="text" placeholder="phone" class="input-xlarge">
                                    <p class="help-block"></p>
                                </div>
                            </div>

                            <div class="control-group">

                                <!-- Select Basic -->
                                <label class="control-label">性别</label>
                                <div class="controls">
                                    <select class="input-xlarge">
                                        <option>不愿意透露</option>
                                        <option>男</option>
                                        <option>女</option>
                                        <option></option></select>
                                </div>

                            </div>

                            <div class="control-group">

                                <!-- Text input-->
                                <label class="control-label" >单位</label>
                                <div class="controls">
                                    <input type="text" placeholder="单位" class="input-xlarge">
                                    <p class="help-block"></p>
                                </div>
                            </div>

                            <div class="control-group">

                                <!-- Text input-->
                                <label class="control-label" >身份证号</label>
                                <div class="controls">
                                    <input type="text" placeholder="身份证号" class="input-xlarge">
                                    <p class="help-block"></p>
                                </div>
                            </div>

                            <div class="control-group">

                                <!-- Text input-->
                                <label class="control-label" >证件类型</label>
                                <div class="controls">
                                    <input type="text" placeholder="证件类型" class="input-xlarge">
                                    <p class="help-block"></p>
                                </div>
                            </div>

                            <div class="control-group">

                                <!-- Text input-->
                                <label class="control-label" >详情</label>
                                <div class="controls">
                                    <input type="text" placeholder="更多信息" class="input-xlarge">
                                    <p class="help-block"></p>
                                </div>
                            </div>

                        </fieldset>
                    </form>
                   
                </div>
            </section>
        </div>
    </div>
</div>
</body>
</html>
