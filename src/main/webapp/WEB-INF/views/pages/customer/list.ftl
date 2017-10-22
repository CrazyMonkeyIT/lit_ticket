<@ui.layout >
<!-- zTree -->
<link rel="stylesheet" href="${request.contextPath}/static/ztree/zTreeStyle.css" type="text/css">
<script src="${request.contextPath}/static/ztree/jquery.ztree.all-3.5.js"></script>

<style>
    #editForm input,select{
        width:200px;
    }

</style>
<div class="col-xs-12">
        <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
            <div class="row">
                <form class="form-inline" id="form1" role="form" action="${request.getContextPath()}/customer/list.html" method="post">
                    <input id="pageIndex" name="pageIndex" value="${page.pageNum}" type="hidden" />
                    <div class="input-group">
                        <input type="text" name="custName" value="${custName!}" class="form-control search-query" placeholder="客户名">
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
                        创建客户
                    </a>
                </form>
            </div>
            <table class="table table-striped table-bordered table-hover dataTable no-footer" >
                <thead class="thin-border-bottom">
                <tr >
                    <th >序号</th>
                    <th >客户名</th>
                    <th >客户代码</th>
                    <th >客户规模</th>
                    <th >企业属性</th>
                    <th >国标行业</th>
                    <th >国资委行业</th>
                    <th ><i class="normal-icon ace-icon fa fa-clock-o"></i>创建时间</th>
                    <th ><i class="ace-icon fa fa-wrench"></i>操作</th>
                </tr>
                </thead>
                <tbody>
					<#if page.list?? && (page.list?size > 0)>
						<#list page.list as data>
                            <tr>
                                <td>${((page.pageNum-1) * 10) + (data_index+1)}</td>
                                <td><span class="blue">${data.custName!''}</span></td>
                                <td>${data.custCode!''}</td>
                                <td>
                                    <#if data.custScale == 1>大</#if>
                                    <#if data.custScale == 2>中</#if>
                                    <#if data.custScale == 3>小</#if>
                                    <#if data.custScale == 4>位置</#if>
                                    <#if data.custScale == 5>不使用</#if>
                                </td>
                                <td>
                                    <#if data.enterpriseAttribute == 1>国有企业</#if>
                                    <#if data.enterpriseAttribute == 2>上市企业</#if>
                                    <#if data.enterpriseAttribute == 3>民营大企业</#if>
                                    <#if data.enterpriseAttribute == 4>民营中小企业</#if>
                                </td>
                                <td>${data.nationalStandardName!''}</td>
                                <td>${data.industrySasacName!''}</td>
                                <td>
                                    <#if data.createTime??>${(data.createTime?string('yyyy-MM-dd HH:mm:ss'))}</#if>
                                </td>
                                <td >
                                    <div class="btn-overlap btn-group">
                                        <a onclick="showEditModal(${data.id});" class="btn btn-white btn-primary btn-bold"  data-rel="tooltip" title="" data-original-title="修改" title="修改">
                                            <i class="fa fa-pencil bigger-110 green" ></i>
                                            修改
                                        </a>
                                        <a onclick="deleteCust(${data.id})" class="btn btn-white btn-primary btn-bold" data-rel="tooltip" title="" data-original-title="删除" title="删除">
                                            <i class="fa fa-trash-o bigger-110 red"></i>
                                            删除
                                        </a>
                                    </div>
                                </td>
                            </tr>
						</#list>
					<#else>
                        <tr style="text-align:center;">
                            <td colspan="8"><h4 class="green">暂无客户</h4></td>
                        </tr>
					</#if>
                </tbody>
            </table>
            <div class="row">
                <!-- 分页begin -->
				<#if (page.pages>0)>
					<#import "../../macro/pagination.ftl" as cast/>
					<@cast.pagination callFunName="submitForm" />
				</#if>
                <!-- 分页end -->
            </div>
        </div>
