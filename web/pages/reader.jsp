<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/5/19
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="werls" uri="http://werls.top/commons"%>
<html>
<head>
    <title>读者信息管理</title>

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
                        <li >
                            <a href="${pageContext.request.contextPath}/book/list">图书管理</a>
                        </li>
                        <li class="active">
                            <a href="${pageContext.request.contextPath }/read/list">读者管理</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/borrow/list">借阅信息管理</a>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="borrowID"  placeholder="请输入借阅证号"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="readerName"  placeholder="请输入读者姓名"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="readerUnit"  placeholder="请输入读者单位"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="readerPhone"  placeholder="请输入电话号码"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="readerIDCard"  placeholder="请输入身份号"/>
                        </div>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">我<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="${pageContext.request.contextPath }/logout">退出登陆</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                这部分被挡住了
            </h3>
            <h3 class="text-center">
                读者信息
            </h3>
            <a id="modal-475217" href="#addReader" role="button" class="btn" data-toggle="modal" onclick="clearReader()">新建</a>
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>
                        借阅证号
                    </th>
                    <th>
                        姓名
                    </th>
                    <th>
                        性别
                    </th>
                    <th>
                        单位
                    </th>
                    <th>
                        联系电话
                    </th>
                    <th>
                        身份证号码
                    </th>
                    <th>
                        办卡时间
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
                                ${row.borrowID}
                        </td>
                        <td>
                                ${row.readerName}
                        </td>
                        <td>
                                ${row.readerSex}
                        </td>
                        <td>
                                ${row.readerUnit}
                        </td>
                        <td>
                                ${row.readerPhone}
                        </td>
                        <td>
                                ${row.readerIDCard}
                        </td>
                        <td>
                                ${row.readerTime}
                        </td>
                        <td>
                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#bookEditDialog" onclick= "editReader(${row.borrowID})">修改</a>
                            <a href="#" class="btn btn-danger btn-xs" onclick="deleteReader(${row.borrowID})">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="col-md-12 text-right">
                <werls:page url="${pageContext.request.contextPath }/read/list" />
            </div>
        </div>
    </div>
</div>
<%-- 新建信息模板--%>
<div class="modal fade" id="addReader" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">
                    新建读者信息
                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="addReaderFrom">
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" >借阅证号</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" name="borrowID" id="new_borrowID"> 
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >姓名</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" name="readerName" id="new_readerName">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >性别</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" name="readerSex" id="new_readerSex">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >单位</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" name="readerUnit" id="new_readerUnit">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >联系电话</label>
                            <div class="controls">
                                <input type="text" placeholder="输入数字" class="input-xlarge" name="readerPhone" id="new_readerPhone">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >身份证号码</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" name="readerIDCard" id="new_readerIDCard">
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createReader()">创建读者信息</button>
            </div>
        </div>
    </div>
</div>

<%--修改模板--%>
<div class="modal fade" id="bookEditDialog" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel2">
                    新建读者信息
                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="editBookFrom">
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" >借阅证号</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editBookId" name="borrowID">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >姓名</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editBookName" name="readerName">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >性别</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editBookAuthor" name="readerSex">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >单位</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editBookPublishUnit" name="readerUnit">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >联系电话</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editBookRate" name="readerPhone">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >身份证号码</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editBookRemark" name="readerIDCard">
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="upReader()">修改读者信息</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    /*清空数据*/
    function clearReader() {
        $("#new_borrowID").val("");
        $("#new_readerName").val("");
        $("#new_readerSex").val("");
        $("#newBookPublishUnit").val("");
        $("#new_readerUnit").val("");
        $("#new_readerIDCard").val("");
    }

    function createReader() {
        $.post("${pageContext.request.contextPath }/addReader",
            $("#addReaderFrom").serialize(),function(data)
        {
            if (data == "OK") {
                alert("添加成功");
                window.location.reload();
            }
            else{
                alert("添加失败")
                window.location.reload();
            }
        }  );
    }
    function editReader(id) {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath }/reader/findId",
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

    function upReader() {
        $.post("${pageContext.request.contextPath }/reader/upReader",
            $("#editBookFrom").serialize(),
            function (date) {
                if (date == "OK"){
                    alert("更新成功");
                    window.location.reload();
                }
                else {
                    alert("更新失败");
                    window.location.reload();
                }
            })
    }
    function deleteReader(id) {
        if (confirm("确定要删除该图书吗?")) {
            $.post("${pageContext.request.contextPath }/reader/delete",
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
    $(document).ready(function(){

    });
    
    
</script>


</body>
</html>
