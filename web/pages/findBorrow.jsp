<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/5/21
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="werls" uri="http://werls.top/commons"%>
<html>
<head>
    <title>搜索结果</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <%--<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
     <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <%--  <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>--%>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
     <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
           
            <span class="label label-success">搜索结果</span>
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
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.rows}" var="row">
                    <tr>
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
                            <a href="#" class="btn btn-danger btn-xs" onclick="deleteBorrow(${row.borrowID}, ${row.bookId})">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="col-md-6 text-right">
                <werls:page url="${pageContext.request.contextPath }/borrow/find.action"/>
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
                    修改借阅信息
                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="editBookFrom">
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
