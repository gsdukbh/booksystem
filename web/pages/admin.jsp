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
    <div class="row clearfix" id="showList">
        <div class="col-md-12 column">
            <a id="modal-475217" href="#addbook" role="button" class="btn" data-toggle="modal" onclick="clearBook()">
                <button class="am-btn am-btn-primary am-round">新建</button>
            </a>
            <a href="https://werls.top">我的网站</a>
            
                    <form action="${pageContext.request.contextPath}/downloadBook.action" method="post">
                        <div class="am-panel am-panel-primary">
                            <div class="am-panel-hd">图书信息</div>
                            <div class="am-panel-bd">
                        <table class="table table-hover ">
                            <thead>
                            <tr>
                                <th></th>
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
                                <%--<th>
                                  详情
                                </th>--%>
                                <th>
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.rows}" var="row">
                                <tr class="error">
                                    <td>
                                        <input type="checkbox"name="bookInfoIds" value="${row.bookId}">
                                    </td>
                                    <td>
                                        <c:out value="${row.bookId}" />
                                    </td>
                                    <td>
                                        <c:out value="${row.bookName}" />
                                    </td>
                                    <td>
                                        <c:out value="${row.bookAuthor}"/>
                                    </td>
                                    <td>
                                        <c:out value="${row.bookPublishUnit} "/>
                                    </td>
                                    <td>
                                        <c:out value="${row.bookRate}"/>
                                    </td>
                                   <%-- <td>
                                        <c:out value="${row.bookRemark} "/>
                                    </td>--%>
                                    <td>
                                        <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#bookEditDialog" onclick= "editBook(${row.bookId})">修改</a>
                                        <a href="${pageContext.request.contextPath}/book/Id.action?id=${row.bookId}" class="btn btn-primary btn-xs" >详情</a>
                                        <a href="#" class="btn btn-danger btn-xs" onclick="deleteBook(${row.bookId})">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                            </div>
                        </div>
                        <div class="col-md-6 text-left">
                            <button type="submit" class="am-btn am-btn-primary am-round">下载</button>
                        </div>
                    </form>
            <div class="col-md-6 text-right">
                <werls:page url="${pageContext.request.contextPath }/book/list.action" />
            </div>
        </div>
    </div>
</div>
<%-- 新建图书信息模板--%>
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
                            <label class="control-label"  for="newBookId">图书编号</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="newBookId" name="bookId">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="newBookName">书名</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="newBookName" name="bookName">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="newBookAuthor">作者</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="newBookAuthor" name="bookAuthor">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="newBookPublishUnit">出版单位</label>
                                <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="newBookPublishUnit" name="bookPublishUnit">
                                 </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="newBookRate">单价</label>
                            <div class="controls">
                                <input type="text" placeholder="输入数字" class="input-xlarge" id="newBookRate" name="bookRate">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="newBookRemark">详情</label>
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
   <div id="find"></div>

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
      $.post("${pageContext.request.contextPath }/book/create.action",
          $("#addBookFrom").serialize(),function(data) {
          alert("添加成功");
          window.location.reload();
          } );
  }
  function editBook(id) {
   $.ajax({
       type:"get",
       url:"<%=basePath%>book/findId.action",
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
    $.post("${pageContext.request.contextPath }/book/update.action",
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
   function deleteBook(id) {
         if (confirm("确定要删除该图书吗?")) {
             $.post("<%=basePath%>book/deleteBook.action",
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
   
</script>
</body>
</html>
