<@ui.layout >
<!-- magic-check -->
<link rel="stylesheet" href="${request.contextPath}/static/magic-check/magic-check.css" type="text/css">
<style>
    .field-name{
        text-align: right;
        height:50px;
        width:20%;
        padding:10px;
    }
    .field-value{
        text-align:left;
        height:50px;
        padding:10px;
    }
    table{
        border-right:1px solid #ccc;
        border-bottom:1px solid #ccc;
    }
    table td{
        border-left:1px solid #ccc;
        border-top:1px solid #ccc;
    }
</style>
<div class="panel panel-default " style="width:800px;margin:50px auto;">
    <div class="panel-body" >
        <table style="width: 100%;text-align: center;">
            <tr>
                <td class="field-name">
                   上传类型
                </td>
                <td class="field-value">
                    <div class="opt" style="float:left;margin-right:20px;">
                        <input class="magic-radio" type="radio" name="radio" id="r1" value="option1" checked="checked"/>
                        <label for="r1">《商票合格承兑人推荐/申请表》</label>
                    </div>
                    <div class="opt" style="float:left;margin-right:20px;">
                        <input class="magic-radio" type="radio" name="radio" id="r2" value="option1" />
                        <label for="r2">《票信额度申请材料》</label>
                    </div>
                    <div class="opt" style="float:left;">
                        <input class="magic-radio" type="radio" name="radio" id="r3" value="option1" />
                        <label for="r3">《近3年6期报表》</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="field-name">
                    选择文件
                </td>
                <td class="field-value">
                    <label class="ace-file-input" style="width:300px;">
                        <input type="file" id="id-input-file-1">
                        <span class="ace-file-container" data-title="选择">
                            <span class="ace-file-name" data-title="还未选择文件...">
                                <i class=" ace-icon fa fa-upload"></i>
                            </span>
                        </span>
                        <a class="remove" href="#">
                            <i class=" ace-icon fa fa-times"></i>
                        </a>
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;" class="field-value">
                    <button type="button" class="btn btn-white btn-primary">
                        <i class="ace-icon fa fa-cloud-upload"></i>
                        确认申报
                    </button>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="field-value">
                    <div class="alert alert-block alert-success">
                        <button type="button" class="close" data-dismiss="alert">
                            <i class="ace-icon fa fa-times"></i>
                        </button>
                        <p>
                            <strong>
                                <i class="ace-icon fa fa-check"></i>
                                申报成功!
                            </strong>
                            同意录入合格承兑人名录
                        </p>
                        <p>
                            <button class="btn btn-sm btn-success">查看审核详情</button>
                        </p>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
<script>
$(function () {
    $('#id-input-file-1').ace_file_input({
        no_file:'No File ...',
        btn_choose:'Choose',
        btn_change:'Change',
        droppable:false,
        onchange:null,
        thumbnail:false //| true | large
        //whitelist:'gif|png|jpg|jpeg'
        //blacklist:'exe|php'
        //onchange:''
        //
    });

});
</script>
</@ui.layout>