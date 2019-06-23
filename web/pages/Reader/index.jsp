<%--
  Created by IntelliJ IDEA.
  User: werls
  Date: 2019/6/11
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>读者信息</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <%--<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <%--<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>--%>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%--  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.datatables.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app1.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1249044_8eibci7bn7i.css">
</head>
<body>
<script src="${pageContext.request.contextPath}/js/theme.js"></script>

<div class="am-g tpl-g">
    <!-- 头部 -->
    <header>
        <!-- logo -->
        <div class="am-fl tpl-header-logo">
            <a href="#"><img src="${pageContext.request.contextPath}/images/logo.png" alt=""></a>
        </div>
        <!-- 右侧内容 -->
        <div class="tpl-header-fluid">
            <!-- 侧边切换 -->
            <div class="am-fl tpl-header-switch-button am-icon-list">
                <span></span>
            </div>
            <!-- 搜索 -->
            <div class="am-fl tpl-header-search">
                <form class="tpl-header-search-form" action="javascript:;">
                    <button class="tpl-header-search-btn am-icon-search"></button>
                    <input class="tpl-header-search-box" type="text" placeholder="搜索内容...">
                </form>
            </div>
            <!-- 其它功能-->
            <div class="am-fr tpl-header-navbar">
                <ul>
                    <!-- 欢迎语 -->
                    <li class="am-text-sm tpl-header-navbar-welcome">
                        <a href="#">欢迎你, <span>${sessionScope.Reader_SESSION.readerName}</span> </a>
                    </li>

                    <!-- 新邮件 -->
                    <%--<li class="am-dropdown tpl-dropdown" data-am-dropdown>
                        <a href="#" class="am-dropdown-toggle tpl-dropdown-toggle" data-am-dropdown-toggle>
                            <i class="am-icon-envelope"></i>
                            <span class="am-badge am-badge-success am-round item-feed-badge">4</span>
                        </a>
                        <!-- 弹出列表 -->
                        <ul class="am-dropdown-content tpl-dropdown-content">
                            <li class="tpl-dropdown-menu-messages">
                                <a href="#" class="tpl-dropdown-menu-messages-item am-cf">
                                    <div class="menu-messages-ico">
                                        <img src="${pageContext.request.contextPath}/images/user04.png" alt="">
                                    </div>
                                    <div class="menu-messages-time">
                                        3小时前
                                    </div>
                                    <div class="menu-messages-content">
                                        <div class="menu-messages-content-title">
                                            <i class="am-icon-circle-o am-text-success"></i>
                                            <span>夕风色</span>
                                        </div>
                                        <div class="am-text-truncate"> Amaze UI 的诞生，依托于 GitHub 及其他技术社区上一些优秀的资源；Amaze UI 的成长，则离不开用户的支持。 </div>
                                        <div class="menu-messages-content-time">2016-09-21 下午 16:40</div>
                                    </div>
                                </a>
                            </li>

                            <li class="tpl-dropdown-menu-messages">
                                <a href="#" class="tpl-dropdown-menu-messages-item am-cf">
                                    <div class="menu-messages-ico">
                                        <img src="${pageContext.request.contextPath}/images/user02.png" alt="">
                                    </div>
                                    <div class="menu-messages-time">
                                        5天前
                                    </div>
                                    <div class="menu-messages-content">
                                        <div class="menu-messages-content-title">
                                            <i class="am-icon-circle-o am-text-warning"></i>
                                            <span>禁言小张</span>
                                        </div>
                                        <div class="am-text-truncate"> 为了能最准确的传达所描述的问题， 建议你在反馈时附上演示，方便我们理解。 </div>
                                        <div class="menu-messages-content-time">2016-09-16 上午 09:23</div>
                                    </div>
                                </a>
                            </li>
                            <li class="tpl-dropdown-menu-messages">
                                <a href="#" class="tpl-dropdown-menu-messages-item am-cf">
                                    <i class="am-icon-circle-o"></i> 进入列表…
                                </a>
                            </li>
                        </ul>
                    </li>
