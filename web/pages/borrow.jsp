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
    <%--<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
     <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
   <%-- <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>--%>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
     <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css" />

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            
            <a id="modal-475217" href="#addReader" role="button" class="btn" data-toggle="modal" onclick="clearBorrow()">
                <button class="am-btn am-btn-primary am-round">新建</button>
            </a>
            <form>
            <section class="am-panel am-panel-primary ">
                <header class="am-panel-hd">
                    <h3 class="am-panel-title">借阅信息</h3>
                </header>
                <div class="am-panel-bd">
                    <table class="table table-hover ">
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
                            <tr class="error">
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
                </div>
            </section>
               <%-- <div class="col-md-6 text-left">
                    <button type="submit" class="am-btn am-btn-primary am-round">下载</button>
                </div>--%>
            </form>
            
            <div class="col-md-6 text-right">
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


<%--修改图书模板--%>
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
                                    <option value="2">
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
        var editborrowID = borrowID;
        var editbookId = bookId;
        $("#editborrowID").val(editborrowID);
        $("#editbookId").val(editbookId);
    }
    function upBorrow() {
        var  borrowID=$("#editborrowID").val();
        var  bookId=$("#editbookId").val();
        var  borrowRemandDay= $("#borrowRemandDay").val() ;
        var  borrowRenewDay= $("#borrowRenewDay").val() ;
        var  borrowstatus= $("#borrowstatus").val() ;
        $.post("${pageContext.request.contextPath }/borrow/upBorrow.action",
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
                    if (date !=null){
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
