<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-10-16
  Time: 下午8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%@include file="../dialog/user_dialog.jsp"%>
<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/security/role/index">角色</a></li>
    <li><a href="${ctx}/security/role/${role.id}/edit">${role.name}</a></li>
    <li><a href="">管理用户</a></li>

</ol>
<div>
    <table id='users-of-role' class="table table-striped table-condensed table-hover table-bordered">
        <thead>
            <tr>
                <td>用户</td>
                <td>员工</td>
                <td></td>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${role.users}" var="user">
                <tr>
                    <td user-id=${user.id}>${user.loginName}</td>
                    <td>${user.staff.name}</td>
                    <td class='text-center'><span style='cursor:pointer' class='icon-remove-circle'/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<div>
    <button class="btn btn-primary" id='add-user'>增加用户</button>
    <a class="btn btn-default" href="${ctx}/security/role/${role.id}/permissions">管理权限</a>
</div>

<script type="text/javascript">
    require(['admin/role_user'],function(roleUserManager){
        roleUserManager.init("${role.id}");
    });
</script>
