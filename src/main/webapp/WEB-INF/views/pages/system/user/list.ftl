<@ui.layout >
<!-- zTree -->
<link rel="stylesheet" href="${request.contextPath}/static/ztree/zTreeStyle.css" type="text/css">
<script src="${request.contextPath}/static/ztree/jquery.ztree.all-3.5.js"></script>
<!-- My97 -->
<script src="${request.contextPath}/static/My97DatePicker/WdatePicker.js"></script>
<div class="col-xs-12">
    <!-- div.table-responsive -->

    <!-- div.dataTables_borderWrap -->
    <div>
        <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
            <div class="row">
                <form class="form-inline" id="form1" role="form" action="${request.getContextPath()}/system/user/list.html" method="post">
                    <input id="pageIndex" name="pageIndex" value="${page.pageNum}" type="hidden" />
                    <div class="input-group">
                        <input type="text" name="userName" value="${userName!}" class="form-control search-query" placeholder="用户名">
                        <span class="input-group-btn">
                            <button type="submit" class="btn btn-white btn-info">
                                <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                查询
                            </button>
                        </span>
                    </div>
                    &nbsp;
                    <a onclick="showAddModal()" class="btn btn-white btn-info">
                        <i class="glyphicon glyphicon-plus"></i>
                        创建账户
                    </a>
                </form>
            </div>
                <table class="table table-striped table-bordered table-hover dataTable no-footer" >
                    <thead class="thin-border-bottom">
                    <tr >
                        <th >序号</th>
                        <th ><i class="normal-icon ace-icon fa fa-user"></i>用户名</th>
                        <th >登录名</th>
                        <th ><i class="normal-icon ace-icon fa fa-clock-o"></i>失效时间</th>
                        <th ><i class="normal-icon ace-icon fa fa-clock-o"></i>最后登录时间</th>
                        <th >状态</th>
                        <th ><i class="ace-icon fa fa-wrench"></i>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                        <#if page.list?? && (page.list?size > 0)>
                            <#list page.list as data>
                            <tr>
                                <td>${((page.pageNum-1) * 10) + (data_index+1)}</td>
                                <td><span class="blue">${data.userName!''}</span></td>
                                <td>${data.loginName!''}</td>
                                <td><#if data.loginInvalid??>${(data.loginInvalid?string('yyyy-MM-dd HH:mm:ss'))}</#if></td>
                                <td><#if data.lastLoginTime??>${(data.lastLoginTime?string('yyyy-MM-dd HH:mm:ss'))}</#if></td>
                                <td>
                                    <#if (data.userStatus==1)>
                                        <span class="label label-sm label-success arrowed">正常</span>
                                    <#elseif (data.userStatus==2)>
                                        <span class="label label-sm label-yellow">冻结</span>
                                    <#elseif (data.userStatus==3)>
                                        <span class="label label-sm">失效</span>
                                    </#if>
                                </td>
                                <td >
                                    <div class="btn-overlap btn-group">
                                        <a onclick="showEditModal('${data.loginName}');" class="btn btn-white btn-primary btn-bold"  data-rel="tooltip" title="" data-original-title="修改" title="修改">
                                            <i class="fa fa-pencil bigger-110 green" ></i>
                                        </a>
                                        <a onclick="resetUserPwd(${data.userId})" class="btn btn-white btn-primary btn-bold" data-rel="tooltip" title="" data-original-title="密码重置" title="密码重置">
                                            <i class="fa fa-refresh bigger-110 pink"></i>
                                        </a>
                                        <#if (data.userStatus==1)>
                                        <a onclick="updateUserStatus(${data.userId},2)" class="btn btn-white btn-primary btn-bold" data-rel="tooltip" title="" data-original-title="冻结" title="冻结">
                                            <i class="fa fa-lock bigger-115 orange"></i>
                                        </a>
                                        <#elseif (data.userStatus==2)>
                                        <a onclick="updateUserStatus(${data.userId},1)" class="btn btn-white btn-primary btn-bold" data-rel="tooltip" title="" data-original-title="解冻" title="解冻">
                                            <i class="fa fa-key bigger-110 orange"></i>
                                        </a>
                                        </#if>
                                        <a onclick="deleteUser(${data.userId})" class="btn btn-white btn-primary btn-bold" data-rel="tooltip" title="" data-original-title="删除" title="删除">
                                            <i class="fa fa-trash-o bigger-110 red"></i>
                                        </a>
                                        <a onclick="showPowerSeting(${data.userId})" class="btn btn-white btn-primary btn-bold" data-rel="tooltip" title="" data-original-title="设置权限" title="设置权限">
                                            <i class="fa fa-list bigger-110 grey"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            </#list>
                        <#else>
                        <tr style="text-align:center;">
                           <td colspan="6"><h4 class="green">暂无用户</h4></td>
                        </tr>
                        </#if>
                    </tbody>
                </table>
            <div class="row">
                <!-- 分页begin -->
                <#if (page.pages>0)>
                    <#import "../../../macro/pagination.ftl" as cast/>
                    <@cast.pagination callFunName="submitForm" />
                </#if>
                <!-- 分页end -->
            </div>
        </div>
    </div>
