<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-30
  Time: 下午9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
</head>
<body>
<h3><i class="icon-user-md"></i>&nbsp角色</h3>
<table class="table table-striped table-bordered table-hover table-condensed">
    <thead>
    <tr>
        <td>名称</td>
        <td>简述</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${roles}" var="role">
        <tr>
            <td>
                    ${role.name}
            </td>
            <td><a href="${ctx}/security/role/edit/${role.id}">${role.description}</a>
            </td>
            <td>
                <div class="btn-group">
                    <button class="btn btn-mini">操作</button>
                    <button class="btn btn btn-mini dropdown-toggle" data-toggle="dropdown">
                        &nbsp<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="${ctx}/security/role/edit/${role.id}"><i class="icon-edit"></i>修改</a></li>
                        <li><a href="${ctx}/security/edit-user/${role.id}"><i class="icon-user"></i>修改所属用户</a></li>
                        <li><a href="${ctx}/security/edit-permission/${role.id}"><i class="icon-ok-circle"></i>修改权限</a>
                        </li>
                    </ul>
                </div>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--<div class="row-fluid">--%>
    <%--<div class="span6">--%>
        <%--<a class="btn" href="${ctx}/security/role/new"><i class="icon-plus"></i>增加新角色</a>--%>
    <%--</div>--%>
<%--</div>--%>

</body>
</html>