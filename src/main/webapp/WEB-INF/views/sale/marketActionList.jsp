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
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
</head>
<body>
<h3><i class="icon-bullhorn"></i>&nbsp市场活动</h3>
<div class="row-fluid">
    <form class="form-search" action="#">
        <input type="text" class="search-query input-large" name="search_condition" placeholder="请输入简述..." value="${param.search_condition}">
        <button type="submit" class="btn" id="search_btn">搜索</button>
    </form>
</div>
<table class="table table-striped table-bordered table-hover table-condensed">
    <thead>
    <tr>
        <td>类型</td>
        <td>简述</td>
        <td>客户</td>
        <td>时间</td>
        <td>所有者</td>
        <td>所属部门</td>
        <td></td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${marketActions.content}" var="action">
        <tr <c:if test="${action.important}">class='success'</c:if>>
            <td>
                <c:choose>
                <c:when test="${action.actionType.id=='telephone'}"><i class="icon-phone"></c:when>
                <c:when test="${action.actionType.id=='visit'}"><i class="icon-plane"></c:when>
                    <c:when test="${action.actionType.id=='mail'}"><i class="icon-envelope"></c:when>
                        <c:when test="${action.actionType.id=='meeting'}"><i class="icon-group"></c:when>
                            <c:when test="${action.actionType.id=='message'}"><i class="icon-facebook-sign"></c:when>
                                <c:otherwise><i class="icon-question-sign"></c:otherwise>
                                    </c:choose>
            </td>
            <td><a href="${ctx}/sale/market_action/view/${action.id}">${action.brief}</a>
            </td>
            </td>
            <td>${action.customer.name}
            </td>
            <td><fmt:formatDate value="${action.eventDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
            <td>${action.owner.name}</td>
            <td>${action.department.name}</td>
            <td>
                <div class="btn-group">
                    <button class="btn btn-mini">操作</button>
                    <button class="btn btn btn-mini dropdown-toggle" data-toggle="dropdown">
                        &nbsp<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="${ctx}/sale/market_action/view/${action.id}"><i class="icon-eye-close"></i>查看详情</a></li>
                        <li><a href="${ctx}/sale/market_action/edit/${action.id}"><i class="icon-edit"></i>修改</a></li>
                        <%--<li><a href="${ctx}/sale/market_action/remove/${action.id}"><i class="icon-remove"></i>删除</a>--%>
                        </li>
                    </ul>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<tags:pagination page="${marketActions}"></tags:pagination>
<shiro:hasPermission name="market_action:create:self">
    <div class="row-fluid">
        <div class="span6">
            <a class="btn" href="${ctx}/sale/market_action/new"><i class="icon-plus"></i>增加市场活动</a>
        </div>
    </div>
</shiro:hasPermission>
</body>
</html>

