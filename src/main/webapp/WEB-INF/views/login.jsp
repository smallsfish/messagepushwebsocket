<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="description" content="个人开发测试版的Web即时通讯网站..."/>
    <meta name="keywords" content="Web即时通讯,WIM,网页版聊天"/>
    <title>Web即时通讯/WIM</title>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    <%@ include file="base.jsp" %>
    <script type="text/javascript" src="/static/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<img id="bobybg" src="/static/img/wimbg.jpg">
<div id="contentbody">
    <form id="doSystemLogin" action="javascript:void(0)">
        <table cellspacing="30">
            <tr>
                <td>WIM</td>
            </tr>
            <tr>
                <td>
                    <input id="phone" type='number' title="手机号/WIM号" name="account" required="required" minlength="8"
                           maxlength="11" placeholder="手机号/WIM号"/>
                    <input title="请输入密码" type="password" name="password" placeholder="请输入密码" required="required">
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="登录"></td>
            </tr>
        </table>
        <img style="top:133px;left:90px;" src="/static/img/user.png">
        <img style="top:184px;left:90px;" src="/static/img/pw.png">
        <a style="top:244px; left:80PX; color:rgba(255,0,0,0.8);" href="javascript:alert('正在施工中...')">忘记密码?</a>
        <a style="top:244px; right:80px;" href="javascript:void(0)">立即注册</a>
    </form>
</div>
</body>
<script type="text/javascript">
    layui.use(['layer'], function () {
        $("#doSystemLogin").submit(function () {
            var account = $(":input[name='account']").val();
            var password = $(":input[name='password']").val();
            if (account === "") {
                layer.msg("请输入账号");
                $(":input[name='account']").css({'border': '2px red solid'});
                $(":input[name='account']").focus();
                return;
            }
            if (password === "") {
                layer.msg("请输入密码");
                $(":input[name='password']").css({'border': '2px red solid'});
                $(":input[name='password']").focus();
                return;
            }
            var loadIndex = layer.load(0);
            $.ajax({
                type: "POST",
                dataType: "json",
                url: 'system/login',
                data: $('#doSystemLogin').serialize(),
                success: function (result) {
                    layer.close(loadIndex);
                    if (result.status == 0) {
                        layer.msg(result.msg);
                        setTimeout(function () {
                            window.location.href = "system/index";
                        }, 500);
                    } else {
                        layer.msg(result.msg, {icon: 2, time: 3000});
                    }
                },
                error: function (data) {
                    layer.close(loadIndex);
                    layer.alert("登录失败");
                }
            });

        });
    });


    var windowHeight;
    var windowWidth;
    setContent();

    function setContent() {
        windowHeight = $(window).height();
        windowWidth = $(window).width();
        $("#contentbody").css({"top": (windowHeight - 350) / 2, "left": (windowWidth - 500) / 2});
    }

    loadimgforimg("#bobybg");
    //加载背景图的函数，该函数使图片适配所有屏幕的尺寸大小，尽可能的让图片显示正常
    //domid是该img标签的id属性
    function loadimgforimg(domid) {
        var imgheight = $(domid).height();
        var imgwidth = $(domid).width();
        var prams = imgconvert(domid, imgheight, imgwidth);
        $(domid).css(prams);
    }

    function imgconvert(domorid, imgheight, imgwidth) {
        var imgbl = imgheight / imgwidth;//图片高于宽的比例
        var windowHeight = $(window).height();
        var windowWidth = $(window).width();
        var width = 0, height = 0, top = 0, left = 0;
        //如果图片的高度和宽度都大于屏幕的宽高
        if (imgheight > windowHeight && imgwidth > windowWidth) {
            if (imgwidth < imgheight) {
                //图片宽小于高
                width = windowWidth;
                height = width * imgbl;
            } else {
                //图片宽大于高
                height = windowHeight;
                width = height * (1 / imgbl);
            }
        } else if (imgheight > windowHeight && imgwidth < windowWidth) {
            //如果图片的高大于屏幕的高但是图片的宽小于屏幕的宽
            width = windowWidth;
            height = width * imgbl;

        } else if (imgheight < windowHeight && imgwidth > windowWidth) {
            //如果图片的高小于屏幕的高但是图片的宽大于屏幕的宽
            height = windowHeight;
            width = height * (1 / imgbl);

        } else {
            //如果图片的宽高都小于屏幕的宽高
            if (imgwidth < imgheight) {
                //图片宽小于高
                width = windowWidth;
                height = width * imgbl;
            } else {
                //图片宽大于高
                height = windowHeight;
                width = height * (1 / imgbl);
            }
        }
        //如果按比例缩放后还出现图片的高度或宽度小于屏幕的宽高，就再次进行等比例缩放
        if (width < windowWidth) {
            width = windowWidth;
            height = width * imgbl;
        }
        if (height < windowHeight) {
            height = windowHeight;
            width = height * (1 / imgbl);
        }
        //让图片进行居中显示
        if (width > windowWidth) {
            left = -(width - windowWidth) / 2;
        } else if (height > windowHeight) {
            top = -(height - windowHeight) / 2;
        }
        return {"width": width, "height": height, "top": top, "left": left};
    }

    //loadimgforbackgroundImg("body","img/bg.jpg");
    function loadimgforbackgroundImg(domorid, url) {
        var img = new Image();
        img.src = url;
        img.onload = function () {
            var result = imgconvert(domorid, img.height, img.width);
            $(domorid).css({
                "background-image": "url(" + url + ")",
                "background-repeat": "no-repeat",
                "background-size": result.width + "px " + result.height + "px",
                "background-position": result.left + "px " + result.top + "px"
            });
        }
    }

    window.onresize = function () {
        setContent();
        loadimgforimg("#bobybg");
        //loadimgforbackgroundImg("body","img/bg.jpg");
    }

</script>
<script>
    var ws;
    function WebSocketTest() {
        if ("WebSocket" in window) {
            console.log("您的浏览器支持 WebSocket!");
            ws = new WebSocket("ws://localhost:8080/ws/webSocket");
            ws.onopen = function () {
                ws.send("发送数据");
                console.log("发送数据")
            };
            ws.onmessage = function (evt) {
                var received_msg = evt.data;
                console.log("接受数据=-="+received_msg);
            };
            ws.onclose = function () {
                alert("连接已关闭...");
            };
        } else {
            console.log("您的浏览器不支持 WebSocket!");
        }
    }
    WebSocketTest();
</script>
</html>