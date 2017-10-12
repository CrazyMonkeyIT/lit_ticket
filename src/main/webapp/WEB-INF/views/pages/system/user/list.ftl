<@ui.layout >
<div class="panel panel-default" style="height:70px;">
    <div class="panel-body">
        <form class="form-inline" id="form1" role="form" action="${request.getContextPath()}/sys/user/list.html" method="post">
            <input id="pageIndex" name="pageIndex" value="${page.pageNum}" type="hidden" />
            <div class="input-group" style="float:left;width:15%;min-width:135px;margin-right:0.5%;">
                <span class="input-group-addon">登录名</span>
                <input type="text" name="userName" value="${userName!}" class="col-xs-10 col-sm-5 input-sm width-100" />
            </div>

            <button type="submit" class="btn btn-info btn-sm" >
                <span class="glyphicon glyphicon-search" aria-hidden="true"> 查  询</span>
            </button>
            &nbsp;
            <a href="#saveModal" role="button" data-toggle="modal" class="btn btn-sm btn-info">
                <i class="glyphicon glyphicon-plus"></i>
                创建账户
            </a>
        </form>
    </div>
</div>
<div class="table-responsive">
    <table class="table table-striped table-bordered table-condensed table-hover" >
        <thead >
        <tr >
            <th style="text-align:center">用户编号</th>
            <th style="text-align:center">用户名</th>
            <th style="text-align:center">登录名</th>
            <th style="text-align:center">最后登录时间</th>
            <th style="text-align:center">状态</th>
            <th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#if page.list??>
        <#list page.list as data>
        <tr style="text-align:center;font-size:14px;">
            <td>${((page.pageNum-1) * 10) + (data_index+1)}</td>
            <td>${data.userName!''}</td>
            <td>${data.loginName!''}</td>
            <td>${data.lastLoginTime?string("yyyy-MM-dd")}</td>
            <td>
                <#if (data.userStatus==1)>
                    <span class="label label-sm label-success">正常</span>
                <#elseif (data.userStatus==2)>
                    <span class="label label-sm label-yellow">冻结</span>
                <#elseif (data.userStatus==3)>
                    <span class="label label-sm label-danger">失效</span>
                </#if>
            </td>
            <td >
                <span style="width:20px;">
                  <a href="#updateModal" role="button" data-toggle="modal" class="btn btn-link" onclick="getUserInfo(${data.userId});">
                    <button class="btn btn-xs btn-default" >修改</button>
                </a>
                </span>
                <span style="width:30px;">
                 <a href="#" onclick="resetPwd(${data.userId});">
                    <button class="btn btn-xs btn-yellow" >密码重置</button>
                 </a>
                </span>
                <span style="width:30px;">
                 <a href="#" onclick="resetPwd(${data.userId});">
                    <button class="btn btn-xs btn-yellow" >冻结</button>
                 </a>
                </span>
                <span style="width:30px;">
                 <a href="#" onclick="resetPwd(${data.userId});">
                    <button class="btn btn-xs btn-yellow" >删除</button>
                 </a>
                </span>
                <span style="width:30px;">
                 <a href="#" onclick="resetPwd(${data.userId});">
                    <button class="btn btn-xs btn-yellow" >权限配置</button>
                 </a>
                </span>
            </td>
        </tr>
        </#list>
        </#if>
        </tbody>
    </table>
    <!-- 分页begin -->
    <#if (page.pages>0)>
        <#import "../../../macro/pagination.ftl" as cast/>
        <@cast.pagination callFunName="submitForm" />
    </#if>
        <!-- 分页end -->
    </div>
</div>
<script>
// 分页查询
function submitForm(index){
    $("#pageIndex").val(index);
    $("#form1").submit();
}
</script>
</@ui.layout>