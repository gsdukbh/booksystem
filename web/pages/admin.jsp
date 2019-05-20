<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/5/15
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="werls" uri="http://werls.top/commons"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>图书管理系统</title>
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
                            <a href="#">借阅信息管理</a>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath }/book/find" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="find" id="find"/>
                        </div> 
                        <button type="submit" class="btn btn-default" id="souSuo">搜索</button>
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

    <div class="row clearfix" id="showList">
        <div class="col-md-12 column">
            <h3 class="text-center">
               这部分被挡住了
            </h3>
            <h3 class="text-center">
                图书信息管理
            </h3>
            <a id="modal-475217" href="#addbook" role="button" class="btn" data-toggle="modal" onclick="clearBook()">新建</a>
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
                    <%--<th>
                        分类号
                    </th>--%>
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
                        <%--<td>
                                ${row.bookSort}
                        </td>--%>
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
            <div class="col-md-12 text-right">
                <werls:page url="${pageContext.request.contextPath }book/list" />
            </div>
        </div>
    </div>
</div>
<%-- 新建图书信息模板1--%>
<div class="modal fade" id="addbook" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">
                    新建图书信息
                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="addBookFrom">
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" >图书编号</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="newBookId" name="bookId">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >书名</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="newBookName" name="bookName">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >作者</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="newBookAuthor" name="bookAuthor">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >出版单位</label>
                                <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="newBookPublishUnit" name="bookPublishUnit">
                                 </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >单价</label>
                            <div class="controls">
                                <input type="text" placeholder="输入数字" class="input-xlarge" id="newBookRate" name="bookRate">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" >备注</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="newBookRemark" name="bookRemark">
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> 
                <button type="button" class="btn btn-primary" onclick="createBook()">创建图书信息</button>
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
    /*清空数据*/
  function clearBook() {
      $("#newBookId").val("");
      $("#newBookName").val("");
      $("#newBookAuthor").val("");
      $("#newBookPublishUnit").val("");
      $("#newBookRate").val("");
      $("#newBookRemark").val("");
  }  
   
  function createBook() {
     $.post("<%=basePath%>book/create", 
         $("#addBookFrom").serialize(),Function(data)
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
  function editBook(id) {
   $.ajax({
       type:"get",
       url:"<%=basePath%>book/findId",
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
    $.post("<%=basePath%>book/update"),
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
    }    
  }
   function deleteBook(id) {
         if (confirm("确定要删除该图书吗?")) {
             $.post("<%=basePath%>book/deleteBook",
                 {"id":id},
                 function (date) {
                     if (date == "OK"){
                         alert("图书删除成功");
                         window.location.reload();
                     }
                     else {
                         alert("图书删除失败");
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
