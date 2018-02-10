<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name=”viewport” content=”width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no″>
    <title>后台模板</title>
    <link rel="stylesheet" href="/static/css/systemStyle.css">
    <%@ include file="base.jsp" %>
    <script>
        var layer;
        layui.use(['layer'],function () {
            layer=layui.layer;
        });
    </script>
</head>
<!--禁止复制，禁止鼠标右键-->
<body oncontextmenu="return false" onselect="return false">
<!-- 主页面div-->
<div class="system-admin-main">
    <!-- 头部开始 -->
    <div class="header">
        <!-- 头部导航开始 -->
        <div class="system-nav">
            <!-- 头部logo -->
            <div class="system-logo">
                <img src="/static/img/icon/icon-headimg.png">海思大数据管理中心 HASS DB CENTER
            </div>
            <!-- 导航右侧菜单开始 -->
            <div class="system-layout-right">
                <ul>
                    <!-- 导航菜单项 -->
                    <li class="system-layout-item">
                        <a href="javascript:;">
                            <span class="item-hint-info">99+</span>
                            <i class="system-layout-item-nav-i system-layout-tiping iconfont icon-xiaoxi2"></i> 消息</a>
                    </li>
                    <li class="system-layout-item system-layout-skin"><a href="javascript:;"><span class="item-hint-point"></span><i
                            class="system-layout-item-nav-i iconfont icon-icon_skin"></i> 皮肤</a>
                    </li>
                    <li class="system-layout-item system-layout-settings"><a href="javascript:;"><i style="font-size: 18px !important;"
                                                                             class="system-layout-item-nav-i iconfont icon-setting1"></i>
                        设置</a></li>
                    <li class="system-layout-item">
                        <a href="javascript:;"><i class="system-layout-item-nav-i iconfont icon-cc-head"></i> ${sessionScope.currentSystemUser.nickName}<span
                                class="square-icon"></span></a>
                        <!-- 导航子菜单，可以在每一个菜单项的a标签后面添加-->
                        <ul class="system-layout-item-child">
                            <li class="system-layout-item-child-li"><a href="javascript:;">安全设置</a></li>
                            <li class="system-layout-item-child-li"><a href="javascript:;">个人中心</a></li>
                            <li class="system-layout-item-child-li"><a href="javascript:;">资料详情</a></li>
                            <li class="system-layout-item-child-li"><a href="javascript:;">子菜单1</a></li>
                            <li class="system-layout-item-child-li"><a href="javascript:;">子菜单2</a></li>
                        </ul>
                    </li>
                    <li class="system-layout-item system-exit">
                        <a href="javascript:;"><i class="system-layout-item-nav-i iconfont icon-exit1"></i> 退出</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 导航结束 -->
    </div>
    <!-- header结束 -->
    <!-- 左侧边栏导航开始 -->
    <div class="system-side">
        <!-- 导航菜单开关按钮 -->
        <div class="system-side-menu-switch">
            <i class="iconfont icon-moreclass"></i>
        </div>
        <!-- 导航菜单项开始 -->
        <div class="side-menu-items">
            <!-- 带文字的导航菜单项 -->
            <div class="side-menu-item">
                <div class="side-menu-item-title"><span class="side-menu-square"></span>用户管理</div>
                <ul>
                    <li><a onclick="createTab({title:'UC浏览器',isShowClose:true,url:'http://www.hao123.com'})"
                           href="javascript:;"><i class="side-menu-a-i iconfont icon-cc-head"></i>用户1</a></li>
                    <li><a onclick="createTab({title:'U浏览器',isShowClose:true,url:'http://www.hao123.com'})"
                           href="javascript:;"><i class="side-menu-a-i iconfont icon-cc-head"></i>用户1</a></li>
                    <li><a onclick="createTab({title:'C浏览器',isShowClose:true,url:'http://www.hao123.com'})"
                           href="javascript:;"><i class="side-menu-a-i iconfont icon-cc-head"></i>用户1</a></li>
                </ul>
            </div>
            <div class="side-menu-item">
                <div class="side-menu-item-title"><span class="side-menu-square"></span>角色管理</div>
                <ul>
                    <li><a onclick="createTab({title:'军事头条_东方军事网',isShowClose:true,url:'http://mil.eastday.com/'})"
                           href="javascript:;"><i class="side-menu-a-i iconfont icon-cc-head"></i>角色1</a></li>
                </ul>
            </div>
            <div class="side-menu-item">
                <div class="side-menu-item-title"><span class="side-menu-square"></span>数据统计</div>
                <ul>
                    <li><a href="javascript:;"><i class="side-menu-a-i iconfont icon-cc-head"></i>数据1</a></li>
                </ul>
            </div>
            <div class="side-menu-item">
                <div class="side-menu-item-title"><span class="side-menu-square"></span>客户中心</div>
                <ul>
                    <li><a href="javascript:;"><i class="side-menu-a-i iconfont icon-cc-head"></i>客户1</a></li>
                </ul>
            </div>
            <div class="side-menu-item">
                <div class="side-menu-item-title"><span class="side-menu-square"></span>资料室</div>
                <ul>
                    <li><a href="javascript:;"><i class="side-menu-a-i iconfont icon-cc-head"></i>资料1</a></li>
                </ul>
            </div>
        </div>
        <!-- 带文字的导航菜单项结束 -->
        <!-- 关闭后小图标菜单项开始 -->
        <div class="side-menu-small-items">
            <!-- 小图标菜单项 -->
            <div class="side-menu-small-item">
                <div data-toast="用户管理" class="side-menu-small-item-icon"><span class="side-menu-small-square"></span>
                </div>
                <ul>
                    <li data-toast="用户1"><a href="javascript:;"><i
                            class="side-menu-small-a-i iconfont icon-cc-head"></i></a></li>
                </ul>
            </div>
            <div class="side-menu-small-item">
                <div data-toast="角色管理" class="side-menu-small-item-icon"><span class="side-menu-small-square"></span>
                </div>
                <ul>
                    <li data-toast="角色1"><a href="javascript:;"><i
                            class="side-menu-small-a-i iconfont icon-cc-head"></i></a></li>
                </ul>
            </div>
            <div class="side-menu-small-item">
                <div data-toast="数据统计" class="side-menu-small-item-icon"><span class="side-menu-small-square"></span>
                </div>
                <ul>
                    <li data-toast="数据1"><a href="javascript:;"><i
                            class="side-menu-small-a-i iconfont icon-cc-head"></i></a></li>
                </ul>
            </div>
            <div class="side-menu-small-item">
                <div data-toast="客户中心" class="side-menu-small-item-icon"><span class="side-menu-small-square"></span>
                </div>
                <ul>
                    <li data-toast="客户1"><a href="javascript:;"><i
                            class="side-menu-small-a-i iconfont icon-cc-head"></i></a></li>
                </ul>
            </div>
            <div class="side-menu-small-item">
                <div data-toast="资料室" class="side-menu-small-item-icon"><span class="side-menu-small-square"></span>
                </div>
                <ul>
                    <li data-toast="资料室1"><a href="javascript:;"><i
                            class="side-menu-small-a-i iconfont icon-cc-head"></i></a></li>
                </ul>
            </div>
        </div>
        <!-- 小图标导航菜单项结束 -->
    </div>
    <!-- 侧边栏导航结束 -->
    <!-- 主面板开始 -->
    <div class="system-content">
        <!-- tab选项卡开始 -->
        <div class="system-tab">
            <!-- tab选项卡导航开始 -->
            <div class="system-tab-nav">
                <ul>
                    <!-- 导航项 -->
                    <li class="system-tab-nav-item system-tab-nav-item-selected" data-name="首页">首页</li>
                </ul>
            </div>
            <!-- 导航项具体内容 -->
            <div class="system-content-iframe">
                <div class="system-content-show">
                    <%--<iframe src="#"></iframe>--%>
                </div>
            </div>
        </div>
    </div>
    <!-- footer开始 -->
    <div class="system-footer">
        <span>版权所有©合肥海思数据分析有限公司</span>
    </div>
    <!-- footer结束 -->
</div>
</body>
<div class="system-tab-menu">
    <ul>
        <li>刷新</li>
        <li>关闭</li>
        <li>关闭右侧</li>
        <li>关闭左侧</li>
        <li>关闭所有</li>
    </ul>
</div>
<div class="system-tab-skin">
    <ul>
        <li data-skin="red"><i class="iconfont icon-check2"></i></li>
        <li data-skin="green"></li>
        <li data-skin="blue"></li>
        <li data-skin="white"></li>
        <li data-skin="yellow"></li>
    </ul>
</div>
</html>