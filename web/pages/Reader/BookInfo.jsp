<%--
  Created by IntelliJ IDEA.
  User: li
  Date: 2019/6/20
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书详情</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css" />
    <style type="text/css">
        .img-circle{
            height: 320px;
            width: 320px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">
                    图书详情
                </div>
                <div class="layui-card-body">
                    <div class="layui-col-md3">
                        <%-- <img class="img-circle" src="http://img3m4.ddimg.cn/32/35/23579654-1_u_3.jpg" id="bookCover">--%>
                        <img class="img-circle" src="${pageContext.request.contextPath}${book.bookCover}" id="bookCover" alt="320*320 图书封面">
                    </div>
                    <div class="layui-col-md9">
                        <div class="container">
                            <h3>
                                书名：${book.bookName}
                            </h3>
                            <br>
                            <h3>
                                作者：${book.bookAuthor}
                            </h3>
                            <br>
                            <h3>
                                出版社：${book.bookPublishUnit}
                            </h3>
                            <br>
                            <h3>
                                分类：${book.bookSort}
                            </h3>
                            <br>

                            <h3>
                                简述：${book.bookRemark}
                            </h3>
                            <input type="hidden" value="${book.bookId}" id="bookId">
                            <br>
                             <button type="button" class="layui-btn layui-btn-radius layui-btn-warm" id="ADD">加入购物车</button>
                            <a href="${pageContext.request.contextPath}/Order/toBuy.action?id=${book.bookId}" > <button type="button" class="layui-btn layui-btn-radius layui-btn-danger" >立即购买</button></a>
                        </div>
                    </div>
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
                    if (date !="OK") {
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
