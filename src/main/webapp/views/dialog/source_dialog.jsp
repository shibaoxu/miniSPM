<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-27
  Time: 下午7:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="modal hide" id="source_dialog">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">x</a>
        <h4>请选择客户</h4>
    </div>
    <div class="controls-row">
        <input id='source_dialog_condition' type="text" placeholder="请输入客户名称..." autofocus="autofocus" class="input-medium search-query">
        <button id='source_dialog_search' class="btn">搜索</button>
    </div>

    <div class="controls-row">
        <select id='source_list' multiple="true" class="span12" style="height: 300px">
        </select>
    </div>

    <div class="modal-footer">
        <button id='source_dialog_ok' class="btn btn-primary">确定</button>
        <button id='source_dialog_close' class="btn">关闭</button>
    </div>
</div>
<script type="text/javascript">
    $('#source_dialog').on('show', function () {
        $('#source_list option').each(function(){
            $(this).remove();
        });
        $('#source_dialog_condition').val('');
        $.getJSON('${ctx}/sale/source/index', function(data){
            $.each(data, function(index, item){
                $("<option value = '" + item.id + "'>" + item.name + "</option>").appendTo($('#source_list'));
            })
        });
    });

    $('#source_dialog_ok').click(function(){
        if($('#source_list option:selected').size() == 0){
            alert('请选择一个客户');
        }else{
            $('#source_id').val($('#source_list option:selected').val());
            $('#source_name').val($('#source_list option:selected').text());
            $('#source_dialog').modal('toggle');
        }
    });

    $('#source_dialog_search').click(function(){
        $.getJSON('${ctx}/sale/source?condition=' + $('#source_dialog_condition').val(), function(data){
            $('#source_list option').each(function(){
                $(this).remove();
            });
            $.each(data, function(index, item){
                $("<option value = '" + item.id + "'>" + item.name + "</option>").appendTo($('#source_list'));
            })
        });
    });

    $('#source_dialog_close').click(function(){
        $('#source_dialog').modal('toggle');
    });

</script>