</div>
<!-- 编辑用户信息begin -->
<div id="edit_user_modal" class="modal fade" style="display: none; " data-backdrop="static" role="dialog" tabindex="-1" class="modal fade in exam_newbox">
    <div class="modal-dialog">
        <div class="modal-content"  >
            <div class="modal-header">
                <a class="close" data-dismiss="modal">×</a>
                <h4 class="blue"><i class="fa fa-pencil"></i>&nbsp;编辑用户</h4>
            </div>
            <div class="modal-body">
                <form id="editForm" action="${request.getContextPath()}/system/user/updateUser.html" method="post">
                    <div class="form-horizontal">
                        <!-- 用户ID -->
                        <input type="hidden" name="userId" />

                        <div class="form-group ">
                            <label class="col-sm-4 control-label">姓名</label>
                            <div class="col-sm-8">
                                <input name="userName" type="text"  />
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-4 control-label">登录名</label>
                            <div class="col-sm-8">
                                <input name="loginName" type="text"  />
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-4 control-label">失效时间</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </span>
                                    <input type="text" name="loginInvalidDate" onclick="WdatePicker()" style="width: 142px;cursor: pointer;"/>
                                </div>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a onclick="updateUser()" class="btn btn-white btn-info btn-bold">
                    <i class="ace-icon glyphicon glyphicon-ok blue"></i>
                    保存
                </a>
                <a class="btn btn-white btn-info btn-bold" data-dismiss="modal">
                    <i class="ace-icon glyphicon glyphicon-remove blue"></i>
                    取消
                </a>
            </div>
        </div>
    </div>
</div>
<!-- 编辑用户信息end -->
<!-- 设置权限begin -->
<div id="power_modal" class="modal fade" style="display: none; " data-backdrop="static" role="dialog" tabindex="-1" class="modal fade in">
    <div class="modal-dialog">
        <div class="modal-content" style="width:400px;margin:0px auto;" >
            <div class="modal-header">
                <a class="close" data-dismiss="modal">×</a>
                <h4 class="blue"><i class="fa fa-list"></i>&nbsp;用户权限设置</h4>
            </div>
            <div class="modal-body">
                <ul id="treeUL" class="ztree" ></ul>
                <input type="hidden" id="powerUserId" />
            </div>
            <div class="modal-footer">
                <button onclick="saveUserPower()" class="btn btn-white btn-info btn-bold">
                    <i class="ace-icon glyphicon glyphicon-ok blue"></i>
                    保存
                </button>
                <button class="btn btn-white btn-info btn-bold" data-dismiss="modal">
                    <i class="ace-icon glyphicon glyphicon-remove blue"></i>
                    取消
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 设置权限end -->
<script>
jQuery(function($) {
    $('[data-rel=tooltip]').tooltip();
    //获取当前登录用户权限列表
    loadCurrPowerList();
});
// 分页查询
function submitForm(index){
    $("#pageIndex").val(index);
    $("#form1").submit();
}
/**
 * 清空表单
 */
function clearForm(){
    $("#editForm")[0].reset();
    $("#editForm").find("input[name='userId']").val("");
}
/**
 * 显示新增用户
 */
function showAddModal(){
    clearForm();
    $("#edit_user_modal").modal("show");
}

/**
 * 更新用户信息
 */
function updateUser(){
    var userName = $("#editForm").find("input[name='userName']").val();
    var loginName = $("#editForm").find("input[name='loginName']").val();
    if(!userName){
        alert("用户姓名必须填写");
        $("#editForm").find("input[name='userName']").focus();
        return false;
    }
    if(!loginName){
        alert("登录名必须填写");
        $("#editForm").find("input[name='loginName']").focus();
        return false;
    }
    $.ajax({
        url : $("#editForm").attr("action"),
        type : 'post',
        data : $("#editForm").serialize(),
        success : function(data) {
            if(data.result){
                $("#form1").submit();
            }else{
                alert(data.msg);
            }
        }
    });
}

