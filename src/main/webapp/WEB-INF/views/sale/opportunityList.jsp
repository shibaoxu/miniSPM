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
<ol class="breadcrumb">
    <li><a href="${ctx}/index">首页</a></li>
    <li><a href="${ctx}/sale/index">销售</a></li>
    <li><a href="">销售机会</a></li>
</ol>
<div>
    <form class="form-horizontal" action="#">
        <div class="form-group">
            <div class="input-group col-lg-4">
                <input type="text" class="form-control" name="search_condition" placeholder="请输入搜索条件..."
                       value="${param.search_condition}">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default" id="search_btn"><span class="icon-search"/></button>
                </span>
            </div>
        </div>
    </form>
</div>
<table class="table table-striped table-bordered table-hover table-condensed">
    <thead>
    <tr>
        <td>简介</td>
        <td>客户</td>
        <td>金额(低)</td>
        <td>金额(高)</td>
        <td>最近活动</td>
        <td>所有者</td>
        <td>部门</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${opportunities.content}" var="opportunity">
        <tr>
            <td><a href="${ctx}/sale/opportunity/view/${opportunity.id}">${opportunity.name}</a></td>
            <td>${opportunity.customer.name}</td>
            <td><fmt:formatNumber value="${opportunity.lowAmount}" type="number"/></td>
            <td><fmt:formatNumber value="${opportunity.highAmount}" type="number"/></td>
            <td>
                <a href="${ctx}/sale/opportunity/${opportunity.id}/action/index">
                        ${opportunity.lastInfo}
                </a>
            </td>
            <td>${opportunity.owner.name}</td>
            <td>${opportunity.department.name}</td>
            <td>
                <div class="dropdown">
                    <a class="relate_menu dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-list"></i>
                    </a>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="${ctx}/sale/opportunity/edit/${opportunity.id}"><i class="icon-edit"></i>修改基本信息</a>
                        </li>
                        <li><a href="${ctx}/sale/${opportunity.id}/action/index"><i
                                class="icon-eye-close"></i>查看活动记录</a>
                        </li>
                        <li class="divider"/>
                        <shiro:hasPermission name="leads:close:WHOLE">
                        <li><a href="${ctx}/sale/opportunity/close/${opportunity.id}"><i class="icon-star"></i>关闭...</a>
                            </shiro:hasPermission>
                    </ul>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<tags:pagination page="${opportunities}"></tags:pagination>
</body>
</html>