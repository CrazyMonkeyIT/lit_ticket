<@ui.layout >
<!-- magic-check -->
<link rel="stylesheet" href="${request.contextPath}/static/magic-check/magic-check.css" type="text/css">
<style>
.filed-name{
    text-align: right;
    padding:5px;

}
.filed-value{
    padding:5px 5px 5px 10px;
}
.right{
    float:right;
}
</style>
<div class="col-xs-12">
    <!-- 客户列表 -->
    <#include  "../../macro/leftCustList.ftl" />
    <div class="col-xs-12 col-sm-10">
        <div class="widget-box" style="width:709px;height:447px;">
            <div class="widget-header">
                <h4 class="widget-title"><i class="ace-icon fa fa-bar-chart-o"></i>风险分析</h4>
            </div>
            <div class="widget-body" >
                <div class="widget-main" style="padding:0px;">
                    <div style="height:100%;width: 50%;float:left;">
                        <table style="width:100%;height:100%;">
                            <tr>
                                <td class="filed-name" valign="top">报表类型：</td>
                                <td class="filed-value" valign="top">
                                    <select name="reportType" style="width:150px;">
                                        <option value="yearReport">年报</option>
                                        <option value="halfYearReport">半年报</option>
                                        <option value="seasonReport">季报</option>
                                        <option value="monthReport">月报</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="filed-name"  valign="top">年份：</td>
                                <td class="filed-value" valign="top">
                                    <div id="yearDiv" class="well"  style="height:100px;width:150px;padding:5px;margin:0px;overflow-y:auto; ">
                                        <div class="opt">
                                            <input class="magic-checkbox" type="checkbox" name="year" value="2017" id="year-2017">
                                            <label for="year-2017">2017年</label>
                                        </div>
                                        <div class="opt">
                                            <input class="magic-checkbox" type="checkbox" name="year" value="2016" id="year-2016">
                                            <label for="year-2016">2016年</label>
                                        </div>
                                        <div class="opt">
                                            <input class="magic-checkbox" type="checkbox" name="year" value="2015" id="year-2015">
                                            <label for="year-2015">2015年</label>
                                        </div>
                                        <div class="opt">
                                            <input class="magic-checkbox" type="checkbox" name="year" value="2014" id="year-2014">
                                            <label for="year-2014">2014年</label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="filed-name"  valign="top">时间：</td>
                                <td class="filed-value" valign="top">
                                    <div id="timeDiv" class="well"  style="height:200px;width:150px;padding:5px;margin:0px;overflow-y:auto;">
                                        <div class="opt">
                                            <input class="magic-checkbox" type="checkbox" checked="checked" name="time" value="yearend" id="time-yearend">
                                            <label for="time-yearend">年终</label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="filed-name" valign="top">货币单位：</td>
                                <td class="filed-value" valign="top">
                                    <select style="width:150px;">
                                        <option>万元</option>
                                        <option>元</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="height:100%;width: 50%;border-left:1px solid #ccc;float:left;">
                        <table style="width:100%;height:100%;">
                            <tr>
                                <td class="filed-name" valign="top"></td>
                                <td class="filed-value" style="">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="filed-name" valign="top"></td>
                                <td class="filed-value">
                                    分析时间<br/>
                                    <div style="height:28px;margin:0px;" class="green"><b id="resultReportName">2017年度报告</b></div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:118px;text-align: center;">
                                    <button onclick="addCompareTime()" type="button" class="btn moveall btn-white btn-bold btn-info" style="width:60px;" title="添加">
                                        <i class="fa fa-arrow-right"></i>
                                        <i class="fa fa-arrow-right"></i>
                                    </button>
                                    <button onclick="removeCompareTime()" type="button" class="btn removeall btn-white btn-bold btn-info" title="移除" style="width:60px;margin-top: 10px;">
                                        <i class="fa fa-arrow-left"></i>
                                        <i class="fa fa-arrow-left"></i>
                                    </button>
                                </td>
                                <td class="filed-value">
                                    比较时间<br/>
                                    <select id="compareTimeSelect" class="form-control" multiple="multiple" style="height:248px;width:150px;padding:5px;margin:0px;">

                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="filed-value" colspan="2" style="padding-left:58px;">
                                    <div class="opt" style="float:left;height:34px;padding-top:8px;">
                                        <input class="magic-checkbox" type="checkbox" name="layout" id="container">
                                        <label for="container">包含表外项目</label>
                                    </div>
                                    <div class="btn-group" style="float:left;">
                                        <button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle" aria-expanded="false">
                                            生成报告
                                            <i class="ace-icon fa fa-angle-down icon-on-right"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="javascript:report('loanProposal')" >贷款建议</a>
                                            </li>
                                            <li>
                                                <a href="javascript:report('riskAnalysis')">风险分析详细报告</a>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
    /**
     * 切换报表类型
     */
    $("select[name='reportType']").change(function(){
        var reportType = $(this).val();
        var html = "";
        if(reportType == "yearReport"){
            //年报
            html += createCheckBoxHtml("年终","yearend","yearend");
        }else if(reportType == "halfYearReport"){
            //半年报
            html += createCheckBoxHtml("上半年","firstHalfYear","firstHalfYear");
            html += createCheckBoxHtml("下半年","lastHalfYear","lastHalfYear");
        }else if(reportType == "seasonReport"){
            //季报
            html += createCheckBoxHtml("第一季度","season1","season1");
            html += createCheckBoxHtml("第二季度","season2","season2");
            html += createCheckBoxHtml("第三季度","season3","season3");
            html += createCheckBoxHtml("第四季度","season4","season4");
        }else if(reportType == "monthReport"){
            //月报
            html += createCheckBoxHtml("一月份","month1","month1");
            html += createCheckBoxHtml("二月份","month2","month2");
            html += createCheckBoxHtml("三月份","month3","month3");
            html += createCheckBoxHtml("四月份","month4","month4");
            html += createCheckBoxHtml("五月份","month5","month5");
            html += createCheckBoxHtml("六月份","month6","month6");
            html += createCheckBoxHtml("七月份","month7","month7");
            html += createCheckBoxHtml("八月份","month8","month8");
            html += createCheckBoxHtml("九月份","month9","month9");
            html += createCheckBoxHtml("十月份","month10","month10");
            html += createCheckBoxHtml("十一月份","month11","month11");
            html += createCheckBoxHtml("十二月份","month12","month12");
        }
        $("#timeDiv").html(html);
        $(".opt").click(function(){
            generateTitle();
            generateCompareDate();
        });
        $("#resultReportName").html("");
        $("#compareTimeSelect").html("");
    });

    $(".opt").click(function(){
        generateTitle();
        generateCompareDate();
    });

});
/** 创建checkbox **/
function createCheckBoxHtml(name,value,id){
    return  '<div class="opt">'+
            '<input class="magic-checkbox" type="checkbox" name="time" value="'+value+'" id="time-'+id+'">'+
            '<label for="time-'+id+'">'+name+'</label>'+
            '</div>';
}