/**
 * 获取用户信息
 */
function showEditModal(loginName){
    clearForm();
    $.ajax({
        url : basePath+"/system/user/getUserInfo.html",
        type : 'post',
        data : {
            "loginName":loginName
        },
        success : function(data) {
            $("#editForm").find("input[name='userId']").val(data.userId);
            $("#editForm").find("input[name='userName']").val(data.userName);
            $("#editForm").find("input[name='loginName']").val(data.loginName);
            if(!!data.loginInvalid) {
                $("#editForm").find("input[name='loginInvalidDate']").val(fmtDate(data.loginInvalid));
            }
            $("#edit_user_modal").modal("show");
        }
    });
}

/**
 * 重置用户密码
 */
function resetUserPwd(userId){
    Ewin.confirm({ message: "确认要重置该用户的密码吗？<br/><br/>初始密码为：123456" }).on(function () {
        $.ajax({
            url: basePath + "/system/user/resetUserPwd.html",
            type: 'post',
            data: {
                "userId": userId
            },
            success: function (data) {
                if (data) {
                    alert("密码重置成功，初始密码为：123456");
                } else {
                    alert("操作失败，系统异常");
                }
            }
        });
    });
}

/**
 * 冻结/解冻
 */
function updateUserStatus(userId,status){
    $.ajax({
        url : basePath+"/system/user/updateUserStatus.html",
        type : 'post',
        data : {
            "userId":userId,
            "status":status
        },
        success : function(data) {
            if(data){
                $("#form1").submit();
            }else{
                alert("操作失败，系统异常");
            }
        }
    });
}

/**
 * 删除用户
 */
function deleteUser(userId){
    Ewin.confirm({ message: "确认要删除该用户吗？" }).on(function () {
        $.ajax({
            url : basePath+"/system/user/deleteUser.html",
            type : 'post',
            data : {
                "userId":userId
            },
            success : function(data) {
                if(data){
                    $("#form1").submit();
                }else{
                    alert("操作失败，系统异常");
                }
            }
        });
    });
}
//==================================================设置权限============================================
//zTree设置
var setting = {
    view: {
        dblClickExpand: false,
        showLine: true,
        selectedMulti: false
    },
    data:{
        simpleData: {
            enable: true
        }
    },
    check:{
        enable: true,
        chkboxType : { "Y" : "ps", "N" : "ps" }
    }
};

/**
 * 获取当前登录用户的权限列表
 */
function loadCurrPowerList(){
    $.ajax({
        url : basePath+"/system/user/getUserPowerList.html",
        type : 'post',
        success : function(data) {
            if(data != null){
                $.fn.zTree.init($("#treeUL"),setting, data);
            }else{
                alert("获取权限列表失败");
            }
        }
    });
}

/**
 * 显示指定用户的权限设置
 */
function showPowerSeting(userId){
    $("#powerUserId").val(userId);

    //清除所有选中
    var treeObj = $.fn.zTree.getZTreeObj("treeUL");
    treeObj.checkAllNodes(false);

    $.ajax({
        url : basePath+"/system/user/getUserPowerList.html",
        type : 'post',
        data:{
            "userId":userId
        },
        success : function(data) {
            if(data != null){
                var zTree_Menu = $.fn.zTree.getZTreeObj("treeUL");
                $.each(data,function(index,obj){
                    var node = zTree_Menu.getNodeByParam("id",obj.id );
                    zTree_Menu.checkNode(node,true);//指定选中ID的节点
                });
                $("#power_modal").modal("show");
            }else{
                alert("获取权限列表失败");
            }
        }
    });

}

/**
 * 保存用户权限配置
 */
function saveUserPower(){
    var treeObj=$.fn.zTree.getZTreeObj("treeUL"),
            nodes=treeObj.getCheckedNodes(true),
            v = [];
    for(var i=0;i<nodes.length;i++){
        v.push(nodes[i].id);
    }
    $.ajax({
        url : basePath+"/system/user/updateUserPower.html",
        type : 'post',
        data:{
            "userId":$("#powerUserId").val(),
            "json": v.join(",")
        },
        success : function(data) {
            if(data != null){
               alert("保存成功");
               $("#power_modal").modal("hide");
            }else{
                alert("获取权限列表失败");
            }
        }
    });
}
</script>
</@ui.layout>