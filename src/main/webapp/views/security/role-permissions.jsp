<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-8-22
  Time: 下午9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@include file="../dialog/permission_dialog.jsp" %>

<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/security/role/index">角色管理</a></li>
    <li><a href="${ctx}/security/role/${role.id}/edit">${role.name}</a></li>
    <li><a href="${ctx}/security/role/${role.id}/permissions">权限管理</a></li>
</ol>
<div class="row">
    <div class="col-lg-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h6 class="panel-title">已分配权限</h6>
            </div>
            <div class="panel-body">
                <label class="">对象</label>
                <select id='domain' style="font-size: 14px">
                    <c:forEach items="${domains}" var="domain">
                        <option value="${domain.id}">${domain.detail}</option>
                    </c:forEach>
                </select>
                <table id='permission-list' class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                        <tr>
                            <td>操作</td>
                            <td>范围</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>

    </div>

    <div class="col-lg-6">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h6 class="panel-title">全部权限</h6>
            </div>
            <div class="panel-body">
                <table id='operation-list' class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                        <tr>
                            <td>名称</td>
                            <td>简述</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    require(['admin/permission'], function(pManager){
        //初始化页面数据
        pManager.loadOperationByDomainId($('#domain').val());
        pManager.loadPermissionByRoleIdAndDomainId("${role.id}", $('#domain').val(), "${ctx}");

        //event:对象变化事件
        $('#domain').change(function(){
            pManager.loadPermissionByRoleIdAndDomainId("${role.id}",$(this).val(), "${ctx}");
            pManager.loadOperationByDomainId($('#domain').val(), "${ctx}");
        });

        //event:从角色删除权限
        $('#permission-list').on('click','span.icon-remove-circle', function(){
            var permission = $(this).closest('tr');
            var permissionId = $(permission).children(':first-child').attr('permission-id');
            pManager.removePermissionFromRole("${role.id}", permissionId, "${ctx}");
            $(permission).remove();
        });

        //event:显示增加权限对话框
        $('#operation-list').on('click', 'span.icon-arrow-left', function(){
            var operation = $(this).closest('tr');
            var operationId = $($(operation).children()[0]).attr('operation-id');
            var operationName = $($(operation).children()[1]).text();
            pManager.dialog.init('${role.id}', $('#domain').val(), $('#domain').find("option:selected").text(), operationId, operationName)
            $('#pDialog').modal('show');
        });

        //event:对话框‘增加权限’-click
        $('#pDialog').on('click', '#ok', pManager.dialog.OK);

    });

</script>


