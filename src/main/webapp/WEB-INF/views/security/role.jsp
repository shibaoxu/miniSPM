<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-2-10
  Time: 上午9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/dialog/user_dialog.jsp" %>
<%@ include file="/WEB-INF/views/dialog/permission_dialog.jsp" %>
<form:form commandName="role">
    <fieldset>
        <legend><i class="icon-user-md"></i>角色:${role.description}</legend>
        <div class="alert hide">
            <i class="icon-bell"></i>&nbsp<strong>提示:</strong> 保存成功。
        </div>
        <label>名称</label>
        <form:input id='role_name' path="name"></form:input>
        <label>描述</label>
        <form:input id='role_description' path="description"></form:input>

        <form:hidden id='role_id' path="id"></form:hidden>
    </fieldset>
    <div class="row-fluid">
        <div class="span6 row-fluid">
            <fieldset>
                <legend><i class="icon-user"></i>用户维护</legend>
                <table id="users" class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                    <tr>
                        <td class="hide"></td>
                        <td>工号</td>
                        <td>姓名</td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${role.users}" var="user">
                        <tr>
                            <td class="hide">${user.id}</td>
                            <td>${user.jobNumber}</td>
                            <td>${user.name}</td>
                            <td><a href="#" class="btn btn-small">移除</a></td>
                        </tr>
                    </c:forEach>
                    <tr>

                    </tr>
                    </tbody>
                </table>
            </fieldset>
            <button class="btn" data-toggle="modal" href="#user_dialog" data-keyboard="true">增加用户</button>
        </div>
        <div class="span6 row-fluid">
            <fieldset>
                <legend><i class="icon-ok-circle"></i>权限维护</legend>
                <table id="permissions" class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                    <tr>
                        <td class="hide"></td>
                        <td>对象</td>
                        <td>操作</td>
                        <td>范围</td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${role.permissions}" var="permission">
                        <tr>
                            <td class="hide">${permission.id}</td>
                            <td>${permission.operation.domain.detail}</td>
                            <td>${permission.operation.brief}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${permission.scope=='SELFANDLOW'}">自己及下属员工</c:when>
                                    <c:when test="${permission.scope=='BELONGANDLOW'}">本部门及下级部门</c:when>
                                    <c:when test="${permission.scope=='SELF'}">自己</c:when>
                                    <c:when test="${permission.scope=='BELONG'}">本单位</c:when>
                                    <c:when test="${permission.scope=='WHOLE'}">全部</c:when>
                                </c:choose>
                            </td>
                            <td><a href="#" class="btn btn-small">移除</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button class="btn" data-toggle="modal" href="#permission_dialog" data-keyboard="true">增加权限</button>
            </fieldset>
        </div>
    </div>

    <div class="form-actions">
        <a id="role_ok" href="#" class="btn btn-primary">应用</a>
        <a href="${ctx}/security/role/index" class="btn">返回</a>
    </div>
</form:form>

<script type="text/javascript">
    $('#user_dialog_ok').click(function () {
        var existIds = $('table#users tbody td:first-child').map(function (index) {
            return $(this).html();
        });

        $('#userList tbody tr').each(function (index) {
            var tds = $(this).find("td");
            var checkFlag = $(tds).find("input[type=checkbox]");
            if ($(checkFlag).attr('checked') == 'checked') {
                var id = $(checkFlag).attr('userId')
                if ($.inArray(id, existIds) == -1) {
                    var htmlString = "<tr><td class='hide'>" + id + "</td><td>" + $(tds).eq(1).html() + "</td><td>" + $(tds).eq(2).html() + "</td><td><a href='#' class='btn btn-small'>移除</a></td></tr>"
                    $('table#users tbody').append($(htmlString));
                }
            }
        });
        $('#user_dialog').modal('toggle');
    });

    $('table a.btn').live('click', function () {
        $(this).parent().parent().remove();
    })

    $('#permission_dialog_ok').click(function () {
        var existIds = $('table#permissions tbody td:first-child').map(function (index) {
            return $(this).html();
        });

        $('#permissionList tbody tr').each(function (index) {
            var tds = $(this).find("td");
            var checkFlag = $(tds).find("input[type=checkbox]");
            if ($(checkFlag).attr('checked') == 'checked') {
                var id = $(checkFlag).attr('permissionId')
                if ($.inArray(id, existIds) == -1) {
                    var htmlString = "<tr><td class='hide'>" + id + "</td><td>" + $(tds).eq(1).html() + "</td><td>" + $(tds).eq(2).html() +
                            "</td><td>" + $(tds).eq(3).html() + "</td><td><a href='#' class='btn btn-small'>移除</a></td></tr>"
                    $('table#permissions tbody').append($(htmlString));
                }
            }
        });
        $('#permission_dialog').modal('toggle');

    });

    $('a#role_ok').click(function () {
        var role = {};
        role.id = $('#role_id').val();
        role.name = $('#role_name').val();
        role.description = $('#role_description').val();
        role.users = new Array();
        $("table#users tbody td:first-child").each(function (index) {
            var user = {};
            user.id = $(this).html();
            role.users.push(user);
        });
        role.permissions = new Array();
        $("table#permissions tbody td:first-child").each(function (index) {
            role.permissions.push({id: $(this).html()});
        });

        var url = '${ctx}/security/role/edit/${role.id}';
        $.ajax({
            contentType: "application/json",
            url: url,
            data: JSON.stringify(role),
            type: 'post',
            success: function () {
                $('div.alert').show();
            }
        });
    });
</script>