/**
 * 生成标题
 */
function generateTitle(){
    var selectYearIdArr = [];
    var selectYearNameArr = [];
    $("#yearDiv").find("input[name='year']:checked").each(function(){
        selectYearIdArr.push($(this).val());
        selectYearNameArr.push($(this).next().html());
    });

    var maxTime = "";
    var reportType = $("select[name='reportType']").val();
    if(reportType == "yearReport"){
        //年报
        maxTime = "年终";
    }else if(reportType == "halfYearReport"){
        //半年报
        var checked1 = $("#timeDiv").find("#time-firstHalfYear").is(':checked');
        var checked2 = $("#timeDiv").find("#time-lastHalfYear").is(':checked');
        if(checked1 && !checked2){
            maxTime = "上半年";
        }else if((!checked1 && checked2) || (checked1 && checked2)){
            maxTime = "下半年";
        }
    }else if(reportType == "seasonReport"){
        //季报
        var checkLength = $("#timeDiv").find("input[id^='time-season']:checked").length;
        if(checkLength > 0 ){
            var id =  $("#timeDiv").find("input[id^='time-season']:checked:last").attr("id");
            maxTime = $("#timeDiv").find("input[id^='time-season']:checked:last").next().html();
        }
    }else if(reportType == "monthReport"){
        //月报
        var checkLength = $("#timeDiv").find("input[id^='time-month']:checked").length;
        if(checkLength > 0){
            var id = $("#timeDiv").find("input[id^='time-month']:checked:last").attr("id");
            maxTime = $("#timeDiv").find("input[id^='time-month']:checked:last").next().html();
        }
    }
    //设置导出报表名称
    if(selectYearNameArr.length > 0 && !!selectYearNameArr[0] && maxTime != "") {
        $("#resultReportName").html(selectYearNameArr[0] + maxTime);
    }
}
/**
 * 生成比较日期
 */
