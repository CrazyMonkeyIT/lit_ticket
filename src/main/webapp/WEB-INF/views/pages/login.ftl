<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>login</title>
<link rel="stylesheet" type="text/css" href="${rc.contextPath}/static/login/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${rc.contextPath}/static/login/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="${rc.contextPath}/static/login/css/component.css" />
<!--[if IE]>
<script src="${rc.contextPath}/static/login/js/html5.js"></script>
<![endif]-->
</head>
<body>
		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>欢迎你</h3>
						<form action="${rc.contextPath}/loginSubmit.html" name="zjtx_login_form" id="zjtx_login_form" method="post">
							<div class="input_outer">
								<span class="u_user"></span>
								<input name="loginname" id="loginname" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input name="password" id="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
							</div>
							<div class="mb2"><a class="act-but submit" href="javascript:;" style="color: #FFFFFF" onclick="$('#zjtx_login_form').submit()">登录</a></div>
							<!-- 错误提示 begin-->
				        	<div style="width:100%;margin-top:25px;text-align:center;display:none;">
					            <div id="error_alter" class="error_alter">
						            <lable id="error_cls_error" />
					            </div>
				            </div>
				            <!-- 错误提示end -->
						</form>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<script src="${rc.contextPath}/static/login/js/TweenLite.min.js"></script>
		<script src="${rc.contextPath}/static/login/js/EasePack.min.js"></script>
		<script src="${rc.contextPath}/static/login/js/rAF.js"></script>
		<script src="${rc.contextPath}/static/login/js/demo-1.js"></script>
		<script src='${rc.contextPath}/static/assets/js/jquery-2.0.3.min.js'></script>
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
		<script type="text/javascript">
			$().ready(function() {
			　　$("#zjtx_login_form").validate({
				　　onsubmit:true,// 是否在提交是验证
				　　onfocusout:false,// 是否在获取焦点时验证
				　　onkeyup :false,// 是否在敲击键盘时验证
					rules: {　　　　//规则
					　　loginname: {　　//要对应相对应的input中的name属性
					　　　　required: true
					　　},
					　　password: {
					　　　　required: true
					　　}
					},
					messages:{　　　　//验证错误信息
					　　loginname: {
					　　　　required: "请输入用户名"
					　　　　},
					　　password: {
					　　　　required: "请输入密码"
					　　}
					},
					submitHandler: function(form) { //通过之后回调
					//进行ajax传值
					$.ajax({
					　　url : "${rc.contextPath}/loginSubmit.html",
					　　type : "post",
					　　dataType : "json",
					　　data: {
					　　　　loginname: $("#loginname").val(),
					　　　　password: $("#password").val() 
					　　},
					　　success : function(msg) {
					　　　　console.debug(msg)
							if(msg.success){
								window.location.href = '${rc.contextPath}/index.html';
							}
					　　}
					});
					},
					invalidHandler: function(form, validator) {
						return false;
					},
					errorContainer: "error_alter",
					errorLabelContainer: $("#error_cls_error"),
					wrapper: "li"
				}); 
			});
		</script>
	</body>
</html>