<#macro pagination callFunName> 
<#import "../../common/control/spring.ftl" as spring />  
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
	  <span style="position: relative;left: 10px;top:5px;border:0px solid red;font-size:12px;">
		<@spring.message "common_currentShow"/>${min} <@spring.message "common_to"/> ${max} ,<@spring.message "common_total"/> ${page.total} <@spring.message "common_intotal"/></span>
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
                <li><a href="javascript:${callFunName}(1)"><@spring.message "common_home"/></a></li>
               <li><a href="javascript:${callFunName}(${page.pageNum} - 1)"><@spring.message "common_previous"/></a></li>
          </#if>
           <#list nums as index >
             <#if (page.pageNum == index)>
                 <li class="active"><a href="#">${index}</a></li>
             <#elseif (index > 0 && index <= page.pages)>
                 <li><a href="javascript:${callFunName}(${index})">${index}</a></li>
			 </#if>
          </#list>
          <#if (page.pageNum < page.pages)>
             <li><a href="javascript:${callFunName}(${page.pageNum} + 1)"><@spring.message "common_next"/></a></li>
             <li><a href="javascript:${callFunName}(${page.pages})"><@spring.message "common_end"/></a></li>
          </#if>
		  <li ><a  href="javascript:void(0);" > ${page.pageNum}/${page.pages} <@spring.message "common_page"/></a></li>
		  <li style="">
		    <input style="width:30px;height:28px;margin-left:10px;margin-top:2px;" id="gotoNum"  onkeyup="value=value.replace(/\D/ig,'')" maxlength="4" />
			<button type="button" class="btn btn-link btn-sm" onclick="${callFunName}($('#gotoNum').val())"><@spring.message "common_jump"/></button> 
		  </li>
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