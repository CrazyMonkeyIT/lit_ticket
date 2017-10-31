<@ui.layout >
<div class="col-xs-12 no-padding no-margin">
    <!-- 客户列表 -->
    <#include  "../../macro/leftCustList.ftl" />
    <div class="col-xs-12 col-sm-10 no-padding-right">
        <div class="panel panel-default ">
            <div class="panel-body" style="height:60px">
                <table style="width: 100%;text-align: center;">
                    <tr>
                        <td style="width:25%;">
                            年份：
                            <select name="year" style="min-width:100px;">
                                <option>2015年</option>
                            </select>
                        </td>
                        <td style="width:25%;">
                            报表类型：
                            <select name="reportType" style="min-width:100px;">
                                <option value="yearReport">年报</option>
                                <option value="halfYearReport">半年报</option>
                                <option value="seasonReport">季报</option>
                                <option value="monthReport">月报</option>
                            </select>
                        </td>
                        <td style="width:25%;">
                            时间：
                            <select name="time" style="min-width:100px;">
                                <option value="yearend">年终</option>
                            </select>
                        </td>
                        <td style="width:25%;">
                            单位:
                            <select name="company" style="min-width:100px;">
                                <option value="0">元</option>
                                <option value="1">千元</option>
                                <option value="2">万元</option>
                                <option value="3">亿</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="col-xs-3"><span class="green middle bolder">企业名称：<span id="enterpriseName"></span> &nbsp;</span></div>
        <div class="col-xs-3"><span class="green middle bolder">评价时期：<span id="evaluateDate"></span></span></div>
        <table class="table table-bordered center" >
            <thead class="thin-border-bottom">
                <tr>
                    <th class="center">
                        <i class="ace-icon fa fa-caret-right blue"></i>项目名称
                    </th>
                    <th class="center">
                        <i class="ace-icon fa fa-caret-right blue"></i>N年
                    </th>
                    <th class="center">
                        <i class="ace-icon fa fa-caret-right blue"></i>（N-1）年
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>营运资金</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>营业周转次数</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>潜在现金收入</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>潜在现金支出</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>DRL</td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="profile-user-info no-padding no-margin">
            <style>
                .profile-user-info{
                    font-size:12px;
                }
                .profile-info-name{
                    width:60px;
                }

            </style>
            <div class="profile-info-row">
                <div class="profile-info-name ">说明：</div>
                <div class="profile-info-value">
                    <span>
                        <i class="ace-icon fa fa-caret-right blue"></i>
                        当潜在现金收入>0且潜在现金支出>0，如果DRL<1，则该企业存在“黑色破产”风险；如果DRL>=1则该企业不存在“黑色破产”风险。
                    </span>
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name"></div>
                <div class="profile-info-value">
                    <span>
                        <i class="ace-icon fa fa-caret-right blue"></i>
                        当潜在现金收入<0且潜在现金支出<0，如果DRL<1，则该企业不存在“黑色破产”风险；如果DRL>=1则该企业存在“黑色破产”风险。
                    </span>
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name"></div>
                <div class="profile-info-value">
                    <span>
                        <i class="ace-icon fa fa-caret-right blue"></i>
                        当潜在现金收入<0且潜在现金支出>0，则该企业存在“黑色破产”风险。
                    </span>
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name"></div>
                <div class="profile-info-value">
                    <span>
                        <i class="ace-icon fa fa-caret-right blue"></i>
                        当潜在现金收入>0且潜在现金支出<0，则该企业不存在“黑色破产”风险。
                    </span>
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name">其中：</div>
                <div class="profile-info-value">
                    <span>
                        <i class="ace-icon fa fa-caret-right blue"></i>
                        DRL=潜在现金收入/潜在现金支出
                    </span>
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name"></div>
                <div class="profile-info-value">
                    <span>
                        <i class="ace-icon fa fa-caret-right blue"></i>
                        潜在现金收入=期初营运资金+营业周转次数×以售价计算的存货
                    </span>
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name"></div>
                <div class="profile-info-value">
                    <span>
                        <i class="ace-icon fa fa-caret-right blue"></i>
                        营运资金=流动资产合计-流动负债合计
                    </span>
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name"></div>
                <div class="profile-info-value">
                    <span>
                        <i class="ace-icon fa fa-caret-right blue"></i>
                        营业周转次数=销售收入/[应收账款+存货×(营业收入/营业成本)]
                    </span>
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name"></div>
                <div class="profile-info-value">
                    <span>
                        <i class="ace-icon fa fa-caret-right blue"></i>
                        以售价计算的存货=存货×(营业收入/营业成本)
                    </span>
                </div>
            </div>
            <div class="profile-info-row">
                <div class="profile-info-name"></div>
                <div class="profile-info-value">
                    <span>
                        <i class="ace-icon fa fa-caret-right blue"></i>
                        潜在现金支出=销售收入-净利润-折旧-（期末营运资金-期初营运资金）
                    </span>
                </div>
            </div>
        </div>
        <div class="row" style="text-align: center;margin-top:20px;">
            <button class="btn btn-white btn-info btn-bold">
                <i class="ace-icon fa fa-search nav-search-icon bigger-120 blue"></i>
                查看
            </button>
            <button class="btn btn-white btn-info btn-bold">
                <i class="ace-icon fa fa-share bigger-120 blue"></i>
                导出wps
            </button>
            <button class="btn btn-white btn-info btn-bold">
                <i class="ace-icon fa fa-share bigger-120 blue"></i>
                导出excel
            </button>
        </div>
    </div>
