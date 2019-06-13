<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/6/12
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的信息</title>
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
    <div class="row clearfix">
        <div class="col-md-12 column">
            <section class="am-panel am-panel-secondary">
                <header class="am-panel-hd">
                    <h3 class="am-panel-title">我的信息</h3>
                </header>
                <div class="am-panel-bd">

                    <span class="label label-info">我的信息</span>


                    <form class="form-horizontal" role="form" id="information">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" name="borrowID"  class="form-control" id="inputEmail3" value=" ${sessionScope.Reader_SESSION.borrowID}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">我的名字</label>
                            <div class="col-sm-10">
                                <input type="text" name="readerName"  class="form-control" id="name" value=" ${sessionScope.Reader_SESSION.readerName}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="readerSex" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <div class="controls">
                                    <p class="col-sm-1">${sessionScope.Reader_SESSION.readerSex}</p>
                                    <select class="input-xlarge" name="readerSex" id="readerSex">
                                        <option value="不愿意透露" >不愿意透露</option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                        <option></option></select>
                                </div>
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="readerPhone" class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="readerPhone"  id="readerPhone" value=" ${sessionScope.Reader_SESSION.readerPhone}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="readerUnit" class="col-sm-2 control-label">单位</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="readerUnit"  id="readerUnit" value=" ${sessionScope.Reader_SESSION.readerUnit}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="readerIDCard" class="col-sm-2 control-label">身份证号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="readerIDCard"  id="readerIDCard" value=" ${sessionScope.Reader_SESSION.readerIDCard}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="readerType" class="col-sm-2 control-label">证件类型</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="readerType"  id="readerType" value=" ${sessionScope.Reader_SESSION.readerType}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="readerTime" class="col-sm-2 control-label">注册时间</label>
                            <div class="col-sm-10">
                               <%-- <input type="text" class="form-control"name="readerTime"  id="readerTime" value=" ${sessionScope.Reader_SESSION.readerTime}" />--%>
                                <p id="readerTime" >${sessionScope.Reader_SESSION.readerTime}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="raederCondition" class="col-sm-2 control-label">详情</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="raederCondition"  id="raederCondition" value=" ${sessionScope.Reader_SESSION.raederCondition}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-5 col-sm-5">
                                <button id="seva"  type="button" class="am-btn am-btn-primary am-round">保存</button>
                            </div>
                        </div>
                    </form>
                    
                </div>
            </section>
        </div>
    </div>
</div>
   <script type="text/javascript">
        $(document).ready(function () {
          $("#seva").click(function () {
              $.post("${pageContext.request.contextPath}/reader/upReader.action",
                $("#information").serialize(),function (date) {
                  if (date=="ok"){
                    alert("保存成功");
                      window.location.reload();
                  } else {
                      alert("保存失败");
                      window.location.reload();
                  }
                    
                }
                  )
          })  
            
        })
   </script>

</body>
</html>
