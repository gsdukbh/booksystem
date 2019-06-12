<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/6/11
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>图书信息上传</title>

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
            
            <div class="am-panel am-panel-default">
                
                <div class="am-panel-bd">
                    
                    <form action="${pageContext.request.contextPath }/bookUpfile.action" method="post" enctype="multipart/form-data" >

                        <div class="am-g">
                            <div class="am-u-sm-2">
                                <i class="am-icon-cloud-upload"></i> 请选择文件:
                            </div>
                            <div class="am-u-sm-10">
                                
                                <input id="file" type="file" name="uploadfile" multiple="multiple" /><br/> 
                                
                            </div>
                        </div>
                        <input type="submit" value="上传" />
                        
                    </form>
                    
                </div>
                
            </div> 
    
        </div>
    </div>
</div>
</body>
</html>