function generateCompareDate(){
    var selectYearIdArr = [];
    var selectYearNameArr = [];
    $("#yearDiv").find("input[name='year']:checked").each(function(){
        selectYearIdArr.push($(this).val());
        selectYearNameArr.push($(this).next().html());
    });
    //只有选了多个年份，才会有比较数据
    if(selectYearIdArr.length > 1) {
        var reportType = $("select[name='reportType']").val();
        if (reportType == "yearReport") {
            if($("#timeDiv").find("#time-yearend").is(':checked')) {
                //年报
                var html = "";
                for (var i = 0; i < selectYearIdArr.length; i++) {
                    html += "<option value='"+selectYearIdArr[i]+"-yearend'>"+selectYearNameArr[i]+"年终</option>";
                }
                $("#compareTimeSelect").html(html);
            }else{
                $("#compareTimeSelect").html("");
            }
        } else if (reportType == "halfYearReport") {
            //半年报
            var arr = $("#timeDiv").find("input[id^='time']:checked");
            if (arr.length > 0) {
                var html = "";
                for (var i = 0; i < selectYearIdArr.length; i++) {
                    for(var j = 0 ;j < arr.length ; j++){
                        html += "<option value='"+selectYearIdArr[i]+"-"+arr[j].value+"'>"+selectYearNameArr[i]+$(arr[j]).next().html()+"</option>";
                    }
                }
                $("#compareTimeSelect").html(html);
            } else {
                $("#compareTimeSelect").html("");
            }
        } else if (reportType == "seasonReport") {
            //季报
            var arr = $("#timeDiv").find("input[id^='time']:checked");
            if (arr.length > 0) {
                var html = "";
                for (var i = 0; i < selectYearIdArr.length; i++) {
                    for(var j = 0 ;j < arr.length ; j++){
                        html += "<option value='"+selectYearIdArr[i]+"-"+arr[j].value+"'>"+selectYearNameArr[i]+$(arr[j]).next().html()+"</option>";
                    }
                }
                $("#compareTimeSelect").html(html);
            } else {
                $("#compareTimeSelect").html("");
            }
        } else if (reportType == "monthReport") {
            //月报
            var arr = $("#timeDiv").find("input[id^='time']:checked");
            if (arr.length > 0) {
                var html = "";
                for (var i = 0; i < selectYearIdArr.length; i++) {
                    for(var j = 0 ;j < arr.length ; j++){
                        html += "<option value='"+selectYearIdArr[i]+"-"+arr[j].value+"'>"+selectYearNameArr[i]+$(arr[j]).next().html()+"</option>";
                    }
                }
                $("#compareTimeSelect").html(html);
            } else {
                $("#compareTimeSelect").html("");
            }
        }
        if($("#compareTimeSelect option").length > 0) {
            //移除标题的那个最大比较时间
            var title = $("#resultReportName").html();
            $("#compareTimeSelect option").each(function(){
                if(title  == $(this).html()){
                    $(this).remove();
                }
            });

        }
    }else{
        $("#compareTimeSelect").html("");
    }

}
/**
 * 一键增加比较时间
 */
function addCompareTime(){
    generateTitle();
    generateCompareDate();
}
/**
 * 移除比较时间
 */
function removeCompareTime(){
    $("#compareTimeSelect option:selected").each(function(){
         $(this).remove();
    });
    generateTitle();
}

/**
 * 导出校验
 */
function reportCheck(){
    var selectTimeLength = $("#timeDiv").find("input[name='time']:checked").length;
    var selectYearLength = $("#yearDiv").find("input[name='year']:checked").length;
    if(selectYearLength == 0){
        alert("请先选择分析年份！");
        return false;
    }
    if(selectTimeLength == 0 ){
        alert("请先选择分析时间！");
        return false;
    }
    if(selectYearLength == 1){
        alert("请先选择比较时间！");
        return false;
    }
    return true;
}

/**
 * 导出
 */
function report(reportName){
    if(!reportCheck()){
        return false;
    }

}
</script>

</@ui.layout>