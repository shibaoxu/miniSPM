<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-27
  Time: 下午7:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="modal hide" id="permission_dialog">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">x</a>
        <h4>请选择权限</h4>
    </div>
    <%--<div class="controls-row">--%>
        <%--<input id='permission_dialog_condition' type="text" placeholder="请输入工号或姓名..." autofocus="autofocus" class="input-medium search-query">--%>
        <%--<button id='permission_dialog_search' class="btn">搜索</button>--%>
    <%--</div>--%>

    <div class="controls-row" style="height:300px;overflow-y: scroll">
        <table id="permissionList" class="table table-striped table-bordered table-hover table-condensed">
            <thead>
                <tr>
                    <td></td>
                    <td>对象</td>
                    <td>操作</td>
                    <td>范围</td>
                </tr>
            </thead>
            <tbody >
            </tbody>
        </table>

    </div>

    <div class="modal-footer">
        <button id='permission_dialog_ok' class="btn btn-primary">确定</button>
        <button id='permission_dialog_close' class="btn">关闭</button>
    </div>
</div>
<script type="text/javascript">
    $('#permission_dialog').on('show', function () {
        $('#permissionList tbody').html('');
        $.getJSON('${ctx}/security/permission/index', function(data){
            $.each(data, function(index, item){
                $("<tr><td><input type='checkbox' permissionId=" + item.id + "></td><td>" + item.operation.domain.detail + "</td><td>" + item.operation.brief + "</td><td>" + transScope(item.scope) + "</td></tr>").appendTo($('#permissionList tbody'));
            })
        });
    });

    $('#permission_dialog_search').click(function(){
        $.getJSON('${ctx}/sale/permission?condition=' + $('#permission_dialog_condition').val(), function(data){
            $('#permission_list option').each(function(){
                $(this).remove();
            });
            $.each(data, function(index, item){
                $("<option value = '" + item.id + "'>" + item.name + "</option>").appendTo($('#permission_list'));
            })
        });
    });

    $('#permission_dialog_close').click(function(){
        $('#permission_dialog').modal('toggle');
    });

    function transScope(code){
        if(code == 'SELF'){
            return '自己';
        }else if(code == 'BELONGANDLOW'){
            return '本部门及下级部门';
        }else if(code == 'BELONG'){
            return '本部门';
        }else if(code == 'SELFANDLOW'){
            return '自己及下属员工';
        }else if(code == 'WHOLE'){
            return '全部';
        }else{
            return 'ERROR';
        }
    }

</script>