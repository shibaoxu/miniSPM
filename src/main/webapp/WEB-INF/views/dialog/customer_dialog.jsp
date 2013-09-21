<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-27
  Time: 下午7:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="modal fade" id="customer_dialog" role='dialog' tabindex="-1" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">请选择客户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="#">
                    <div class="form-group">
                        <div class="input-group">
                            <input id='customer_dialog_condition' class="form-control" type="text"
                                   placeholder="请输入客户名称..." autofocus>
                    <span class="input-group-btn">
                        <button id='customer_dialog_search' type="submit" class="btn btn-default"><span
                                class="icon-search"/></button>
                    </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <select id='customer_list' multiple="true" style="height: 200px" class="form-control"> </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button id='customer_dialog_ok' class="btn btn-primary">确定</button>
                <button id='customer_dialog_close' class="btn">关闭</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#customer_dialog').on('show.bs.modal', function () {
        $('#customer_list option').each(function () {
            $(this).remove();
        });
        $('#customer_dialog_condition').val('');
        $.getJSON('${ctx}/sale/customer/index', function (data) {
            $.each(data, function (index, item) {
                $("<option value = '" + item.id + "'>" + item.name + "</option>").appendTo($('#customer_list'));
            })
        });
    });

    $('#customer_dialog_ok').click(function () {
        if ($('#customer_list option:selected').size() == 0) {
            alert('请选择一个客户');
        } else {
            $('#customer_id').val($('#customer_list option:selected').val());
            $('#customer_name').val($('#customer_list option:selected').text());
            $('#customer_dialog').modal('toggle');
            $('#customer_name').trigger("focusout");
        }
    });

    $('#customer_dialog_search').click(function () {
        $.getJSON('${ctx}/sale/customer/index?search_LIKE_name=' + $('#customer_dialog_condition').val(), function (data) {
            $('#customer_list option').each(function () {
                $(this).remove();
            });
            $.each(data, function (index, item) {
                $("<option value = '" + item.id + "'>" + item.name + "</option>").appendTo($('#customer_list'));
            })
        });
    });

    $('#customer_dialog_close').click(function () {
        $('#customer_dialog').modal('toggle');
    });

</script>