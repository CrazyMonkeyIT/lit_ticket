<@ui.layout >
<link rel="stylesheet" href="${request.contextPath}/static/ztree/zTreeStyle.css" type="text/css">

<div class="row">
	<div class="col-xs-3">
		<div class="panel panel-default">
			<div class="panel-heading">系统资源列表</div>
			<div class="panel-body">
				<div class="zTreeDemoBackground left">
		            <ul id="industryTree" class="ztree"></ul>
		        </div>
			</div>
		</div>
	</div>
	<div class="col-xs-9">
		<div class="panel panel-default">
			<div class="panel-heading">系统资源管理</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12">
						<div class="pull-right action-buttons">
							<a href="#" class="blue" onclick="addIndustry()">
								<i class="icon-pencil bigger-130">新增</i>
							</a>
		
							<span class="vbar"></span>
						
							<a href="#" class="blue">
								<i class="icon-edit bigger-130">修改</i>
							</a>
		
							<span class="vbar"></span>
		
							<a href="#" class="red">
								<i class="icon-trash bigger-130">删除</i>
							</a>
		
						</div>
					</div>
				</div>
				<div class="row">
					<form action="${request.contextPath}/sys/industry/saveSasac.html" id="sasac_form" method="post">
						<input name="parentId" id="sasac_parentId" type="hidden"/>
						<input name="orderNo" id="sasac_orderNo" type="hidden"/>
						<div class="col-xs-12" style="margin-bottom:10px;">
							<div class="input-group">
							  <span class="input-group-addon">行业名称</span>
							  <input name="industryName" class="col-xs-10 col-sm-5 input-sm width-100" type="text">
							</div>
						</div>
						
						<div class="col-xs-12" style="margin-bottom:10px;">
							<div class="input-group">
							  <span class="input-group-addon">行业代码</span>
							  <input name="industryCode" class="col-xs-10 col-sm-5 input-sm width-100" type="text">
							</div>
						</div>
						
						<div class="col-xs-12" style="margin-bottom:10px;">
							<div class="input-group">
							  <span class="input-group-addon">计算系数</span>
							  <input name="computingCoefficient" class="col-xs-10 col-sm-5 input-sm width-100" type="text">
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="panel-footer" style="min-height:35px;">
				<div class="pull-right action-buttons">
					<a href="#" class="blue" onclick="saveIndustry()">
						<i class="icon-ok bigger-130">保存</i>
					</a>

					<span class="vbar"></span>

					<a href="#" class="red">
						<i class="icon-refresh bigger-130">重置</i>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var setting = {
    view: {
        dblClickExpand: false,
        showLine: false,
        selectedMulti: false
    },
    edit: {
        enable: false,
        editNameSelectAll: true,
    },
    data: {
        simpleData: {
            enable: true
        }
    },
    callback: {
        onClick: onClick
    }
};

function saveIndustry(){
	$('#sasac_form').submit();
}

function addIndustry(){
	var zTree = $.fn.zTree.getZTreeObj("industryTree");
	var selectNodes = zTree.getSelectedNodes();
	$('#sasac_form')[0].reset();
	if(selectNodes.length > 0){
		var node = selectNodes[0];
		$('#sasac_parentId').val(node.id);
		$('#sasac_orderNo').val(node.order + 1);
	}else{
		alert("请在左侧选择一条记录");
	}
}



function onClick(e,treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj("industryTree");
    zTree.expandNode(treeNode, null, null, null, true);
}
$(document).ready(function(){
    $.fn.zTree.init($("#industryTree"), setting, ${data});
});
</script>
<!-- zTree -->
<script src="${request.contextPath}/static/ztree/jquery.ztree.all-3.5.js"></script>
</@ui.layout>