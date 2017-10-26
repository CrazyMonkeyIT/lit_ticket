<style>
    .right{
        float:right;
    }
</style>
<div class="col-xs-12 col-sm-2 no-padding no-margin">
    <div class="search-area well well-sm">
        <div class="search-filter-header bg-primary">
            <h5 class="smaller no-margin-bottom">
                <i class="ace-icon fa fa-users"></i>&nbsp; 客户列表
            </h5>
        </div>

        <div class="space-10"></div>


        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="input-group">
                    <input type="text" name="searchCustName" value="${searchCustName!''}" class="form-control search-query" placeholder="客户名称">
                    <span class="input-group-btn">
                        <a onclick="searchCust()" class="btn btn-white btn-info">
                            <i class="ace-icon fa fa-search"></i>
                        </a>
                    </span>
                </div>
            </div>
        </div>


        <div class="hr hr-dotted"></div>

        <ul id="custMenu" style="height:100%;width: 97%;" class="ui-menu ui-widget ui-widget-content" role="menu" tabindex="0" aria-activedescendant="ui-id-${selectCustId!''}">
            <#list custList as cust>
                <li onclick="updateSelectCust(${cust.id},'${cust.custName}')" class="ui-menu-item <#if selectCustId?? && selectCustId == cust.id>ui-state-focus</#if>" id="ui-id-${cust.id}" tabindex="-1" role="menuitem">
                    ${cust.custName}
                    <#if selectCustId?? && selectCustId == cust.id>
                        <i class="ace-icon glyphicon glyphicon-ok right" ></i>
                    </#if>
                </li>
            </#list>
        </ul>

        <div class="space-4"></div>
    </div>
</div>
<script type="text/javascript">
/**
 * 绑定回车键
 */
$(function(){
    $('input[name="searchCustName"]').bind('keypress',function(event){
        if(event.keyCode == "13")
        {
            searchCust();
        }
    });
});

/**
 * 定位客户
 */
function searchCust(){
    var custName = $("input[name='searchCustName']").val();
    $("li[id^='ui-id']").each(function(){
        if($(this).html().indexOf(custName) != -1){
            $(this).trigger("click");
            $.ajax({
                url : basePath+"/updateSelectCust.html",
                type : 'post',
                data : {
                    "searchCustName":custName
                },
                success : function(data) {

                }
            });
        }
    });
}
/**
 * 更新选中客户
 */
function updateSelectCust(custId,custName){
    $.ajax({
        url : basePath+"/updateSelectCust.html",
        type : 'post',
        data : {
            "custId":custId,
            "custName":custName
        },
        success : function(data) {
            $("li[id^='ui-id']").removeClass("ui-state-focus");
            $("li[id^='ui-id']").find("i").remove();
            $("#ui-id-"+custId).html(custName+'<i class="ace-icon glyphicon glyphicon-ok right" ></i>');
            $("#ui-id-"+custId).addClass("ui-state-focus");
            $("#custMenu").attr("aria-activedescendant","ui-id-"+custId);
        }
    });
}

/**
 * 判断是否选择了客户
 */
function checkSelCust(){
    var length = $("#custMenu").find("li.ui-state-focus").length;
    return (length>0);
}
</script>