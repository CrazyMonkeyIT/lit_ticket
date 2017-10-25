<@ui.layout >
<!-- magic-check -->
<link rel="stylesheet" href="${request.contextPath}/static/magic-check/magic-check.css" type="text/css">

<!-- jqGrid  -->
<link rel="stylesheet" href="${request.contextPath}/static/jqgrid/css/ui.jqgrid.css" />
<!--<link rel="stylesheet" href="${request.contextPath}/static/jqgrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />-->
<script type="text/javascript" src="${request.contextPath}/static/jqgrid/js/jquery.jqGrid.src.js"></script>
<script type="text/javascript" src="${request.contextPath}/static/jqgrid/js/i18n/grid.locale-cn.js"></script>

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
                            <select name="reportTemplate" style="width:150px;">
                                <option value="0">国开行报表模板</option>
                                <option value="1">国资委版</option>
                                <option value="2">新会计准则</option>
                            </select>
                        </td>
                        <td style="width:33%;">
                            表类型：
                            <select name="type" style="width:150px;">
                                <option value="0">资产负债表</option>
                                <option value="1">利润表</option>
                                <option value="2">现金流量表</option>
                            </select>
                        </td>
                        <td name="monetaryUnit" style="width:33%;">
                            货币单位:
                            <select style="width:150px;">
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
        <div class="col-xs-12 no-padding no-margin" style="">
            <div class="col-xs-4 no-margin no-padding">
                <!-- 上传文件域begin -->
                <label class="ace-file-input ace-file-multiple">
                    <input multiple="" type="file" id="id-input-file">

                </label>
                <!-- 上传文件域end -->
            </div>
            <div id="importDiv" class="col-xs-8 no-margin hidden" >
                <!-- 文件页begin -->
                <div class="opt" style="float:left;margin:15px 20px 0px 0px;">
                    <input class="magic-checkbox" type="checkbox" name="year" value="" id="checkbox1">
                    <label for="checkbox1">模糊匹配</label>
                </div>
                <div style="float:left;margin-top:12px;">
                    <button onclick="exportData()" class="btn btn-sm btn-white btn-info btn-bold">
                        <i class="ace-icon fa fa-floppy-o bigger-120 blue"></i>
                        导入
                    </button>
                </div>
                <!-- 文件页end -->
            </div>
        </div>
        <div id="tabsDiv" class="col-xs-12 no-padding no-margin" style="display: none;">
            <div class="tabbable">
                <ul class="nav nav-tabs padding-12 tab-color-blue background-blue">
                    <li class="active">
                        <a id="tab0" style="display:none;" onclick="selectTypeChange(0)" data-toggle="tab" href="#content0" aria-expanded="true"></a>
                    </li>
                    <li class="">
                        <a id="tab1" style="display:none;" onclick="selectTypeChange(1)" data-toggle="tab" href="#content1" aria-expanded="false"></a>
                    </li>
                    <li class="">
                        <a id="tab2" style="display:none;" onclick="selectTypeChange(2)" data-toggle="tab" href="#content2" aria-expanded="false"></a>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div id="content0" class="tab-pane active ">
                        <table id="list0" ></table>
                    </div>
                    <div id="content1" class="tab-pane ">
                        <table id="list1" ></table>
                    </div>
                    <div id="content2" class="tab-pane ">
                        <table id="list2" ></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var jsonData = [
        {
            "type":0,
            "sheetName":"资产负债表",
            "header":[ 'ID','名称', '201703', '201704','201705', '201706' ],
            "names": ["id","name", "201703" ,"201704","201705","201706"],
            "rows":[
                {
                    "id":"1",
                    "name":"张三",
                    "201703":"123",
                    "201704":"123",
                    "201705":"1234",
                    "201706":"123"
                },
                {
                    "id":"2",
                    "name":"李四",
                    "201703":"123",
                    "201704":"123",
                    "201705":"1234",
                    "201706":"123"
                }
            ]
        }
    ];
$(function () {
    $('#id-input-file').ace_file_input({
        style: 'well',
        btn_choose: '上传数据文件',
        btn_change: null,
        showRemove:false,
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
        formData.append("reportTemplate",$("select[name='reportTemplate']").val());
        formData.append("monetaryUnit",$("select[name='monetaryUnit']").val());
        formData.append("type",$("select[name='type']").val());
        //加载中
        loading_begin();
        $.ajax({
            url: basePath+"/report/uploadFile.html",
            type:"post",
            data:formData,
            processData: false,
            contentType: false,
            success:function(data){
                $("#tabsDiv").show();
                $.each(jsonData,function (index,obj) {
                    $("#tab"+obj.type).show();
                    $("#tab"+obj.type).click();
                    initTable(obj);
                });
                $("#tab"+jsonData[0].type).click();
                $("#importDiv").removeClass("hidden");
                //加载完成
                loading_end();
            }
        });
        /** 移除事件 **/
        $(".remove").click(function () {
            $("#tabsDiv").hide();
            $("#importDiv").addClass("hidden");
        });
    });

    $(document).bind('click',function(e){
        if(e.target.tagName != 'TD' && e.target.tagName != 'BUTTON'){
            saveCellEdit("0");
            saveCellEdit("1");
            saveCellEdit("2");
        }
    });


});
    /**
     * 加载jqGrid
     */
    function initTable(data){
        $("#tab"+data.type).html(data.sheetName);
        jQuery("#list"+data.type).jqGrid(
                {
                    colNames : data.header,
                    colModel : generateColModel(data.names),
                    data : data.rows,
                    datatype : "local",
                    height:"100%",
                    autowidth: true,
                    cellEdit:true,
                    cellsubmit: "clientArray",
                    rowNum:1000
                });
    }
    /**
     * 生成colModel
     */
    function generateColModel(colArr){
        var arr = [];
        $.each(colArr,function(index,value){
            if(index == 0){
                arr.push({name : value ,index : value,width : 55,sortable : false,hidden:true});
            }else if(index == 1){
                arr.push({name : value,index : value,align : "center",width : 150,sortable : false});
            }else{
                arr.push({name : value,index : value,width : 80,align : "right",sortable : false,editable:true});
            }
        });
        return arr;
    }
    /**
     * 保存修改
     */
    function saveCellEdit(type){
        $.each($("#list"+type).getRowData(),function(i,o){
            $.each($("#list"+type).jqGrid("getGridParam","colModel"),function(index,obj){
                if(obj.editable){
                    if($("#list"+type).getCell(o.id,index).indexOf('<input') != -1){
                        jQuery("#list"+type).saveCell(o.id,index);
                    }
                }
            });
        });
    }
    /**
     * 导出数据
     */
    function exportData(){
        saveCellEdit("0");
        saveCellEdit("1");
        saveCellEdit("2");

        var resultData = [];
        var data0 = $("#list0").getRowData();
        var data1 = $("#list1").getRowData();
        var data2 = $("#list2").getRowData();
        if(!!data0){
            resultData[0] = {"type":0,"rows":data0};
        }
        if(!!data1 && data1.length > 0 ){
            resultData[1] = {"type":1,"rows":data1};
        }
        if(!!data2 && data2.length > 0){
            resultData[2] = {"type":2,"rows":data2};
        }
        console.log(JSON.stringify(resultData));
    }

    /**
     * 切换表类型
     */
    function selectTypeChange(type){
        $("select[name='type']").val(type);
    }
</script>
</@ui.layout>