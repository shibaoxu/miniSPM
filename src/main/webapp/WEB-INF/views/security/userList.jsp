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
<h3><i class="icon-user"></i>所有用户</h3>
<table class="table table-striped table-bordered table-hover table-condensed">
    <thead>
    <tr>
        <td>登录名</td>
        <td>姓名</td>
        <td>状态</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr <c:if test="${action.milestone}">class='success'</c:if>>
            <td>
                ${user.jobNumber}
            </td>
            <td>
                <a href="${ctx}/security/user/${user.id}">${user.name}</a>
            </td>
            <td>${user.status}</td>
            <td></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="row-fluid">
    <div class="span6">
        <a class="btn" href="${ctx}/security/user/new"><i class="icon-plus"></i>增加新用户</a>
    </div>
</div>

</body>
</html>