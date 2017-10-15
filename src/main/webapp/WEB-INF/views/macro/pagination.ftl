<#macro pagination callFunName>
<div class="row-fluid">
    <#if page.pageNum == 1>
        <#assign min=1 >
    <#else>
        <#assign min= ((page.pageNum - 1) * 10) + 1 >
    </#if>
    <#assign max=((page.pageNum -1) * 10) + page.size>
    <#if (max > page.total) >
        <#assign max=page.total>
    </#if>
    <span style="position: relative;left: 10px;top:5px;">
		当前显示  ${min} 至 ${max} ,共 ${page.total} 条记录</span>
    <div style="width:100%;border:0px solid red;text-align:center;position: relative;top:-20px;">
        <ul class="pagination" style="margin:0px auto;" >
            <#if (page.pageNum >= 0 )>
                <#assign pre1=(page.pageNum - 2)>
                <#assign pre2=(page.pageNum - 1)>
                <#assign pre3=(page.pageNum)>
                <#assign pre4=(page.pageNum+1)>
                <#assign pre5=(page.pageNum+2)>
                <#assign nums=[pre1,pre2,pre3,pre4,pre5]>
            </#if>
            <#if (page.pageNum > 1)>
                <li><a class="btn btn-white btn-info" href="javascript:${callFunName}(1)">首页</a></li>
                <li><a class="btn btn-white btn-info" href="javascript:${callFunName}(${page.pageNum} - 1)">上一页</a></li>
            </#if>
            <#list nums as index >
                <#if (page.pageNum == index)>
                    <li class="active"><a href="#" disabled="disabled">${index}</a></li>
                <#elseif (index > 0 && index <= page.pages)>
                    <li><a class="btn btn-white btn-info" href="javascript:${callFunName}(${index})">${index}</a></li>
                </#if>
            </#list>
            <#if (page.pageNum < page.pages)>
                <li><a class="btn btn-white btn-info" href="javascript:${callFunName}(${page.pageNum} + 1)">下一页</a></li>
                <li><a class="btn btn-white btn-info" href="javascript:${callFunName}(${page.pages})">尾页</a></li>
            </#if>
            <li ><a  class="btn btn-white btn-info" href="javascript:void(0);" disabled="disabled"> ${page.pageNum}/${page.pages} 页</a></li>
            <!--
            <li style="">
                <input style="width:30px;height:28px;margin-left:10px;margin-top:2px;" id="gotoNum"  onkeyup="value=value.replace(/\D/ig,'')" maxlength="4" />
                <button type="button" class="btn btn-link " onclick="${callFunName}($('#gotoNum').val())">跳　转</button>
            </li>
            -->
        </ul>
    </div>
</div>
<script>
function goto(page){
    $("#pageIndex").val(page);
    $("#form1").submit();
}
</script>
</#macro>