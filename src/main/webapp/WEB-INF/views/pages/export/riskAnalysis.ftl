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
<div style="width:250px;min-height:447px;float:left;">
    <h4 class="header smaller lighter blue"><i class="ace-icon fa fa-users"></i>&nbsp;客户列表</h4>
    <ul id="menu" style="height:100%;width: 97%;" class="ui-menu ui-widget ui-widget-content" role="menu" tabindex="0" aria-activedescendant="ui-id-4">
        <li class="ui-menu-item ui-state-focus" id="ui-id-4" tabindex="-1" role="menuitem">客户1<i class="ace-icon glyphicon glyphicon-ok right" ></i></li>
        <li class="ui-menu-item" id="ui-id-5" tabindex="-1" role="menuitem">客户1</li>
        <li class="ui-menu-item" id="ui-id-6" tabindex="-1" role="menuitem">客户1</li>
        <li class="ui-menu-item" id="ui-id-11" tabindex="-1" role="menuitem">客户1</li>
    </ul>
</div>
<div class="widget-box" style="width:809px;height:447px;float:left;margin-left: 20px;">
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
                            <select style="width:150px;">
                                <option>年报</option>
                                <option>半年报</option>
                                <option>季报</option>
                                <option>月报</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="filed-name"  valign="top">年份：</td>
                        <td class="filed-value" valign="top">
                            <div class="well"  style="height:100px;width:150px;padding:5px;margin:0px;overflow-y:auto; ">
                                <div class="opt">
                                    <input class="magic-checkbox" type="checkbox" name="layout" id="year-2017">
                                    <label for="year-2017">2017年</label>
                                </div>
                                <div class="opt">
                                    <input class="magic-checkbox" type="checkbox" name="layout" id="year-2016">
                                    <label for="year-2016">2016年</label>
                                </div>
                                <div class="opt">
                                    <input class="magic-checkbox" type="checkbox" name="layout" id="year-2015">
                                    <label for="year-2015">2015年</label>
                                </div>
                                <div class="opt">
                                    <input class="magic-checkbox" type="checkbox" name="layout" id="year-2014">
                                    <label for="year-2014">2014年</label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="filed-name"  valign="top">时间：</td>
                        <td class="filed-value" valign="top">
                            <div class="well"  style="height:200px;width:150px;padding:5px;margin:0px;overflow-y:auto;">
                                <div class="opt">
                                    <input class="magic-checkbox" type="checkbox" name="layout" id="time-0">
                                    <label for="time-0">年终</label>
                                </div>
                                <div class="opt">
                                    <input class="magic-checkbox" type="checkbox" name="layout" id="time-2016">
                                    <label for="time-2016">2016年</label>
                                </div>
                                <div class="opt">
                                    <input class="magic-checkbox" type="checkbox" name="layout" id="time-2015">
                                    <label for="time-2015">2015年</label>
                                </div>
                                <div class="opt">
                                    <input class="magic-checkbox" type="checkbox" name="layout" id="time-2014">
                                    <label for="time-2014">2014年</label>
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
                            <div style="height:28px;margin:0px;" class="green"><b>2017年度报告</b></div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:118px;text-align: center;">
                            <button type="button" class="btn moveall btn-white btn-bold btn-info" style="width:60px;" title="添加">
                                <i class="fa fa-arrow-right"></i>
                                <i class="fa fa-arrow-right"></i>
                            </button>
                            <button type="button" class="btn removeall btn-white btn-bold btn-info" title="移除" style="width:60px;margin-top: 10px;">
                                <i class="fa fa-arrow-left"></i>
                                <i class="fa fa-arrow-left"></i>
                            </button>
                        </td>
                        <td class="filed-value">
                            比较时间<br/>
                            <select class="form-control" multiple="multiple" style="height:248px;width:150px;padding:5px;margin:0px;">
                                <option value="AL">2017年</option>
                                <option value="AK">2016年</option>
                                <option value="AZ">2015年</option>
                                <option value="AR">2014年</option>
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
                                        <a href="#">贷款建议</a>
                                    </li>
                                    <li>
                                        <a href="#">风险分析详细报告</a>
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
</@ui.layout>