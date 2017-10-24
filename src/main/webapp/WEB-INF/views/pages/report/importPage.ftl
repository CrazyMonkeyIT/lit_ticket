<@ui.layout >
<!-- magic-check -->
<link rel="stylesheet" href="${request.contextPath}/static/magic-check/magic-check.css" type="text/css">
<style>

</style>
<div class="col-xs-12 no-padding no-margin">
    <!-- 客户列表 -->
    <#include  "../../macro/leftCustList.ftl" />
    <div class="col-xs-12 col-sm-10 no-padding-right">
        <div class="panel panel-default ">
            <div class="panel-body" style="height:65px">
                <table style="width: 100%;text-align: center;">
                    <tr>
                        <td style="width:33%;">
                            报表模板：
                            <select style="width:150px;">
                                <option>国开行报表模板</option>
                                <option>国资委版</option>
                                <option>新会计准则</option>
                            </select>
                        </td>
                        <td style="width:33%;">
                            表类型：
                            <select style="width:150px;">
                                <option>资产负债表</option>
                                <option>利润表</option>
                                <option>现金流量表</option>
                            </select>
                        </td>
                        <td style="width:33%;">
                            货币单位:
                            <select style="width:150px;">
                                <option>元</option>
                                <option>千元</option>
                                <option>万元</option>
                                <option>亿</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="col-xs-12 no-padding no-margin" style="">
            <div class="col-xs-4 no-margin no-padding">
                <!-- 上传文件域begin -->
                <label class="ace-file-input ace-file-multiple">
                    <input multiple="" type="file" id="id-input-file">

                </label>
                <!-- 上传文件域end -->
            </div>
            <div class="col-xs-8 no-margin">
                <!-- 文件页begin -->
                <div class="opt" style="float:left;margin:15px 20px 0px 0px;">
                    <input class="magic-checkbox" type="checkbox" name="year" value="" id="checkbox1">
                    <label for="checkbox1">模糊匹配</label>
                </div>
                <div style="float:left;margin-top:12px;">
                    <button class="btn btn-sm btn-white btn-info btn-bold">
                        <i class="ace-icon fa fa-floppy-o bigger-120 blue"></i>
                        导入
                    </button>
                </div>
                <!-- 文件页end -->
            </div>
        </div>
        <div class="col-xs-12 no-padding no-margin" style="">
            <div class="tabbable">
                <ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab4">
                    <li class="active">
                        <a data-toggle="tab" href="#home4" aria-expanded="true">Home</a>
                    </li>
                    <li class="">
                        <a data-toggle="tab" href="#profile4" aria-expanded="false">Profile</a>
                    </li>
                    <li class="">
                        <a data-toggle="tab" href="#dropdown14" aria-expanded="false">More</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="home4" class="tab-pane active">
                        <p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
                    </div>
                    <div id="profile4" class="tab-pane">
                        <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
                    </div>
                    <div id="dropdown14" class="tab-pane">
                        <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$(function () {
    $('#id-input-file').ace_file_input({
        style: 'well',
        btn_choose: '上传数据文件',
        btn_change: null,
        no_icon: '',
        droppable: true,
        thumbnail: 'small',//large | fit
        allowExt: ['xls','xlsx'],
        preview_error : function(filename, error_code) {

        }
    }).on('change', function(){
        var file = $("input[id='id-input-file']")[0].files[0];
        var formData = new FormData();
        formData.append("file",file);
        $.ajax({
            url: basePath+"/report/uploadFile.html",
            type:"post",
            data:formData,
            processData: false,
            contentType: false,
            success:function(data){
                 console.log(data);
            }
        });
    });
});
</script>
</@ui.layout>