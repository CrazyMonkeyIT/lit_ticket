<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta charset="UTF-8"></meta>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
    <meta http-equiv="pragma" content="no-cache"></meta>
    <meta http-equiv="cache-control" content="no-cache"></meta>
    <meta http-equiv="expires" content="0"></meta>
    <title>中小企业商票信用风险测评预警系统</title>
    <link href="${request.contextPath}/static/login/css/default.css" rel="stylesheet" type="text/css" />
    <!--必要样式-->
    <link href="${request.contextPath}/static/login/css/styles.css" rel="stylesheet" type="text/css" />
    <link href="${request.contextPath}/static/login/css/demo.css" rel="stylesheet" type="text/css" />
    <!-- 加载中效果 -->
    <link href="${request.contextPath}/static/login/css/loaders.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 粒子特效canvas -->
<canvas></canvas>
<div class='login'>
    <div class='login_title' style="text-align:center;">
        <span>商票信用风险测评预警系统</span>
    </div>
    <div class='login_fields'>
        <div class='login_fields__user'>
            <div class='icon'>
                <img alt="" src='${request.contextPath}/static/login/img/user_icon_copy.png'></img>
            </div>
            <input name="login" placeholder='用户名' maxlength="16" type='text' autocomplete="off" value=""/>
            <div class='validation'>
                <img alt="" src='${request.contextPath}/static/login/img/tick.png'></img>
            </div>
        </div>
        <div class='login_fields__password'>
            <div class='icon'>
                <img alt="" src='${request.contextPath}/static/login/img/lock_icon_copy.png'></img>
            </div>
            <input name="pwd" placeholder='密码' maxlength="16" type='text' autocomplete="off" />
            <div class='validation'>
                <img alt="" src='${request.contextPath}/static/login/img/tick.png'></img>
            </div>
        </div>
        <div class='login_fields__password' style="display:none;">
            <div class='icon'>
                <img alt="" src='${request.contextPath}/static/login/img/key.png'></img>
            </div>
            <input name="code" placeholder='验证码' maxlength="4" type='text' autocomplete="off" />
            <div class='validation' style="opacity: 1; right: -5px;top: -3px;">
                <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
            </div>
        </div>
        <div class='login_fields__submit' style="text-align:center;">
            <input type='button' value='登录' />
        </div>
        <div style="clear: both;"></div>
        <div class="login_ext" style="text-align:center;">
            <span><a href="#">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">忘记密码?</a></span>
        </div>
    </div>
    <div class='success'>
    </div>
    <div class='disclaimer' >
        <p>欢迎登录中小企业商票信用风险测评预警系统</p>
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
<!-- layui提示插件 -->
<link href="${request.contextPath}/static/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script src="${request.contextPath}/static/layui/layui.js" type="text/javascript"></script>

<script src='${request.contextPath}/static/assets/js/jquery-2.1.4.min.js'></script>
<script src="${request.contextPath}/static/login/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="${request.contextPath}/static/login/js/stopExecutionOnTimeout.js?t=1" type="text/javascript"></script>
<script src="${request.contextPath}/static/login/js/Treatment.js" type="text/javascript"></script>

<!-- 粒子特效JS -->
<script src="${request.contextPath}/static/login/js/ban.js" type="text/javascript"></script>
<!-- DES3 -->
<script src="${request.contextPath}/static/login/js/des3.js" type="text/javascript"></script>
<!-- Login -->
<script type="text/javascript">
    var basePath = '${request.contextPath}';
    var DES_SECRET_KEY = "${DES_SECRET_KEY!''}";
</script>
<script src="${request.contextPath}/static/login/js/login.js" type="text/javascript"></script>
</body>
</html>