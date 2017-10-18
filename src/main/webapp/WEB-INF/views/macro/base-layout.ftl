<#macro layout title="" bread_two="" bread_two_url="" bread_three="" curr="">
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>上海专精特新</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${request.contextPath}/static/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${request.contextPath}/static/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- page specific plugin styles -->
    <!-- text fonts -->
    <link rel="stylesheet" href="${request.contextPath}/static/assets/css/fonts.googleapis.com.css" />
    <!-- ace styles -->
    <link rel="stylesheet" href="${request.contextPath}/static/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
    <!--[if lte IE 9]>
	<link rel="stylesheet" href="${request.contextPath}/static/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
    <![endif]-->
    <link rel="stylesheet" href="${request.contextPath}/static/assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="${request.contextPath}/static/assets/css/ace-rtl.min.css" />
    <!--[if lte IE 9]>
	<link rel="stylesheet" href="${request.contextPath}/static/assets/css/ace-ie.min.css" />
    <![endif]-->
    <!-- ace settings handler -->
    <script src="${request.contextPath}/static/assets/js/ace-extra.min.js"></script>
    <!--[if lte IE 8]>
	<script src="${request.contextPath}/static/assets/js/html5shiv.min.js"></script>
	<script src="${request.contextPath}/static/assets/js/respond.min.js"></script>
    <![endif]-->

    <script src="${request.contextPath}/static/assets/js/jquery-2.1.4.min.js"></script>

    <!-- layui提示插件 -->
    <link href="${request.contextPath}/static/layui/css/layui.css" rel="stylesheet" type="text/css" />
    <script src="${request.contextPath}/static/layui/layui.js" type="text/javascript"></script>
	<!-- 自定义confirm -->
    <script src="${request.contextPath}/static/assets/Ewin.js" type="text/javascript"></script>
</head>
	
<body class="no-skin">
	<div class="navbar navbar-default" id="navbar" style="background: #2C6AA0;">
		<script type="text/javascript">
			try{ace.settings.check('navbar' , 'fixed')}catch(e){}
		</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand">
					<small>
						<i class="fa fa-leaf"></i>
						上海专精特新
					</small>
				</a><!-- /.brand -->
			</div><!-- /.navbar-header -->

			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="light-blue">
						<a data-toggle="dropdown" href="#" class="dropdown-toggle">
                            <img class="nav-user-photo" src="${request.contextPath}/static/assets/images/avatars/user.jpg" alt="Jason's Photo">
							<span class="user-info">
								<small>欢迎光临,</small>
								<@shiro.principal/>
							</span>
                            <i class="ace-icon fa fa-caret-down"></i>
						</a>
                        <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close" style="">
                            <li>
                                <a href="#">
                                    <i class="ace-icon fa fa-cog"></i>
                                    设置
                                </a>
                            </li>

                            <li>
                                <a href="profile.html">
                                    <i class="ace-icon fa fa-user"></i>
                                    个人资料
                                </a>
                            </li>

                            <li class="divider"></li>

                            <li>
                                <a href="javascript:logout()">
                                    <i class="ace-icon fa fa-power-off"></i>
                                    退出
                                </a>
                            </li>
                        </ul>

					</li>
				</ul><!-- /.ace-nav -->
			</div><!-- /.navbar-header -->
		</div><!-- /.container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>
			<div class="sidebar" id="sidebar">
				<ul class="nav nav-list">
					<#list menuList as menu>
						<#if menu.resourceType == 0 && menu.parentId == 0>
							<li class="open <#if SelectOneLevelId?? && SelectOneLevelId == menu.resourceId>active</#if>">
								<#if menu.hasChild>
									<a href="#" class="dropdown-toggle">
										<i class="${menu.cssCls!'menu-icon fa fa-desktop'}"></i>
										<span class="menu-text">
											${menu.resourceName!''}
										</span>
										<b class="arrow fa fa-angle-down"></b>
									</a>
									<b class="arrow"></b>
									<ul class="submenu">
										<#list menuList as submenu>
											<#if submenu.parentId?exists && submenu.parentId = menu.resourceId>
												<li class="<#if SelectTwoLevelId?? && SelectTwoLevelId == submenu.resourceId>active</#if>">
													<a href="${request.contextPath}${submenu.resourceUrl!'index.html'}" onclick="updateMenuStatus(${menu.resourceId},${submenu.resourceId},'${menu.resourceName}','${submenu.resourceName}')">
														<i class="menu-icon fa fa-caret-right"></i>
														${submenu.resourceName!''}
													</a>
													<b class="arrow"></b>
												</li>
											</#if>
										</#list>
									</ul>
								<#else>
                                    <a href="${request.contextPath}${menu.resourceUrl!'index.html'}" onclick="updateMenuStatus(${menu.resourceId},null,'${menu.resourceName}',null)">
                                        <i class="${menu.cssCls!'menu-icon fa fa-desktop'}"></i>
                                        <span class="menu-text"> ${menu.resourceName!''} </span>
                                    </a>
								</#if>
							</li>
						</#if>
					</#list>
				</ul><!-- /.nav-list -->
			</div>
			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
					</script>

					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="${request.contextPath}/index.html" onclick="updateMenuStatus()">首页</a>
						</li>
						<#if SelectOneLevelName??>
                            <li class="active">${SelectOneLevelName}</li>
						</#if>
						<#if SelectTwoLevelName?? && SelectTwoLevelName != ''>
                            <li class="active">${SelectTwoLevelName}</li>
						</#if>
					</ul><!-- .breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<#nested>
							<!-- PAGE CONTENT ENDS -->
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.page-content -->
			</div><!-- /.main-content -->
	</div><!-- /.main-container -->
	<script src="${request.contextPath}/static/assets/js/bootstrap.min.js"></script>
	<!-- ace scripts -->
	<script src="${request.contextPath}/static/assets/js/ace-elements.min.js"></script>
	<script src="${request.contextPath}/static/assets/js/ace.min.js"></script>
	<script>
	var basePath  = '${request.getContextPath()}';
	/**
	 * 登出
	 */
	function logout(){
		window.location.href='${request.contextPath}/logout.html';
	}

    /**
	 * 更新后端session中的菜单选中状态
     */
    function updateMenuStatus(oneId,twoId,oneName,twoName){
        $.ajax({
            url : '${request.getContextPath()}/updateMenuStatus.html',
            type : 'post',
            data : {
                "oneId":oneId,
				"twoId":twoId,
				"oneName":oneName,
				"twoName":twoName
            },
            success : function(result) {

            }
        });
	}

    /**
	 * 系统提示
     * @param txt
     */
    window.alert = function(txt)
    {
        layui.use('layer', function(){
            layer.msg(txt);
        });
    }
    /**
     * 加载中
     */
    function loading_begin(){
        layui.use('layer', function(){
			var index = layer.load(1, {
				shade: [0.3,'#fff'] //0.1透明度的白色背景
			});
        });
    }
    /**
     * 隐藏加载中
     */
    function loading_end(){
        layui.use('layer', function(){
            layer.closeAll('loading');
        });
    }

    function fmtDate(obj){
        var date =  new Date(obj);
        var y = 1900+date.getYear();
        var m = "0"+(date.getMonth()+1);
        var d = "0"+date.getDate();
        return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
    }
	</script>

</body>
</html>
</#macro>