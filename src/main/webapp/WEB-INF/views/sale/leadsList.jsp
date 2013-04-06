<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-15
  Time: 下午3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
</head>
<body>
<h3><i class="icon-eye-open"></i>&nbsp销售线索</h3>
<form class="form-search" action="#">
    <input type="text" class="search-query input-large" name="search_condition" placeholder="请输入搜索条件..." value="${param.search_condition}">
    <button type="submit" class="btn" id="search_btn">搜索</button>
</form>

<table class="table table-striped table-bordered table-hover table-condensed">
    <thead>
    <tr>
        <td>简介</td>
        <td>客户</td>
        <td>最近活动</td>
        <td>所有者</td>
        <td>部门</td>
    <%--<td>预估额[低]</td>--%>
        <%--<td>预估额[高]</td>--%>
        <%--<td>成交额</td>--%>
        <%--<td>来源</td>--%>
        <%--<td>状态</td>--%>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${leadses.content}" var="leads">
        <tr>
            <td><a href="${ctx}/sale/leads/view/${leads.id}">${leads.name}</a></td>
            <td>${leads.customer.name}</td>
            <td>
                <a href="${ctx}/sale/${leads.id}/action/index">
                    ${leads.lastInfo}
                </a>
            </td>
            <td>${leads.owner.name}</td>
            <td>${leads.department.name}</td>
            <td>
                <div class="btn-group">
                    <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">
                        操作
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="${ctx}/sale/leads/edit/${leads.id}"><i class="icon-edit"></i>修改基本信息</a></li>
                        <li><a href="${ctx}/sale/${leads.id}/action/index"><i class="icon-eye-close"></i>查看活动记录</a>
                        </li>
                        <li class="divider"/>
                        <shiro:hasPermission name="leads:convertToOpportunity:WHOLE">
                        <li><a href="${ctx}/sale/leads/convertToOpportunity/${leads.id}"><i class="icon-star"></i>转成销售机会...</a></li>
                        </shiro:hasPermission>
                    </ul>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<tags:pagination page="${leadses}"></tags:pagination>
<div class="row-fluid">
    <div class="span6">
        <a class="btn" href="${ctx}/sale/leads/new"><i class="icon-plus"></i>增加新销售机会</a>
    </div>
</div>

</body>
</html>