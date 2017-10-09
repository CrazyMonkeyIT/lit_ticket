<#macro layout title="" bread_two="" bread_two_url="" bread_three="" curr="">
	<!DOCTYPE html>
	<html lang="en">
		<head>
			<meta charset="utf-8" />
			<title>控制台 - Bootstrap后台管理系统模版Ace下载</title>
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<!-- basic styles -->
			<link href="${rc.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet" />
			<link rel="stylesheet" href="${rc.contextPath}/static/assets/css/font-awesome.min.css" />
	
			<!--[if IE 7]>
			  <link rel="stylesheet" href="${rc.contextPath}/static/assets/css/font-awesome-ie7.min.css" />
			<![endif]-->
	
			<!-- page specific plugin styles -->
	
	
			<!-- ace styles -->
	
			<link rel="stylesheet" href="${rc.contextPath}/static/assets/css/ace.min.css" />
			<link rel="stylesheet" href="${rc.contextPath}/static/assets/css/ace-rtl.min.css" />
			<link rel="stylesheet" href="${rc.contextPath}/static/assets/css/ace-skins.min.css" />
	
			<!--[if lte IE 8]>
			  <link rel="stylesheet" href="${rc.contextPath}/static/assets/css/ace-ie.min.css" />
			<![endif]-->
	
			<!-- inline styles related to this page -->
	
			<!-- ace settings handler -->
	
			<script src="${rc.contextPath}/static/assets/js/ace-extra.min.js"></script>
			<script src="${rc.contextPath}/static/assets/js/jquery-1.10.2.min.js"></script>
			<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	
			<!--[if lt IE 9]>
			<script src="${rc.contextPath}/static/assets/js/html5shiv.js"></script>
			<script src="${rc.contextPath}/static/assets/js/respond.min.js"></script>
			<![endif]-->
		</head>
	
		<body>
			<div class="navbar navbar-default" id="navbar">
				<script type="text/javascript">
					try{ace.settings.check('navbar' , 'fixed')}catch(e){}
				</script>
	
				<div class="navbar-container" id="navbar-container">
					<div class="navbar-header pull-left">
						<a href="#" class="navbar-brand">
							<small>
								<i class="icon-leaf"></i>
								ACE后台管理系统
							</small>
						</a><!-- /.brand -->
					</div><!-- /.navbar-header -->
	
					<div class="navbar-header pull-right" role="navigation">
						<ul class="nav ace-nav">
							<li class="light-blue">
								<a data-toggle="dropdown" href="#" class="dropdown-toggle">
									
									<span class="user-info">
										<small>欢迎光临,</small>
										<@shiro.principal />
									</span>
								</a>
	
								
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
						<script type="text/javascript">
							try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
						</script>
	
						<div class="sidebar-shortcuts" id="sidebar-shortcuts">
							<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
								<button class="btn btn-success">
									<i class="icon-signal"></i>
								</button>
	
								<button class="btn btn-info">
									<i class="icon-pencil"></i>
								</button>
	
								<button class="btn btn-warning">
									<i class="icon-group"></i>
								</button>
	
								<button class="btn btn-danger">
									<i class="icon-cogs"></i>
								</button>
							</div>
	
							<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
								<span class="btn btn-success"></span>
	
								<span class="btn btn-info"></span>
	
								<span class="btn btn-warning"></span>
	
								<span class="btn btn-danger"></span>
							</div>
						</div><!-- #sidebar-shortcuts -->
	
						<ul class="nav nav-list">
							
								<#list menuList as menu>
									<#if menu.resourceType == 0 && !menu.parentId?exists>
										<li class="<#if curr!='' && curr == menu.resourceId> active <#elseif curr=='' && menu_index == 0 > active </#if>">
											
												
												<#if menu.hasChild>
													<a href="#" class="dropdown-toggle">
														<i class="icon-desktop"></i>
														<span class="menu-text"> ${menu.resourceName!''} </span>
														<b class="arrow icon-angle-down"></b>
													</a>
													<ul class="submenu">
														<#list menuList as submenu>
															<#if submenu.parentId?exists && submenu.parentId = menu.resourceId>
																<li class="<#if curr!='' && curr == submenu.resourceId> active </#if>">
																	<a href="${rc.contextPath}${submenu.resourceUrl!'index.html'}">
																		<i class="${submenu.cssCls!'icon-double-angle-right'}"></i>
																		${submenu.resourceName!''}
																	</a>
																</li>
															</#if>
														</#list>
													</ul>
												<#else>
													<a href="${rc.contextPath}${menu.resourceUrl!'index.html'}">
														<i class="${menu.cssCls!'icon-dashboard'}"></i>
														<span class="menu-text"> ${menu.resourceName!''} </span>
													</a>
												</#if>
										</li>
									</#if>
								</#list>
						</ul><!-- /.nav-list -->
	
						<div class="sidebar-collapse" id="sidebar-collapse">
							<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
						</div>
	
						<script type="text/javascript">
							try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
						</script>
					</div>
	
					<div class="main-content">
						<div class="breadcrumbs" id="breadcrumbs">
							<script type="text/javascript">
								try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
							</script>
	
							<ul class="breadcrumb">
								<li>
									<i class="icon-home home-icon"></i>
									<a href="#">首页</a>
								</li>
								<li class="active">控制台</li>
							</ul><!-- .breadcrumb -->
	
							<div class="nav-search" id="nav-search">
								<form class="form-search">
									<span class="input-icon">
										<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
										<i class="icon-search nav-search-icon"></i>
									</span>
								</form>
							</div><!-- #nav-search -->
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
	
			<!-- basic scripts -->
	
			<script src="${rc.contextPath}/static/assets/js/bootstrap.min.js"></script>
			<script src="${rc.contextPath}/static/assets/js/typeahead-bs2.min.js"></script>
	
			<!-- page specific plugin scripts -->
	
			<!--[if lte IE 8]>
			  <script src="${rc.contextPath}/static/assets/js/excanvas.min.js"></script>
			<![endif]-->
			<!-- ace scripts -->
	
			<script src="${rc.contextPath}/static/assets/js/ace-elements.min.js"></script>
			<script src="${rc.contextPath}/static/assets/js/ace.min.js"></script>
	
			<!-- inline scripts related to this page -->
	
	
	</body>
	</html>

</#macro>
