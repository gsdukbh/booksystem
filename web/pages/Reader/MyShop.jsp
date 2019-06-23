<%--
  Created by IntelliJ IDEA.
  User: li
  Date: 2019/6/20
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="werls" uri="http://werls.top/commons"%>
<html>
<head>
    <title>我的购物车</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css" />
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">
                    我的购物车
                </div>
                <div class="layui-card-body">
                    <form id="pay" method="post" action="${pageContext.request.contextPath}/Shop/delS.action">
                        <table class="table table-hover ">
                            <thead>
                            <tr>
                                <th></th>
                                <th>
                                    书名
                                </th>
                                <th>
                                    作者
                                </th>
                                <th>
                                    出版单位
                                </th>
                                <th>
                                    金额
                                </th>
                                <th>
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${myshop}" var="row">
                                <tr class="error">
                                    <td>
                                        <input type="checkbox" name="ShopIds" value="${row.bookId}" id="ShopIds" />
                                    </td>
                                    <td>
                                        <c:out value="${row.bookInfo.bookName}"/>
                                    </td>
                                    <td>
                                        <c:out value="${row.bookInfo.bookAuthor}"/>
                                    </td>
                                    <td>
                                        <c:out value="${row.bookInfo.bookPublishUnit}"/>
                                    </td>
                                    <td>
                                        <c:out value="${row.quantity} "/>
                                    </td>

                                    <td>
                                        <a href="${pageContext.request.contextPath}/Order/toBuy.action?id=${row.bookId}" class="btn btn-primary btn-xs" id="sdsdsa">购买</a>
                                        <a href="#" class="btn btn-danger btn-xs" onclick="deleteBook(${row.bookId})">移除</a>

                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="col-md-6 text-left">
                            <button type="submit" class="layui-btn layui-btn-radius layui-btn-danger">清空</button>
                            <button type="button" class="layui-btn layui-btn-radius layui-btn-disabled">支付</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function deleteBook(id) {
        if (confirm("确定要删除该图书吗?")) {
            $.post("${pageContext.request.contextPath}/Shop/del.action",
                {"id":id},
                function (date) {
                    if (date == "OK"){
                        alert("删除成功");
                        window.location.reload();
                    }
                    else {
                        alert("删除失败");
                        window.location.reload();
                    }
                }
            )
        }
    }
</script>

</body>
</html>
