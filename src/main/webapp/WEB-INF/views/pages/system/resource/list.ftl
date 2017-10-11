<@ui.layout >
<link rel="stylesheet" href="${request.contextPath}/static/ztree/zTreeStyle.css" type="text/css">

<div class="row">
	<div class="col-xs-3">
		<div class="panel panel-default">
			<div class="panel-heading">系统资源列表</div>
			<div class="panel-body">
				<div class="zTreeDemoBackground left">
		            <ul id="resourceTree" class="ztree"></ul>
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
							<a href="#" class="blue">
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
		
							<span class="vbar"></span>
		
							<a href="#" class="green">
								<i class="icon-flag bigger-130"></i>
							</a>
						</div>
					</div>
					<div class="col-xs-12">&nbsp;
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12" style="margin-bottom:10px;">
						<div class="input-group">
						  <span class="input-group-addon">登录名</span>
						  <input name="loginName" value="" class="col-xs-10 col-sm-5 input-sm width-100" type="text">
						</div>
					</div>
					
					<div class="col-xs-12" style="margin-bottom:10px;">
						<div class="input-group">
						  <span class="input-group-addon">登录名</span>
						  <input name="loginName" value="" class="col-xs-10 col-sm-5 input-sm width-100" type="text">
						</div>
					</div>
					
					<div class="col-xs-12" style="margin-bottom:10px;">
						<div class="input-group">
						  <span class="input-group-addon">登录名</span>
						  <input name="loginName" value="" class="col-xs-10 col-sm-5 input-sm width-100" type="text">
						</div>
					</div>
				</div>
			</div>
			<div class="panel-footer" style="min-height:35px;">
				<div class="pull-right action-buttons">
					<a href="#" class="blue">
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
            onClick: onClick,
            beforeDrag: beforeDrag,
            beforeEditName: beforeEditName,
            beforeRemove: beforeRemove,
            beforeRename: beforeRename,
            onRemove: onRemove,
            onRename: onRename,
            beforeExpand: beforeExpand,
            onExpand: onExpand
        }
    };
    
    var upNodes;
     var downNodes;
     function addHoverDom(treeId, treeNode) {
         if ($("#diyBtn_"+treeNode.id).length>0) return;
              var aObj = $("#" + treeNode.tId + "_a");
            var editStr = "<span id='diyBtn_space_" +treeNode.id+ "' >&nbsp;</span><span class='button icon1' id='diyBtn_" +treeNode.id+ "' title='"+treeNode.name+"' onfocus='this.blur();'></span><span class='button icon2' id='diyBtn1_" +treeNode.id+ "' title='"+treeNode.name+"' onfocus='this.blur();'></span>";
                aObj.after(editStr);
                var btn = $("#diyBtn_"+treeNode.id);
                var btn1 = $("#diyBtn1_"+treeNode.id);
                
                var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                //向上互换位置
                if (btn) btn.bind("click", function(){
                var isFirstNode;
                 var upNodes = treeObj.getSelectedNodes();
                 if (upNodes.length > 0) {
                          isFirstNode = upNodes[0].isFirstNode;
                        }
                if(isFirstNode==true){
                     alert("节点已是第一位");
                     return;
                 }else{
                    var   node = upNodes[0].getPreNode();
                    if(node.pId==null &&treeNode.pId==null){
                         treeNode.pId=0;
                         node.pId=0;
                    }
                    $.ajax({
                            url : '${request.contextPath}/system/resource/changeResource.html',
                            type : 'post',
                            data : {
                                'upName'    : node.name,
                                'uppId' : node.pId,
                                'upOrder' : node.order,
                                'upId' : node.id,
                                
                                'resourceId':treeNode.id,
                                'name':treeNode.name,
                                'parentId':treeNode.pId,
                                'resourceOrder':treeNode.order
                            },
                            success : function(result) {
                                if(result=="true"){
                                    location.reload();
                                }else{
                                    alert("按钮不能互换");
                                }
                            }
                        });
                 }      
                });
                
                //向下互换位置
                if (btn1) btn1.bind("click", function(){ 
                  var isLastNode;
                  var downNodes = treeObj.getSelectedNodes();
                    if (downNodes.length > 0) {
                         isLastNode = downNodes[0].isLastNode;
                    }
                    if(isLastNode==true){
                      alert("节点已是最后一位");
                       return;
                    }else{
                     var node = downNodes[0].getNextNode();
                      if(node.pId==null &&treeNode.pId==null){
                         treeNode.pId=0;
                         node.pId=0;
                      }
                      $.ajax({
                            url : '${request.contextPath}/system/resource/changeResource.html',
                            type : 'post',
                            data : {
                                'upName'    : node.name,
                                'uppId' : node.pId,
                                'upOrder' : node.order,
                                'upId' : node.id,
                                
                                'resourceId':treeNode.id,
                                'name':treeNode.name,
                                'parentId':treeNode.pId,
                                'resourceOrder':treeNode.order
                            },
                            success : function(result) {
                                if(result=="true"){
                                    location.reload();
                                }else{
                                    alert("按钮不能互换");
                                }
                            }
                        });
                      
                    }
                });
     }
     
        function onClick(e,treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("resourceTree");
            zTree.expandNode(treeNode, null, null, null, true);
        }
        function beforeDrag(treeId, treeNodes) {
            return false;
        }
        function beforeEditName(treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("resourceTree");
            zTree.selectNode(treeNode);
            getEditInfo(treeNode.id);
            $('#editModal').modal('show');
            return false;
        }
        function beforeRemove(treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("resourceTree");
            zTree.selectNode(treeNode);
            
            if(treeNode.isParent){
                if(confirm("确认删除 资源 [ " + treeNode.name + " ] 及其所有【子资源】 吗？")){
                    alert("请删除资源[" + treeNode.name +"]下的所有【子资源】");
                    return false;
                }else{
                    return false;
                }
            }else{
                if(confirm("确认删除 资源 [ " + treeNode.name + " ] 吗？")){
                    deleteResource(treeNode.id)
                }else{
                    return false;
                }
            }
        }
        function onRemove(e, treeId, treeNode) {
            window.location.href = '${request.contextPath}/system/resource/resourceManage.html';
        }
        function beforeRename(treeId, treeNode, newName, isCancel) {
            if (newName.length == 0) {
                alert("节点名称不能为空.");
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                setTimeout(function(){zTree.editName(treeNode)}, 10);
                return false;
            }
            return true;
        }
        function onRename(e, treeId, treeNode, isCancel) {
        }
        function showRemoveBtn(treeId, treeNode) {
            return !treeNode.isFirstNode;
        }
        function showRenameBtn(treeId, treeNode) {
            return !treeNode.isLastNode;
        }

	function getTime() {
        var now= new Date(),
        h=now.getHours(),
        m=now.getMinutes(),
        s=now.getSeconds(),
        ms=now.getMilliseconds();
        return (h+":"+m+":"+s+ " " +ms);
    }

    var newCount = 1;
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
        $("#diyBtn_"+treeNode.id).unbind().remove();
        $("#diyBtn1_"+treeNode.id).unbind().remove();
        $("#diyBtn_space_" +treeNode.id).unbind().remove();
    };
    var curExpandNode = null;
    function beforeExpand(treeId, treeNode) {
        var pNode = curExpandNode ? curExpandNode.getParentNode():null;
        var treeNodeP = treeNode.parentTId ? treeNode.getParentNode():null;
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        for(var i=0, l=!treeNodeP ? 0:treeNodeP.children.length; i<l; i++ ) {
            if (treeNode !== treeNodeP.children[i]) {
                zTree.expandNode(treeNodeP.children[i], false);
            }
        }
        while (pNode) {
            if (pNode === treeNode) {
                break;
            }
            pNode = pNode.getParentNode();
        }
        if (!pNode) {
            //singlePath(treeNode);
        }
    }

    function onExpand(event, treeId, treeNode) {
        curExpandNode = treeNode;
    }
	$(document).ready(function(){
	    $.fn.zTree.init($("#resourceTree"), setting, ${data});
	});
</script>
<!-- zTree -->
<script src="${request.contextPath}/static/ztree/jquery.ztree.all-3.5.js"></script>
</@ui.layout>