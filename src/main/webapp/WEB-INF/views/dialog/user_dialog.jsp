<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-27
  Time: 下午7:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="modal hide" id="user_dialog">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">x</a>
        <h4>请选择用户</h4>
    </div>
    <div class="controls-row">
        <input id='user_dialog_condition' type="text" placeholder="请输入工号或姓名..." autofocus="autofocus" class="input-medium search-query">
        <button id='user_dialog_search' class="btn">搜索</button>
    </div>

    <div class="controls-row">
        <table id="userList" class="table table-striped table-bordered table-hover table-condensed">
            <thead>
                <tr>
                    <td></td>
                    <td>工号</td>
                    <td>姓名</td>
                </tr>
            </thead>
            <tbody >
            </tbody>
        </table>

    </div>

    <div class="modal-footer">
        <button id='user_dialog_ok' class="btn btn-primary">确定</button>
        <button id='user_dialog_close' class="btn">关闭</button>
    </div>
</div>
<script type="text/javascript">
    $('#user_dialog').on('show', function () {
        $('#userList tbody').html('');
        $.getJSON('${ctx}/security/user/index', function(data){
            $.each(data, function(index, item){
                $("<tr><td><input type='checkbox' userId=" + item.id + "></td><td>" + item.jobNumber + "</td><td>" + item.name + "</td></tr>").appendTo($('#userList tbody'));
            })
        });
    });

//    $('#user_dialog_ok').click(function(){
////        if($('#user_list option:selected').size() == 0){
////            alert('请选择一个客户');
////        }else{
////            $('#user_id').val($('#user_list option:selected').val());
////            $('#user_name').val($('#user_list option:selected').text());
////            $('#user_dialog').modal('toggle');
////            $('#user_name').trigger("focusout");
////        }
//    });

    $('#user_dialog_search').click(function(){
        $.getJSON('${ctx}/sale/user?condition=' + $('#user_dialog_condition').val(), function(data){
            $('#user_list option').each(function(){
                $(this).remove();
            });
            $.each(data, function(index, item){
                $("<option value = '" + item.id + "'>" + item.name + "</option>").appendTo($('#user_list'));
            })
        });
    });

    $('#user_dialog_close').click(function(){
        $('#user_dialog').modal('toggle');
    });

</script>