<@ui.layout >
<!-- zTree -->
<link rel="stylesheet" href="${request.contextPath}/static/ztree/zTreeStyle.css" type="text/css">
<script src="${request.contextPath}/static/ztree/jquery.ztree.all-3.5.js"></script>
<div class="row">
    <div class="col-xs-4" ></div>
	<div class="col-xs-4" >
        <div class="widget-box" >
            <div class="widget-header widget-header-flat">
                <h4 class="widget-title">系统资源列表</h4>
                <div class="widget-toolbar">
                    <a href="javascript:showAddModal()" id="addBtn" class="btn btn-white btn-info">
                        &nbsp;<i class="glyphicon glyphicon-plus"></i>&nbsp;新增资源&nbsp;
                    </a>
                </div>
            </div>
            <div class="widget-body">
                <div class="widget-main">
                    <div style="margin-left:12px;">

                    </div>
                    <div class="ztreeULBackground left">
                        <ul id="treeUL" class="ztree"></ul>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <div class="col-xs-4" ></div>
    <!--  编辑资源信息begin   -->
    <div aria-hidden="false" id="EditModal" aria-labelledby="myModalLabel" data-backdrop="static" role="dialog" tabindex="-1" class="modal fade in exam_newbox" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="blue"><i class="ace-icon fa fa-pencil-square-o"></i>编辑资源信息</h4>
                </div>
                <form id="EditForm" action="${request.getContextPath()}/system/resource/editResource.html" method="post">
                    <!-- 资源ID -->
                    <input type="hidden" name="resourceId" />

                    <div class="modal-body role_over">
                        <div class="form-horizontal">
                            <div class="form-group ">
                                <label class="col-sm-3 control-label">父菜单</label>
                                <div class="col-sm-9">
                                    <select name="parentId" style="width: 300px; ">
                                    <option value="0">无</option>
                                    <#if resourceList??>
                                        <#list resourceList as resource>
                                            <#if resource.parentId == 0>
                                                <option value="${resource.resourceId}" >
                                                 ${resource.resourceName!''}
                                                </option>
                                            </#if>
                                        </#list>
                                    </#if>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="col-sm-3 control-label">资源名称</label>
                                <div class="col-sm-9">
                                    <input class="col-sm-8" name="resourceName" type="text" style="width: 300px;" />
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="col-sm-3 control-label">资源URL</label>
                                <div class="col-sm-9">
                                    <input class="col-sm-9" name="resourceUrl" type="text" style="width: 300px; " />
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="col-sm-3 control-label">资源代码</label>
                                <div class="col-sm-9">
                                    <input class="col-sm-9" name="resourceCode" type="text" style="width: 300px; " />
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="col-sm-3 control-label">资源类型</label>
                                <div class="col-sm-9">
                                    <select name="resourceType" class="col-sm-9" style="width: 300px; ">
                                        <option value="0">菜单</option>
                                        <option value="1">按钮</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label class="col-sm-3 control-label">图标</label>
                                <div class="col-sm-9">
                                    <input class="col-sm-9" name="cssCls" type="text" style="width:300px;" ></input>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="col-sm-3 control-label">描述</label>
                                <div class="col-sm-9">
                                    <textarea name="resourceDesc" style="width:300px; height:100px;resize:none" ></textarea>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="modal-footer" style="clear:both;">
                        <a class="btn btn-white btn-info btn-bold" onclick="editResource();">
                            <i class="ace-icon glyphicon glyphicon-ok blue"></i>
                            保存
                        </a>
                        <a class="btn btn-white btn-info btn-bold" data-dismiss="modal">
                            <i class="ace-icon glyphicon glyphicon-remove blue"></i>
                            取消
                        </a>
                    </div>
                </form>
                <script>
                    $(function (){
                        $("[data-toggle='popover']").popover();
                    });
                </script>
            </div>
        </div>
    </div>
    <!-- 编辑资源信息end -->
    <!-- 确认删除begin -->
    <div id="is_del_modal" class="modal fade" style="display: none; " data-backdrop="static" role="dialog" tabindex="-1" class="modal fade in exam_newbox">
        <div class="modal-dialog">
            <div class="modal-content"  >
                <div class="modal-header">
                    <a class="close" data-dismiss="modal">×</a>
                    <h4 class="blue">系统提示</h4>
                </div>
                <div class="modal-body">
                    确认删除吗？
                </div>
                <div class="modal-footer">
                    <a onclick="deleteResource()" class="btn btn-white btn-info btn-bold">
                        <i class="ace-icon glyphicon glyphicon-ok blue"></i>
                        确定
                    </a>
                    <a class="btn btn-white btn-info btn-bold" data-dismiss="modal">
                        <i class="ace-icon glyphicon glyphicon-remove blue"></i>
                        取消
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- 确认删除end -->
</div>
<style type="text/css">
    .ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
    .ztree li span.button.icon1{margin:0; background: url(${request.contextPath}/static/ztree/img/Up.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
    .ztree li span.button.icon2{margin:0; background: url(${request.contextPath}/static/ztree/img/Down.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
</style>

<script type="text/javascript">
    var curExpandNode = null;
    function beforeExpand(treeId, treeNode) {
        var pNode = curExpandNode ? curExpandNode.getParentNode():null;
        var treeNodeP = treeNode.parentTId ? treeNode.getParentNode():null;
        var zTree = $.fn.zTree.getZTreeObj("treeUL");
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
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false,
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom
        },
        edit: {
            enable: true,
            editNameSelectAll: true,
            renameTitle:"编辑",
            removeTitle:"删除",
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

        var treeObj = $.fn.zTree.getZTreeObj("treeUL");
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
                    url : '${request.getContextPath()}/system/resource/changeResource.html',
                    type : 'post',
                    data : {
                        'upOrder' : node.order,
                        'upId' : node.id,
                        'resourceId':treeNode.id,
                        'orderNo':treeNode.order
                    },
                    success : function(result) {
                        if(result){
                            window.location.href = '${request.getContextPath()}/system/resource/list.html';
                        }else{
                            alert("系统异常");
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
                    url : '${request.getContextPath()}/system/resource/changeResource.html',
                    type : 'post',
                    data : {
                        'upOrder' : node.order,
                        'upId' : node.id,
                        'resourceId':treeNode.id,
                        'orderNo':treeNode.order
                    },
                    success : function(result) {
                        if(result){
                            window.location.href = '${request.getContextPath()}/system/resource/list.html';
                        }else{
                            alert("系统异常");
                        }
                    }
                });

            }
        });
    }

    function onClick(e,treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeUL");
        zTree.expandNode(treeNode, null, null, null, true);
    }
    function beforeDrag(treeId, treeNodes) {
        return false;
    }
    function beforeEditName(treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeUL");
        zTree.selectNode(treeNode);
        getEditInfo(treeNode.id);
        $('#editModal').modal('show');
        return false;
    }
    function beforeRemove(treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeUL");
        zTree.selectNode(treeNode);
        if(treeNode.isParent){
            alert("请删除资源[" + treeNode.name +"]下的所有【子资源】");
        }else{
            delId = treeNode.id;
            $("#is_del_modal").modal("show");
            return false;
        }
    }
    function onRemove(e, treeId, treeNode) {
        window.location.href = '${request.getContextPath()}/system/resource/list.html';
    }
    function beforeRename(treeId, treeNode, newName, isCancel) {
        if (newName.length == 0) {
            alert("节点名称不能为空.");
            var zTree = $.fn.zTree.getZTreeObj("treeUL");
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

    $(document).ready(function(){
            $.fn.zTree.init($("#treeUL"),setting, ${data});
    });
</script>
<script type="text/javascript">
    /**
     * 更新资源
     */
    function editResource(){
        var resourceName = $("#EditModal").find($("input[name='resourceName']")).val();
        var resourceUrl =  $("#EditModal").find($("input[name='resourceUrl']")).val();
        if(!resourceName){
            alert("请输入资源名称");
            return;
        }
        if(resourceName.length>30){
            alert("资源名称长度不能大于30");
            return;
        }
        if(resourceUrl==''){
            alert("请输入资源URL");
            return;
        }else{
            $.ajax({
                url : $("#EditForm").attr("action"),
                type : 'post',
                data : $("#EditForm").serialize(),
                success : function(result) {
                    if(result){
                        window.location.href = '${request.getContextPath()}/system/resource/list.html';
                    }else{
                        alert("添加失败");
                    }
                }
            });
        }
    }
    //获取资源信息
    function getEditInfo(resourceId){
        $.ajax({
            url : '${request.getContextPath()}/system/resource/getResourceInfo.html',
            type : 'post',
            data : {
                'resourceId' : resourceId
            },
            success : function(data) {
                clearForm();
                $("input[name='resourceId']").val(data.resourceId);
                $("select[name='parentId']").val(data.parentId);
                $("input[name='resourceName']").val(data.resourceName);
                $("input[name='resourceCode']").val(data.resourceCode);
                $("input[name='resourceUrl']").val(data.resourceUrl);
                $("input[name='cssCls']").val(data.cssCls);
                $("textarea[name='resourceDesc']").val(data.resourceDesc);
                $("select[name='resourceType']").val(data.resourceType);
                $("#EditModal").modal("show");
            }
        });
    }
    var delId;
    //删除资源
    function deleteResource(){
        $.ajax({
            url : '${request.getContextPath()}/system/resource/deleteResource.html',
            type : 'post',
            async:false,
            data : {
                'resourceId': delId
            },
            success : function(result) {
                if(result){
                    window.location.href = '${request.getContextPath()}/system/resource/list.html';
                }else{
                    alert("系统异常");
                }
            }
        });
    }

    /**
     * 清空表单
     */
    function clearForm(){
        $("#EditForm")[0].reset();
        $("#EditForm").find("input[name='resourceId']").val("");
    }

    /**
     * 显示新增
     */
    function showAddModal(){
        clearForm();
        $("#EditModal").modal("show");
    }
</script>

</@ui.layout>