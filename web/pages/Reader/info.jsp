<%--
  Created by IntelliJ IDEA.
  User: li
  Date: 2019/6/20
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成功</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="alert alert-dismissable alert-success col-md-6">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4>
                    亲！！请扫描下面的图片哦
                </h4>
                <a href="${pageContext.request.contextPath}/totoREder.action" class="alert-link">返回</a>
            </div>
            <div class="col-md-6">
              <img src="${pageContext.request.contextPath}/images/pay.jpg" style="width: 320px;height: 320px">
            </div>
        </div>
    </div>
</div>
</body>
</html>
