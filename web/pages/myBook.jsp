<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/6/12
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>我的图书</title>
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
            <section class="am-panel am-panel-secondary">
                <header class="am-panel-hd">
                    <h3 class="am-panel-title">图书记录</h3>
                </header>
                <div class="am-panel-bd">
                    <span class="label label-info">我的图书借阅记录</span>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>
                                书名
                            </th>
                            <th>
                                作者
                            </th>
                            <th>
                                借阅日期
                            </th>
                            <th>
                                状态
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${myBooks.bookInfoList}" var="row">
                            <tr>
                                <td>
                                    <c:out value="${row.bookName}"/>
                                </td>
                                <td>
                                    <c:out value="${row.bookAuthor}"/>
                                </td>
                                <td>
                                    <c:out value="${row.borrowInfo.borrowDay}"/>
                                </td>
                                <td>
                                    <c:out value="${row.borrowInfo.borrowstatus}"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
</html>
