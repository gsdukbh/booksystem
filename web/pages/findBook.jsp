<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/5/21
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索结果</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%--导航栏--%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath }/book/list">图书管理系统</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="${pageContext.request.contextPath }/book/list">图书管理</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/read/list">读者管理</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/borrow/list">借阅信息管理</a>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath }/book/find" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="bookName"  placeholder="请输入书名"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="bookId"  placeholder="请输入图书编号"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="bookAuthor"  placeholder="请输入作者"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="bookPublishUnit"  placeholder="请输入出版单位"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="bookSort"  placeholder="请输入分类号"/>
                        </div>
                        <button type="submit" class="btn btn-default" >搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">我<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="${pageContext.request.contextPath}/logout">退出登陆</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>

    <div class="row clearfix" id="showList">
        <div class="col-md-12 column">
            <h3 class="text-center">
                这部分被挡住了
            </h3>
            <h3 class="text-center">
                图书信息管理
            </h3>
            <span class="label label-success">搜索结果</span>
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>
                        图书编号
                    </th>
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
                        分类号
                    </th>
                    <th>
                        单价
                    </th>
                    <th>
                        备注
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.rows}" var="row">
                    <tr class="warning">
                        <td>
                                ${row.bookId}
                        </td>
                        <td>
                                ${row.bookName}
                        </td>
                        <td>
                                ${row.bookAuthor}
                        </td>
                        <td>
                                ${row.bookPublishUnit}
                        </td>
                        <td>
                                ${row.bookSort}
                        </td>
                        <td>
                                ${row.bookRate}
                        </td>
                        <td>
                                ${row.bookRemark}
                        </td>
                        <td>
                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#bookEditDialog" onclick= "editBook(${row.bookId})">修改</a>
                            <a href="#" class="btn btn-danger btn-xs" onclick="deleteBook(${row.bookId})">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%--修改图书模板--%>
<div class="modal fade" id="bookEditDialog" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel2">
                    修改图书信息
                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="editBookFrom">
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" >图书编号</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editBookId" name="bookId">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >书名</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editBookName" name="bookName">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >作者</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editBookAuthor" name="bookAuthor">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >出版单位</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editBookPublishUnit" name="bookPublishUnit">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >单价</label>
                            <div class="controls">
                                <input type="text" placeholder="输入数字" class="input-xlarge" id="editBookRate" name="bookRate">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >备注</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editBookRemark" name="bookRemark">
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="upBook()">修改图书信息</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function editBook(id) {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/book/findId",
            data:{"id":id},
            success:function (data) {
                $("#editBookId").val(data.bookId);
                $("#editBookName").val(data.bookName);
                $("#editBookAuthor").val(data.bookAuthor);
                $("#editBookPublishUnit").val(data.bookPublishUnit);
                $("#editBookRate").val(data.bookRate);
                $("#editBookRemark").val(data.bookRemark);
            }
        })
    }
    function upBook() {
        $.post("${pageContext.request.contextPath }/book/update",
            $("#editBookFrom").serialize(),
            function (date) {
                if (date == "OK"){
                    alert("图书更新成功");
                    window.location.reload();
                }
                else {
                    alert("图书更新失败");
                    window.location.reload();
                }
            } )
    }   
</script>


</body>
</html>
