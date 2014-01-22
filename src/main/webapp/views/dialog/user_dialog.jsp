<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-27
  Time: 下午7:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="modal" id="uDialog" role='dialog' tabindex="-1" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">请选择用户</h4>
            </div>
            <div class="modal-body">
                <div>
                    <form class="form-horizontal" action="#">
                        <div class="form-group">
                            <input type="hidden" id= "uDialog_role_id">
                            <div class="input-group col-lg-6">
                                <input type="text" class="form-control" id='uDialog_condition'
                                       placeholder="请输入工号或姓名...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" id="uDialog_search"><span
                                            class="icon-search"/></button>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="pre-scrollable">
                    <table id="userList" class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                        <tr>
                            <td></td>
                            <td>工号</td>
                            <td>姓名</td>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button id='uDialog_ok' class="btn btn-primary">确定</button>
                <button id='uDialog_cancel' class="btn">取消</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    require(['jquery','admin/user_dialog'], function($, dialogController){
        $('#uDialog_search').click(function(){
            var condition = $('#uDialog_condition').val();
            dialogController.search(condition);
            return false;
        });
        $('#uDialog_ok').on('click', dialogController.ok);
        $('#uDialog_cancel').on('click', dialogController.close)
    });
</script>

