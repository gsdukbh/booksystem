<%--
  Created by IntelliJ IDEA.
  User: li
  Date: 2019/6/20
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购买</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <link href="${pageContext.request.contextPath}/css/layui.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/layui.js"></script>
    <script>
        layui.use('form', function(){
            var form = layui.form;

            //各种基于事件的操作，下面会有进一步介绍
        });
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    购买商品
                </h1>
            </div>
            <div class="progress active progress-striped">
                <div class="progress-bar progress-success" style="width:90%">
                </div>
            </div>
            <form class="layui-form" action="${pageContext.request.contextPath}/Order/buy.action" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">收货人</label>
                    <div class="layui-input-block">
                        <input type="text" name="orde_form_consignee" required  lay-verify="required" placeholder="请输入名字" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">收货地址</label>
                    <div class="layui-input-inline">
                        <select name="add" id="add1">
                            <option value="">请选择省</option>
                            <option value="浙江" selected="">浙江省</option>
                            <option value="你的工号">江西省</option>
                            <option value="你最喜欢的老师">福建省</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="add" id="add2">
                            <option value="">请选择市</option>
                            <option value="杭州">杭州</option>
                            <option value="宁波" disabled="">宁波</option>
                            <option value="温州">温州</option>
                            <option value="温州">台州</option>
                            <option value="温州">绍兴</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="quiz3" id="add3">
                            <option value="">请选择县/区</option>
                            <option value="西湖区">西湖区</option>
                            <option value="余杭区">余杭区</option>
                            <option value="拱墅区">临安市</option>
                        </select>
                    </div>
                    <div class="layui-form-mid layui-word-aux">详情</div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">详情地址</label>
                    <div class="layui-input-block">
                        <textarea name="orde_form_shipping_address" placeholder="请输入内容" class="layui-textarea" id="orde_form_shipping_address"></textarea>
                    </div>
                </div>
                <input type="hidden"value="${id}" name="bookId">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit lay-filter="formDemo" id="tijiao">立即支付</button>
                        <button type="reset " class="layui-btn layui-btn-danger">重置</button>
                    </div>

                </div>

            </form>
        </div>
    </div>
</div>


</body>
</html>
