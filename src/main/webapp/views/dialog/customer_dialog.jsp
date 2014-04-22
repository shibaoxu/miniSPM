<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-27
  Time: 下午7:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="modal" id="cDialog" role='dialog' tabindex="-1" aria-labelledby="myModalLabel"
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
                        <button id='customer_dialog_search' type="submit" class="btn btn-default"><i
                                class="fa fa-search fa-fw"></i></button>
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
    require(['admin/customerDialog'],function($){

    });
</script>