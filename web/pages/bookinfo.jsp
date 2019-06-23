<%--
  Created by IntelliJ IDEA.
  User: li
  Date: 2019/6/20
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="werls" uri="http://werls.top/commons"%>
<!DOCTYPE html>
<html>
<head>
    <title>图书详情</title>

    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <%--<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <%--<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>--%>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%--  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css" />

    <link rel="stylesheet" href="//at.alicdn.com/t/font_1249044_6gj4y064jdd.css" />

    <style type="text/css">
        .img-circle{
            height: 320px;
            width: 320px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
     <div class="row">
         <div class="layui-col-md12">
             <div class="layui-card">
                 <div class="layui-card-header">
                     图书详情
                 </div>
                 <div class="layui-card-body">
                     <div class="layui-col-md3">
                        <%-- <img class="img-circle" src="http://img3m4.ddimg.cn/32/35/23579654-1_u_3.jpg" id="bookCover">--%>
                            <img class="img-circle" src="${pageContext.request.contextPath}${book.bookCover}" id="bookCover" alt="320*320 图书封面">
                     </div>
                     <div class="layui-col-md9">
                         <div class="container">
                             <h3>
                                 书名：${book.bookName}
                             </h3>
                             <br>
                             <h3>
                                 作者：${book.bookAuthor}
                             </h3>
                             <br>
                             <h3>
                                 出版社：${book.bookPublishUnit}
                             </h3>
                             <br>
                             <h3>
                                 分类：${book.bookSort}
                             </h3>
                             <br>

                             <h3>
                                简述：${book.bookRemark}
                             </h3>
                             <br>
                             <form action="${pageContext.request.contextPath}/book/bookimg.action" enctype="multipart/form-data" method="post">
                                 <input type="file" name="uploadfile">
                                 <input name="id" type="hidden" value="${book.bookId}">
                                 <br>
                                 <button type="submit" class="layui-btn" id="img1"><i class="iconfont iconico_compile"></i>修改图片</button>
                             </form>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
    <div class="container-fluid">
        <div class="row">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-header">
                        订单详情
                    </div>
                    <div class="layui-card-body">
                        <div class="col-md-12 column">

                            <form action="${pageContext.request.contextPath}/downloadFrom.action" method="post">

                                <div class="am-panel-hd"></div>
                                <div class="am-panel-bd">
                                    <table class="table table-hover ">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th>
                                                订单号
                                            </th>
                                            <th>
                                                下单时间
                                            </th>
                                            <th>
                                                支付状态
                                            </th>
                                            <th>
                                                收货人
                                            </th>
                                            <th>
                                                收货地址
                                            </th>
                                            <th>
                                                订单状态
                                            </th>
                                            <th>
                                                操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${From.rows}" var="row">
                                            <tr class="error">
                                                <td>
                                                    <input type="checkbox"name="ids" value="${row.orde_form_id}">
                                                </td>
                                                <td>
                                                    <c:out value="${row.orde_form_id}" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.orde_form_create_time}" />
                                                </td>
                                                <td>
                                                    <c:if test="${row.orde_form_Pay_time!=null}">
                                                        <c:out value="已支付"/>
                                                    </c:if>
                                                    <c:if test="${row.orde_form_Pay_time ==null}">
                                                        <c:out value="未支付"/>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <c:out value="${row.orde_form_consignee} "/>
                                                </td>
                                                <td>
                                                    <c:out value="${row.orde_form_shipping_address}"/>
                                                </td>
                                                <td>
                                                    <c:if test="${row.orde_form_shipment_number!=null}">
                                                        <c:out value="已发货"/>
                                                    </c:if>
                                                    <c:if test="${row.orde_form_shipment_number==null}">
                                                        <c:out value="未发货"/>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#Ship" onclick= "Ship(${row.orde_form_id})">发货 </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="col-md-6 text-left">
                                    <button type="submit" class="layui-btn layui-btn-radius layui-btn-primary">下载</button>
                                </div>
                            </form>
                            <div class="col-md-6 text-right">
                                <werls:page url="${pageContext.request.contextPath }/book/BookShop.action" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--发货填写--%>

<div class="modal fade" id="Ship" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel2">

                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="OrderFrom">
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" for="orde_form_id">订单号</label>
                            <div class="controls" >
                                <input type="text" placeholder="请输入" class="input-xlarge" id="orde_form_id" name="orde_form_id">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="orde_form_consignee">收货人</label>
                            <div class="controls" >
                                <input type="text" placeholder="请输入" class="input-xlarge" id="orde_form_consignee" name="orde_form_consignee">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="orde_form_shipping_address">收货地址</label>
                            <div class="controls" >
                                <input type="text" placeholder="请输入" class="input-xlarge" id="orde_form_shipping_address" name="orde_form_shipping_address">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="orde_form_shipper">发件人</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入发货人" class="input-xlarge" id="orde_form_shipper" name="orde_form_shipper">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="orde_form_delivery_address">发货地址</label>
                            <div class="controls">
                                <input type="text" placeholder="输入发货地址" class="input-xlarge" id="orde_form_delivery_address" name="orde_form_delivery_address">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="orde_form_courier_company">快递公司</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="orde_form_courier_company" name="orde_form_courier_company">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="orde_form_shipment_number">物流单号</label>
                            <div class="controls">
                                <input type="text" placeholder="请输入" class="input-xlarge" id="orde_form_shipment_number" name="orde_form_shipment_number">
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="upOrder()">发货</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function Ship(id) {
        console.log("获取的id："+id);
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/Order/getId.action",
            data:{"id":id},
            success:function (data) {
                console.log("获取的数据是：" +data.toString());
               $("#orde_form_id").val(data.orde_form_id);
                $("#orde_form_consignee").val(data.orde_form_consignee);
                $("#orde_form_shipping_address").val(data.orde_form_shipping_address);
            }
        })
    }
    function upOrder() {
      $.post("${pageContext.request.contextPath}/Order/edit.action"),$("#OrderFrom").serialize(),function (date) {
          if (date=='OK'){
              alert("发货成功");
          } else {
              alert("发货失败！！")
          }
      }
    }
</script>
</body>
</html>