--%>
                    <!-- 新提示 -->
                    <li class="am-dropdown" data-am-dropdown>
                        <a href="#" class="am-dropdown-toggle" data-am-dropdown-toggle>
                            <i class="iconfont icongouwuchekong"></i>
                            <span class="am-badge am-badge-warning am-round item-feed-badge">${shu}</span>
                        </a>

                        <!-- 弹出列表 -->
                        <ul class="am-dropdown-content tpl-dropdown-content">
                            <li class="tpl-dropdown-menu-notifications">
                                <a href="#" class="tpl-dropdown-menu-notifications-item am-cf">
                                    <div class="tpl-dropdown-menu-notifications-title">
                                        <i class="am-icon-line-chart"></i>
                                        <span> 有6笔新的销售订单</span>
                                    </div>
                                    <div class="tpl-dropdown-menu-notifications-time">
                                        12分钟前
                                    </div>
                                </a>
                            </li>
                            <li class="tpl-dropdown-menu-notifications">
                                <a href="#" class="tpl-dropdown-menu-notifications-item am-cf">
                                    <div class="tpl-dropdown-menu-notifications-title">
                                        <i class="am-icon-star"></i>
                                        <span> 有3个来自人事部的消息</span>
                                    </div>
                                    <div class="tpl-dropdown-menu-notifications-time">
                                        30分钟前
                                    </div>
                                </a>
                            </li>
                            <li class="tpl-dropdown-menu-notifications">
                                <a href="#" class="tpl-dropdown-menu-notifications-item am-cf">
                                    <div class="tpl-dropdown-menu-notifications-title">
                                        <i class="am-icon-folder-o"></i>
                                        <span> 上午开会记录存档</span>
                                    </div>
                                    <div class="tpl-dropdown-menu-notifications-time">
                                        1天前
                                    </div>
                                </a>
                            </li>


                            <li class="tpl-dropdown-menu-notifications">
                                <a href="javascript:;" class="tpl-dropdown-menu-notifications-item am-cf">
                                    <i class="am-icon-bell"></i> 进入列表…
                                </a>
                            </li>
                        </ul>
                    </li>

                    <!-- 退出 -->
                    <li class="am-text-sm">
                        <a href="${pageContext.request.contextPath }/logout.action">
                            <span class="am-icon-sign-out"></span> 退出
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </header>
    <!-- 风格切换 -->
    <div class="tpl-skiner">
        <div class="tpl-skiner-toggle am-icon-cog">
        </div>
        <div class="tpl-skiner-content">
            <div class="tpl-skiner-content-title">
                选择主题
            </div>
            <div class="tpl-skiner-content-bar">
                <span class="skiner-color skiner-white" data-color="theme-white"></span>
                <span class="skiner-color skiner-black" data-color="theme-black"></span>
            </div>
        </div>
    </div>
    <!-- 侧边导航栏 -->
    <div class="left-sidebar">
        <!-- 用户信息 -->
        <div class="tpl-sidebar-user-panel">
            <div class="tpl-user-panel-slide-toggleable">
                <div class="tpl-user-panel-profile-picture">
                    <img src="${pageContext.request.contextPath}/images/user02.png" alt="">
                </div>
                <span class="user-panel-logged-in-text">
               <i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i>
                    你好呀! ${sessionScope.Reader_SESSION.readerName}
          </span>
                <a href="" class="tpl-user-panel-action-link"> <span class="am-icon-pencil"></span> 账号设置</a>
            </div>
        </div>

        <!-- 菜单 -->
        <ul class="sidebar-nav">
            <li class="sidebar-nav-heading">功能 <span class="sidebar-nav-heading-info"> </span></li>
            <li class="sidebar-nav-link">
                <a href="${pageContext.request.contextPath}/book/bookShopping.action" target="table" >
                    <i class="am-icon-home sidebar-nav-link-logo"></i> 首页
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="${pageContext.request.contextPath}/me/MyShop.action" target="table" class="sidebar-nav-sub-title">
                    <i class="iconfont icongouwuchekong"></i> 我的购物车
                    <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                </a>
                <ul class="sidebar-nav sidebar-nav-sub">
                    <li class="sidebar-nav-link">
                        <a href="${pageContext.request.contextPath}/to404.action"  target="table" >
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 物流信息
                        </a>
                    </li>

                    <li class="sidebar-nav-link">
                        <a href="${pageContext.request.contextPath}/to404.action" target="table">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 图书推荐
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-nav-link">
                <a href="${pageContext.request.contextPath}/to404.action" target="table" class="sidebar-nav-sub-title">
                    <i class="am-icon-calendar sidebar-nav-link-logo"></i> 我的信息
                    <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                </a>
                <ul class="sidebar-nav sidebar-nav-sub">
                    <li class="sidebar-nav-link">
                        <a href="${pageContext.request.contextPath}/to404.action" target="table">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 信息修改
                        </a>
                    </li>

                    <li class="sidebar-nav-link">
                        <a href="" target="table">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 头像上传
                        </a>
                    </li>
                </ul>
            </li>

            
            <li class="sidebar-nav-heading">更多<span class="sidebar-nav-heading-info"> </span></li>
            <li class="sidebar-nav-link">
                <a href="${pageContext.request.contextPath}/to404.action" class="sidebar-nav-sub-title">
                    <i class="am-icon-table sidebar-nav-link-logo"></i> 数据列表
                    <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                </a>
                <ul class="sidebar-nav sidebar-nav-sub">
                    <li class="sidebar-nav-link">
                        <a href="${pageContext.request.contextPath}/to404.action">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 文字列表
                        </a>
                    </li>

                    <li class="sidebar-nav-link">
                        <a href="${pageContext.request.contextPath}/to404.action">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 图文列表
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-nav-link">
                <a href="${pageContext.request.contextPath}/to404.action">
                    <i class="am-icon-clone sidebar-nav-link-logo"></i> 注册
                    <span class="am-badge am-badge-secondary sidebar-nav-link-logo-ico am-round am-fr am-margin-right-sm">6</span>
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="${pageContext.request.contextPath}/to404.action">
                    <i class="am-icon-key sidebar-nav-link-logo"></i> 登录
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="${pageContext.request.contextPath}/to404.action">
                    <i class="am-icon-tv sidebar-nav-link-logo"></i> 404错误
                </a>
            </li>
        </ul>
    </div>


    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">

        <div class="container-fluid am-cf">
            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                    <div class="page-header-heading">
                        <span class="am-icon-home page-header-heading-icon"></span> 纸媒书城 <small>welcome</small></div>
                    <p class="page-header-description">看你想看</p>
                </div>
            </div>
        </div>

        <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
            <iframe name="table" frameborder="0" width="100%" height="750px">

            </iframe>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>

<script src="${pageContext.request.contextPath}/js/amazeui.datatables.min.js"></script>

<script src="${pageContext.request.contextPath}/js/dataTables.responsive.min.js"></script>

<script src="${pageContext.request.contextPath}/js/app1.js"></script>

<script type="text/javascript">
    /*检查信息*/
    $(document).ready(function () {
        var user='${sessionScope.Reader_SESSION.readerName}';
        if (user !=''){
            
        }   else {
            alert("你的信息还未完善，请更新");
        }
      
    })
    
</script>

</body>
</html>