</div>
<script>
    $(function(){
        /**
         * 切换报表类型
         */
        $("select[name='reportType']").change(function(){
            var reportType = $(this).val();
            var html = "";
            if(reportType == "yearReport"){
                //年报
                html += createSelectHtml("年终","yearend");
            }else if(reportType == "halfYearReport"){
                //半年报
                html += createSelectHtml("上半年","firstHalfYear");
                html += createSelectHtml("下半年","lastHalfYear");
            }else if(reportType == "seasonReport"){
                //季报
                html += createSelectHtml("第一季度","season1");
                html += createSelectHtml("第二季度","season2");
                html += createSelectHtml("第三季度","season3");
                html += createSelectHtml("第四季度","season4");
            }else if(reportType == "monthReport"){
                //月报
                html += createSelectHtml("一月份","month1");
                html += createSelectHtml("二月份","month2");
                html += createSelectHtml("三月份","month3");
                html += createSelectHtml("四月份","month4");
                html += createSelectHtml("五月份","month5");
                html += createSelectHtml("六月份","month6");
                html += createSelectHtml("七月份","month7");
                html += createSelectHtml("八月份","month8");
                html += createSelectHtml("九月份","month9");
                html += createSelectHtml("十月份","month10");
                html += createSelectHtml("十一月份","month11");
                html += createSelectHtml("十二月份","month12");
            }
            $("select[name='time']").html(html);

            changeEvaluateDate();
        });
        /**
         * 获取点击的客户
         */
        $("li[id^='ui-id']").click(function(){
            $("#enterpriseName").html($(this).html());
        });
        if(!!'${selectCustName!""}'){
            $("#enterpriseName").html('${selectCustName!""}');
        }
        $("select[name='year']").change(function(){
            changeEvaluateDate();
        });
        $("select[name='time']").change(function(){
            changeEvaluateDate();
        });
        changeEvaluateDate();
    });
    /** 创建下拉框 **/
    function createSelectHtml(name,value){
        return "<option value='"+value+"'>"+name+"</option>";
    }
    /** 设置评价日期 **/
    function changeEvaluateDate(){
        var year = $("select[name='year']").find("option:selected").text();
        var time = $("select[name='time']").find("option:selected").text();
        $("#evaluateDate").html(year+time);
    }
</script>
</@ui.layout>