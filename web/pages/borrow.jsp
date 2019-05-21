<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/5/20
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="werls" uri="http://werls.top/commons"%>
<html>
<head>
    <title>借阅信息</title>
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
                    <a class="navbar-brand" href="${pageContext.request.contextPath }/book/list.action">图书管理系统</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li >
                            <a href="${pageContext.request.contextPath }/book/list.action">图书管理</a>
                        </li>
                        <li >
                            <a href="${pageContext.request.contextPath }/read/list.action">读者管理</a>
                        </li>
                        <li class="active">
                            <a href="${pageContext.request.contextPath }/borrow/list.action">借阅信息管理</a>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath }/borrow/find.action" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="borrowID"  placeholder="请输入借阅证号"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="bookId"  placeholder="请输入图书编号"/>
                        </div>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">我<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="${pageContext.request.contextPath }/logout.action">退出登陆</a>
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
                借阅信息
            </h3>
            <a id="modal-475217" href="#addReader" role="button" class="btn" data-toggle="modal" onclick="clearBorrow()">新建</a>
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>
                        借阅证号
                    </th>
                    <th>
                        图书编号
                    </th>
                    <th>
                        借阅日期
                    </th>
                    <th>
                        续借日期
                    </th>
                    <th>
                        归还日期
                    </th>
                    <th>
                        罚款金额
                    </th>
                    <th>
                        借阅状态
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
                                ${row.bookId}
                        </td>
                        <td>
                                ${row.borrowDay}
                        </td>
                        <td>
                                ${row.borrowRenewDay}
                        </td>
                        <td>
                                ${row.borrowRemandDay}
                        </td>
                        <td>
                                ${row.borrowPenalty}
                        </td>
                        <td>
                                ${row.borrowstatus}
                        </td>
                        <td>
                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#bookEditDialog"  onclick= "editBorrow(${row.borrowID},${row.bookId})">修改</a>
                            <a href="#" class="btn btn-danger btn-xs" onclick="deleteBorrow(${row.borrowID},${row.bookId})">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="col-md-12 text-right">
                <werls:page url="${pageContext.request.contextPath }/borrow/list.action" />
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
                    新建借阅信息
                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="addBorrowFrom">
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" >借阅证号</label>
                                <div class="controls">
                                    <select	class="form-control"  name="borrowID">
                                        <option value="">--请选择--</option>
                                        <c:forEach items="${reader.rows}" var="row">
                                            <option value="${row.borrowID}">
                                                    ${row.borrowID}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >图书编号</label>
                            <div class="controls">
                                <select	class="form-control"  name="bookId">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${book.rows}" var="row">
                                        <option value="${row.bookId}">
                                                ${row.bookId}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >借阅状态</label>
                            <div class="controls">
                                <select	class="form-control"  name="borrowstatus">
                                    <option value="">--请选择--</option>
                                    <option value="1">
                                                在借
                                    </option>
                                    <option value="2">
                                        已归还
                                    </option>
                                </select>
                            </div>
                        </div>
                        
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createBorrow()">创建借阅信息</button>
            </div>
        </div>
    </div>
</div>


%--修改图书模板--%>
<div class="modal fade" id="bookEditDialog" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel2">
                    修改借阅信息
                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="editBorrowFrom">
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" >借阅证号</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editborrowID" name="borrowID">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >图书编号</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editbookId" name="bookId">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >归还图书</label>
                            <div class="controls">
                                <select	class="form-control"  name="borrowRemandDay" id="borrowRemandDay">
                                    <option value="">--请选择--</option>
                                    <option value=null>
                                        否
                                    </option>
                                    <option value="2">
                                        归还
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >续借图书</label>
                            <div class="controls">
                                <select	class="form-control"  name="borrowRenewDay" id="borrowRenewDay">
                                    <option value="">--请选择--</option>
                                    <option value=null>
                                        否
                                    </option>
                                    <option value="">
                                        续借
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >借阅状态</label>
                            <div class="controls">
                                <select	class="form-control"  name="borrowstatus" id="borrowstatus">
                                    <option value="">--请选择--</option>
                                    <option value="1">
                                        在借
                                    </option>
                                    <option value="2">
                                        已归还
                                    </option>
                                </select>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="upBorrow()">修改图书信息</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    /*清空数据*/
    function clearBorrow() {
        $("#new_borrowID").val("");
        $("#new_bookId").val("");
        $("#borrowstatus").val("");
    }

    function createBorrow() {
        $.post("${pageContext.request.contextPath }/borrow/addBorrow.action",
            $("#addBorrowFrom").serialize(),function(data)
        {
            if (data !=null) {
                alert("添加成功");
                window.location.reload();
            }
            else{
                alert("添加失败")
                window.location.reload();
            }
        } );
    }
    function editBorrow(borrowID,bookId) {
        var editborrowID=borrowID;
        var editbookId=bookId;
        $("#editborrowID").val(editborrowID);
        $("#editbookId").val(editbookId);
    }
    
    function upBorrow() {
        var  borrowID=$("#editborrowID").val();
        var  bookId=$("#editbookId").val();
        var  borrowRemandDay= $("#borrowRemandDay").val() ;
        var  borrowRenewDay= $("#borrowRenewDay").val() ;
        var  borrowstatus= $("#borrowstatus").val() ;
        $.post("${pageContext.request.contextPath }/borrow/renewBorrow.action",
             {   
                "borrowID":borrowID,
                 "bookId":bookId,
                "borrowRemandDay":borrowRemandDay,
                 "borrowRenewDay":borrowRenewDay,
                 "borrowstatus":borrowstatus
             },
           function (data) {
               if (data !=null) {
                   alert("成功");
                   window.location.reload();
               }
               else{
                   alert("失败")
                   window.location.reload();
               }
        })
    }
    
    function deleteBorrow(borrowID,bookId) {
        if (confirm("确定要删除该图书吗?")) {
            $.post("${pageContext.request.contextPath }/borrow/delete.action",
                {"borrowID":borrowID,
                 "bookId" :bookId
                },
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
