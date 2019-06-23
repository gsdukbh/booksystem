<%--
  Created by IntelliJ IDEA.
  User: li
  Date: 2019/6/20
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="werls" uri="http://werls.top/commons"%>
<html>
<head>
    <title>书城</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <%--<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <%--<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>--%>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%--  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">

        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small><span>热门图书</span> 根据你的爱好推荐</small>
                </h1>
            </div>
            <div class="row">
                <c:forEach items="${page.rows}" var="row">
                <div class="row">
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <a href="${pageContext.request.contextPath}/book/Details.action?id=${row.bookId}"><img alt="300x200 封面" src="${pageContext.request.contextPath}${row.bookCover}"/></a>
                            <div class="caption">
                                <h3>
                                    <c:out value="${row.bookName}"/>
                                </h3>
                                <p>
                                    <c:out value="${row.bookRemark}"/>
                                </p>
                                <input type="hidden" value="${row.bookId}" id="bookId">
                                <p>
                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/Details.action?id=${row.bookId}">详情</a>

                                    <a class="btn" href="#" id="ADD">加入购物车</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    </c:forEach>

                </div>
                    <div class="col-md-6 text-right">
                        <werls:page url="${pageContext.request.contextPath }/book/bookShopping.action" />
                    </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    $(function () {
        var id=$("#bookId").val();
        $("#ADD").click(function () {
            $.post("${pageContext.request.contextPath}/Shop/addShopping.action",
                {
                "id":id
                },
                function (date) {
                if (date !='OK') {
                    alert("添加失败")
                }else {
                    alert("加入成功！！你可以去购物车查看哦")
                }
            })
        })
    })
</script>

</body>
</html>
