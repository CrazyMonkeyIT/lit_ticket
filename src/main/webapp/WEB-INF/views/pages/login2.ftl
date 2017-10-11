<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta charset="UTF-8"></meta>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
    <meta http-equiv="pragma" content="no-cache"></meta>
    <meta http-equiv="cache-control" content="no-cache"></meta>
    <meta http-equiv="expires" content="0"></meta>
    <title>登录</title>
    <link href="${rc.contextPath}/static/login2/css/default.css" rel="stylesheet" type="text/css" />
    <!--必要样式-->
    <link href="${rc.contextPath}/static/login2/css/styles.css" rel="stylesheet" type="text/css" />
    <link href="${rc.contextPath}/static/login2/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="${rc.contextPath}/static/login2/css/loaders.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class='login'>
    <div class='login_title' style="text-align:center;">
        <span>管理员登录</span>
    </div>
    <div class='login_fields'>
        <div class='login_fields__user'>
            <div class='icon'>
                <img alt="" src='${rc.contextPath}/static/login2/img/user_icon_copy.png'></img>
            </div>
            <input name="login" placeholder='用户名' maxlength="16" type='text' autocomplete="off" value=""/>
            <div class='validation'>
                <img alt="" src='${rc.contextPath}/static/login2/img/tick.png'></img>
            </div>
        </div>
        <div class='login_fields__password'>
            <div class='icon'>
                <img alt="" src='${rc.contextPath}/static/login2/img/lock_icon_copy.png'></img>
            </div>
            <input name="pwd" placeholder='密码' maxlength="16" type='text' autocomplete="off" />
            <div class='validation'>
                <img alt="" src='${rc.contextPath}/static/login2/img/tick.png'></img>
            </div>
        </div>
        <div class='login_fields__password' style="display:none;">
            <div class='icon'>
                <img alt="" src='${rc.contextPath}/static/login2/img/key.png'></img>
            </div>
            <input name="code" placeholder='验证码' maxlength="4" type='text' autocomplete="off" />
            <div class='validation' style="opacity: 1; right: -5px;top: -3px;">
                <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
            </div>
        </div>
        <div class='login_fields__submit' style="text-align:center;">
            <input type='button' value='登录' />
        </div>
    </div>
    <div class='success'>
    </div>
    <div class='disclaimer'>
        <p>欢迎登录后台管理系统</p>
    </div>
</div>
<div class='authent'>
    <div class="loader" style="height: 44px;wid 44px;margin-left: 28px;">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <p>认证中...</p>
</div>
<div class="OverWindows"></div>
<link href="${rc.contextPath}/static/login2/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script src="${rc.contextPath}/static/login2/jquery/jquery-1.10.2.js"></script>
<script src="${rc.contextPath}/static/login2/layui/layui.js" type="text/javascript"></script>
<script src="${rc.contextPath}/static/login2/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="${rc.contextPath}/static/login2/js/stopExecutionOnTimeout.js?t=1" type="text/javascript"></script>
<script src="${rc.contextPath}/static/login2/js/Particleground.js" type="text/javascript"></script>
<script src="${rc.contextPath}/static/login2/js/Treatment.js" type="text/javascript"></script>
<script src="${rc.contextPath}/static/login2/js/jquery.mockjax.js" type="text/javascript"></script>
<script type="text/javascript">
    var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持

    $(document).keypress(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $('input[type="button"]').click();
        }
    });
    //粒子背景特效
    $('body').particleground({
        dotColor: '#E8DFE8',
        lineColor: '#133b88'
    });
    $('input[name="pwd"]').focus(function () {
        $(this).attr('type', 'password');
    });
    $('input[type="text"]').focus(function () {
        $(this).prev().animate({ 'opacity': '1' }, 200);
    });
    $('input[type="text"],input[type="password"]').blur(function () {
        $(this).prev().animate({ 'opacity': '.5' }, 200);
    });
    $('input[name="login"],input[name="pwd"]').keyup(function () {
        var Len = $(this).val().length;
        //<![CDATA[
        if (!$(this).val() == '' && Len >= 5) {
            $(this).next().animate({
                'opacity': '1',
                'right': '30'
            }, 200);
        } else {
            $(this).next().animate({
                'opacity': '0',
                'right': '20'
            }, 200);
        }
        //]]>
    });
    var open = 0;
    layui.use('layer', function () {
        //非空验证
        $('input[type="button"]').click(function () {
            var login = $('input[name="login"]').val();
            var pwd = $('input[name="pwd"]').val();
            if (login == '') {
                ErroAlert('请输入您的账号');
            } else if (pwd == '') {
                ErroAlert('请输入密码');
            } else {
                //认证中..
                //fullscreen();//全屏显示
                $('.login').addClass('test'); //倾斜特效
                setTimeout(function () {
                    $('.login').addClass('testtwo'); //平移特效
                }, 300);
                setTimeout(function () {
                    $('.authent').show().animate({ right: -320 }, {
                        easing: 'easeOutQuint',
                        duration: 600,
                        queue: false
                    });
                    $('.authent').animate({ opacity: 1 }, {
                        duration: 200,
                        queue: false
                    }).addClass('visible');
                }, 500);


                $.ajax({
                    url : "${rc.contextPath}/loginSubmit.html",
                    type : "post",
                    dataType : "json",
                    data : {
                        'userName' : login,
                        'password' : pwd
                    },
                    success : function(msg) {
                            setTimeout(function () {
                                $('.authent').show().animate({ right: 90 }, {
                                    easing: 'easeOutQuint',
                                    duration: 600,
                                    queue: false
                                });
                                $('.authent').animate({ opacity: 0 }, {
                                    duration: 200,
                                    queue: false
                                }).addClass('visible');
                                $('.login').removeClass('testtwo'); //平移特效
                            }, 2000);
                            setTimeout(function () {
                                $('.authent').hide();
                                $('.login').removeClass('test');
                                if (msg.success) {
                                    //登录成功
                                    //$('.login div').fadeOut(100);
                                    //$('.success').fadeIn(1000);
                                    //$('.success').html("恭喜，登录成功");
                                    //跳转操作
                                    window.location.href = '${rc.contextPath}/index.html';
                                } else {
                                    ErroAlert("账号名或密码有误");
                                }
                            }, 2400);
                    }
                });
            }
        })
    })
</script>
</body>
</html>