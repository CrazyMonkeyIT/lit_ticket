<!-- 修改密码begin -->
<div id="modify_pwd_modal" class="modal fade" style="display: none; " data-backdrop="static" role="dialog" tabindex="-1" class="modal fade in exam_newbox">
    <div class="modal-dialog">
        <div class="modal-content"  >
            <div class="modal-header">
                <a class="close" data-dismiss="modal">×</a>
                <h4 class="blue"><i class="fa fa-pencil"></i>&nbsp;修改密码</h4>
            </div>
            <div class="modal-body">
                <form id="modifyPwdForm" action="${request.getContextPath()}/system/user/modifyPwd.html" method="post">
                    <div class="form-horizontal">
                        <div class="form-group ">
                            <label class="col-sm-4 control-label">原始密码</label>
                            <div class="col-sm-8">
                                <input name="oldPwd" type="password"  />
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-4 control-label">新密码</label>
                            <div class="col-sm-8">
                                <input name="newPwd" type="password"  />
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-4 control-label">确认新密码</label>
                            <div class="col-sm-8">
                                <input name="confirmPwd" type="password"  />
                            </div>
                        </div>

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a onclick="confirmModifyPwd()" class="btn btn-white btn-info btn-bold">
                    <i class="ace-icon glyphicon glyphicon-ok blue"></i>
                    确认修改
                </a>
                <a class="btn btn-white btn-info btn-bold" data-dismiss="modal">
                    <i class="ace-icon glyphicon glyphicon-remove blue"></i>
                    取消
                </a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
/**
 * 弹出修改密码
 */
function showModifyPwdModal(){
    $("#modifyPwdForm").find("input[name='oldPwd']").val("");
    $("#modifyPwdForm").find("input[name='newPwd']").val("");
    $("#modifyPwdForm").find("input[name='confirmPwd']").val("");
    $("#modify_pwd_modal").modal("show");
}

/**
 * 确认修改密码
 */
function confirmModifyPwd(){
    var oldPwd = $("#modifyPwdForm").find("input[name='oldPwd']").val();
    var newPwd = $("#modifyPwdForm").find("input[name='newPwd']").val();
    var confirmPwd = $("#modifyPwdForm").find("input[name='confirmPwd']").val();
    if(!oldPwd){
        alert("请输入原始密码");
        $("#modifyPwdForm").find("input[name='oldPwd']").focus();
        return false;
    }
    if(!newPwd){
        alert("请输入新密码");
        $("#modifyPwdForm").find("input[name='newPwd']").focus();
        return false;
    }
    if(!confirmPwd){
        alert("请输入确认密码");
        $("#modifyPwdForm").find("input[name='confirmPwd']").focus();
        return false;
    }
    if(newPwd == oldPwd){
        alert("新密码不能和原始密码相同");
        $("#modifyPwdForm").find("input[name='newPwd']").focus();
        return false;
    }
    if(newPwd != confirmPwd){
        alert("两次新密码不一致，请核对");
        $("#modifyPwdForm").find("input[name='confirmPwd']").focus();
        return false;
    }
    if(newPwd.length < 6){
        alert("新密码的密码强度太低，请重新设置");
        $("#modifyPwdForm").find("input[name='newPwd']").focus();
        return false;
    }
    $.ajax({
        url : $("#modifyPwdForm").attr("action"),
        type : 'post',
        data : $("#modifyPwdForm").serialize(),
        success : function(data) {
            console.log(data);
            if(data.success){
                alert("恭喜，密码修改成功，请重新登录");
                setTimeout(logout,2000);
            }else{
                alert(data.message);
            }
        }
    });
}
</script>
<!-- 修改密码end -->