</div>
<!-- 编辑信息begin -->
<div id="edit_modal" class="modal fade" style="display: none; " data-backdrop="static" role="dialog" tabindex="-1" class="modal fade in exam_newbox">
    <div class="modal-dialog">
        <div class="modal-content"  >
            <div class="modal-header">
                <a class="close" data-dismiss="modal">×</a>
                <h4 class="blue"><i class="fa fa-pencil"></i>&nbsp;编辑客户</h4>
            </div>
            <div class="modal-body">
                <form id="editForm" action="${request.getContextPath()}/customer/update.html" method="post">
                    <div class="form-horizontal">
                        <!-- ID -->
                        <input type="hidden" name="id" />

                        <div class="form-group ">
                            <label class="col-sm-4 control-label">客户名称</label>
                            <div class="col-sm-8">
                                <input name="custName" type="text"  />
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-4 control-label">客户代码</label>
                            <div class="col-sm-8">
                                <input name="custCode" type="text"  />
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-4 control-label">客户规模</label>
                            <div class="col-sm-8">
                                <select name="custScale" >
									<option value="1">大</option>
                                    <option value="2">中</option>
                                    <option value="3">小</option>
                                    <option value="4">未知</option>
                                    <option value="5">不使用</option>
								</select>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-4 control-label">企业属性</label>
                            <div class="col-sm-8">
                                <select name="enterpriseAttribute" >
                                    <option value="1">国有企业</option>
                                    <option value="2">上市企业</option>
                                    <option value="3">民营大企业</option>
                                    <option value="4">民营中小企业</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-4 control-label">国标行业</label>
                            <div class="col-sm-8">
                                <input name="nationalStandardId" type="hidden"/>
                                <div class="btn-group" >
                                    <button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle" aria-expanded="false" style="width: 200px;height:30px;">
                                        <span id="span1" style="float:left;"></span>
                                        <i class="ace-icon fa fa-angle-down icon-on-right" style="float:right;"></i>
                                    </button>
                                    <ul class="dropdown-menu" id="ul1" style="width: 200px;">

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-4 control-label">国资委行业</label>
                            <div class="col-sm-8">
                                <input name="industrySasacId" type="hidden"  />
                                <div class="btn-group" >
                                    <button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle" aria-expanded="false" style="width: 200px;height:30px;">
                                        <span id="span2" style="float:left;"></span>
                                        <i class="ace-icon fa fa-angle-down icon-on-right" style="float:right;"></i>
                                    </button>
                                    <ul class="dropdown-menu" id="ul2" style="width: 200px;">

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a onclick="update()" class="btn btn-white btn-info btn-bold">
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
<!-- 编辑信息end -->
<script>
    $(function(){
        loadNationalStandard();
        loadSasacIndustry();
    });
    /**
     * 清空表单
     */
    function clearForm(){
        $("#editForm")[0].reset();
        $("#editForm").find("input[name='id']").val("");
        $("#span1").html("");
        $("#span2").html("");
    }
    /**
     * 显示新增
     */
    function showAddModal(){
        clearForm();
        $("#edit_modal").modal("show");
    }

    /**
     * 更新信息
     */
    function update(){
        var custName = $("#editForm").find("input[name='custName']").val();
        var nationalStandardId = $("#editForm").find("input[name='nationalStandardId']").val();
        var industrySasacId = $("#editForm").find("input[name='industrySasacId']").val();
        if(!custName){
            alert("客户名称必须填写");
            $("#editForm").find("input[name='custName']").focus();
            return false;
        }
        if(!nationalStandardId || !industrySasacId){
            alert("请选择国标行业和国资委行业");
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
                    alert(data.message);
                }
            }
        });
    }

    /**
     * 获取客户信息
     */
    function showEditModal(id){
        clearForm();
        $.ajax({
            url : basePath+"/customer/getInfo.html",
            type : 'post',
            data : {
                "id":id
            },
            success : function(data) {
                $("#editForm").find("input[name='id']").val(data.id);
                $("#editForm").find("input[name='custName']").val(data.custName);
                $("#editForm").find("input[name='custCode']").val(data.custCode);
                $("#editForm").find("select[name='custScale']").val(data.custScale);
                $("#editForm").find("select[name='enterpriseAttribute']").val(data.enterpriseAttribute);
                $("#editForm").find("input[name='nationalStandardId']").val(data.nationalStandardId);
                $("#editForm").find("input[name='industrySasacId']").val(data.industrySasacId);
                $("#span1").html($("span[name='ul1_"+data.nationalStandardId+"']").html());
                $("#span2").html($("span[name='ul2_"+data.industrySasacId+"']").html());
                $("#edit_modal").modal("show");
            }
        });
    }

    /**
     * 删除客户
     */
    function deleteCust(id){
        Ewin.confirm({ message: "确认要删除该客户吗？" }).on(function () {
            $.ajax({
                url : basePath+"/customer/delete.html",
                type : 'post',
                data : {
                    "id":id
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

    /**
     * 加载国标行业列表
     */
    function loadNationalStandard(){
        $.ajax({
            url : basePath+"/system/nationalStandard/getAllList.html",
            type : 'get',
            success : function(data) {
                debugger;
                if(!!data){
                    var html = "";
                    $.each(data,function (index,obj) {
                        if(obj.parentId == 0){
                            html += '<li class="blue">' +
                                    '&nbsp;<i class="ace-icon fa fa-folder-open-o"></i>&nbsp;'+obj.industryName+'' +
                                    '</li>';
                            $.each(data,function (i,o) {
                                if(o.parentId == obj.id){
                                    html += '<li>' +
                                            '<a onclick="setSelectValue(1,'+o.id+',\''+o.industryName+'\')" >' +
                                            '<i class="ace-icon fa fa-caret-right blue"></i>' +
                                            '&nbsp;<span name="ul1_'+o.id+'">'+o.industryName+'</span>' +
                                            '</a>' +
                                            '</li>';
                                }
                            });
                        }
                    });
                    $("#ul1").html(html);
                }
            }
        });
    }
    /**
     * 加载国资委行业列表
     */
    function loadSasacIndustry(){
        $.ajax({
            url : basePath+"/system/sasacIndustry/getAllList.html",
            type : 'get',
            success : function(data) {
                debugger;
                if(!!data){
                    var html = "";
                    $.each(data,function (index,obj) {
                        if(obj.parentId == 0){
                            html += '<li class="blue">' +
                                    '&nbsp;<i class="ace-icon fa fa-folder-open-o"></i>&nbsp;'+obj.industryName+'' +
                                    '</li>';
                            $.each(data,function (i,o) {
                                if(o.parentId == obj.id){
                                    html += '<li><a onclick="setSelectValue(2,'+o.id+',\''+o.industryName+'\')" >' +
                                            '<i class="ace-icon fa fa-caret-right blue"></i>' +
                                            '&nbsp;<span name="ul2_'+o.id+'">'+o.industryName+'</span>' +
                                            '</a>' +
                                            '</li>';
                                }
                            });
                        }
                    });
                    $("#ul2").html(html);
                }
            }
        });
    }
    function setSelectValue(type,id,name){
        if(type == 1){
            $("input[name='nationalStandardId']").val(id);
            $("#span1").html(name);
        }else{
            $("input[name='industrySasacId']").val(id);
            $("#span2").html(name);
        }
    }
</script>
</@ui.layout>