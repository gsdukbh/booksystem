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
    <%--<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
     <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <%--  <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>--%>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
     <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css" />
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <a id="modal-475217" href="#addReader" role="button" class="btn" data-toggle="modal" onclick="clearReader()">
                <button class="am-btn am-btn-primary am-round">新建</button>
            </a>
            <form method="post" action="${pageContext.request.contextPath}/downloadReader.action" >
                <section class="am-panel  am-panel-primary">
                    <header class="am-panel-hd">          
                        <h3 class="am-panel-title">读者信息</h3>
                    </header>
                    <div class="am-panel-bd">
                        
                        <table class="table table-hover ">
                            <thead>
                            <tr>
                                <th></th>
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
                                <tr class="error">
                                    <td>
                                        <input type="checkbox"name="readerids" value=" ${row.borrowID}">
                                    </td>
                                    <td>
                                           <c:out value=" ${row.borrowID}" />
                                    </td>
                                    <td>
                                            <c:out value="${row.readerName} " />
                                    </td>
                                    <td>
                                            <c:out value="${row.readerSex}" />
                                    </td>
                                    <td>
                                           <c:out value="${row.readerUnit}" />
                                    </td>
                                    <td>
                                            <c:out value=" ${row.readerPhone}" />
                                    </td>
                                    <td>
                                            <c:out value=" ${row.readerIDCard}" />
                                    </td>
                                    <td>
                                           <c:out value="${row.readerTime} " />
                                    </td>
                                    <td>
                                        <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#bookEditDialog" onclick= "editReader(${row.borrowID})">修改</a>
                                        <a href="#" class="btn btn-danger btn-xs" onclick="deleteReader(${row.borrowID})">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>
                <div class="col-md-6 text-left">
                    <button type="submit" class="am-btn am-btn-primary am-round">下载</button>
                </div>
            </form>
            <div class="col-md-6 text-right">
                <werls:page url="${pageContext.request.contextPath }/read/list.action" />
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

                <form class="form-horizontal" id="editreaderFrom">
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" >借阅证号</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editborrowID" name="borrowID">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >姓名</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editreaderName" name="readerName">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >性别</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editreaderSex" name="readerSex">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >单位</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editreaderUnit" name="readerUnit">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >联系电话</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editreaderPhone" name="readerPhone">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >身份证号码</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="editreaderIDCard" name="readerIDCard">
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
        $.post("${pageContext.request.contextPath }/addReader.action",
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
            url:"${pageContext.request.contextPath }/reader/findId.action",
            data:{"id":id},
            success:function (data) {
                $("#editborrowID").val(data.borrowID);
                $("#editreaderName").val(data.readerName);
                $("#editreaderSex").val(data.readerSex);
                $("#editreaderUnit").val(data.readerUnit);
                $("#editreaderPhone").val(data.readerPhone);
                $("#editreaderIDCard").val(data.readerIDCard);
            }
        })
    }

    function upReader() {
        $.post("${pageContext.request.contextPath }/reader/upReader.action",
            $("#editreaderFrom").serialize(),
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
            $.post("${pageContext.request.contextPath }/reader/delete.action",
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
