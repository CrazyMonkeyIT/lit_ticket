<@ui.layout >
<div class="col-xs-12">
    <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
        <div class="row">
            <form class="form-inline" id="form1" role="form" action="${request.getContextPath()}/" method="post">
                <input id="pageIndex" name="pageIndex" value="" type="hidden" />
                <div class="input-group">
                    <input type="text" name="custName" value="" class="form-control search-query" placeholder="机构名称">
                    <span class="input-group-btn">
                            <button type="submit" class="btn btn-white btn-info">
                                <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                查询
                            </button>
                        </span>
                </div>
                &nbsp;

            </form>
        </div>
        <table id="simple-table" class="table  table-bordered table-hover">
            <thead>
            <tr>
                <th class="center">
                    序号
                </th>
                <th>合作机构名称</th>
                <th>申请材料</th>
                <th>提交时间</th>
                <th>审批状态</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td class="center">
                  1
                </td>
                <td class="center">
                    安阳钢铁
                </td>

                <td>
                    <a href="#">《商票合格承兑人推荐/申请表》</a>
                </td>
                <td>2017-05-12</td>
                <td>
                    <span class="label label-success arrowed">同意录入合格承兑人名录</span>


                </td>
                <td> <a class="btn btn-white btn-sm" href="#"><i class="ace-icon fa fa-search"></i>查看</a>
                    <a class="btn btn-white btn-sm" href="#"><i class="ace-icon fa fa-check"></i>通过</a>
                    <a class="btn btn-white btn-sm" href="#"><i class="ace-icon fa fa-remove"></i>驳回</a>
                </td>
            </tr>
            <tr>
                <td class="center">
                    2
                </td>
                <td class="center">
                    正大企业
                </td>

                <td>
                    <a href="#">《商票合格承兑人推荐/申请表》</a>
                </td>
                <td>2017-05-12</td>
                <td>
                    <span class="label label-success arrowed">同意录入合格承兑人名录</span>


                </td>
                <td> <a class="btn btn-white btn-sm" href="#"><i class="ace-icon fa fa-search"></i>查看</a>
                    <a class="btn btn-white btn-sm" href="#"><i class="ace-icon fa fa-check"></i>通过</a>
                    <a class="btn btn-white btn-sm" href="#"><i class="ace-icon fa fa-remove"></i>驳回</a>
                </td>
            </tr>
            <tr>
                <td class="center">
                    3
                </td>
                <td class="center">
                    卓识物流
                </td>

                <td>
                    <a href="#">《票信额度申请材料》</a>
                </td>
                <td>2017-05-12</td>
                <td>
                    <span class="label label-danger arrowed">不同意录入合格承兑人名录</span>
                </td>
                <td> <a class="btn btn-white btn-sm" href="#"><i class="ace-icon fa fa-search"></i>查看</a>
                    <a class="btn btn-white btn-sm" href="#"><i class="ace-icon fa fa-check"></i>通过</a>
                    <a class="btn btn-white btn-sm" href="#"><i class="ace-icon fa fa-remove"></i>驳回</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</@ui.layout>