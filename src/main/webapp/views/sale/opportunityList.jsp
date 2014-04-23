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
<div>
<ol class="breadcrumb">
    <li><a href="${ctx}/index">首页</a></li>
    <li><a href="${ctx}/sale/index">销售</a></li>
    <li><a href="">销售机会</a></li>
</ol>
</div>
<div class="row toolbar clearfix">
    <form class="" action="#">
        <div class="col-md-6">
            <div class="input-group">
                <input type="text" class="form-control" name="search_condition" placeholder="请输入搜索条件..."
                       value="${param.search_condition}">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default" id="search_btn"><i class="fa fa-search fa-fw"></i></button>
                </span>
            </div>
        </div>
        <div class="col-md-3">
            <div class="btn-group">
                <c:choose>
                    <c:when test="${param.filter_self == true}">
                        <button class="btn btn-default active" id='btnFilterSelf'>只看自己</button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-default" id='btnFilterSelf'>只看自己</button>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${param.filter_closed == true}">
                        <button class="btn btn-default active" id='btnFilterClosed'>包括关闭</button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-default" id='btnFilterClosed'>包括关闭</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="col-md-3 text-right">
            <input type="hidden" name="filter_self" id="chkFilterSelf" value="${param.filter_self}" class="">
            <input type="hidden" name="filter_closed" id='chkFilterClosed' value="${param.filter_closed}">
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
            <td class="grid-customer">${opportunity.customer.name}</td>
            <td><fmt:formatNumber value="${opportunity.lowAmount}" type="number"/></td>
            <td><fmt:formatNumber value="${opportunity.highAmount}" type="number"/></td>
            <td>
                <a href="${ctx}/sale/opportunity/${opportunity.id}/action/index">
                        ${opportunity.lastInfo}
                </a>
            </td>
            <td class="grid-owner">${opportunity.owner.name}</td>
            <td class="grid-department">${opportunity.department.name}</td>
            <td class="grid-action">
                <div class="dropdown">
                    <a class="btn dropdown-toggle context-menu" data-toggle="dropdown">
                        <i class="fa fa-list fa-fw"></i>
                    </a>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <shiro:hasPermission name="opportunity:edit:*">
                            <li><a href="${ctx}/sale/opportunity/edit/${opportunity.id}"><i class="fa fa-edit fa-fw"></i> 修改基本信息</a>
                            </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="opportunity:view:*">
                            <li><a href="${ctx}/sale/opportunity/${opportunity.id}/action/index"><i
                                    class="fa fa-sort-amount-asc fa-fw"></i> 查看活动记录</a>
                            </li>
                        </shiro:hasPermission>
                        <li class="divider"/>
                        <shiro:hasPermission name="opportunity:close:*">
                        <li><a href="${ctx}/sale/opportunity/${opportunity.id}/close"><i class="fa fa-star fa-fw"></i> 关闭...</a>
                            </shiro:hasPermission>
                    </ul>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<tags:pagination page="${opportunities}"></tags:pagination>
<script type="text/javascript">
    require(['sale/leadsList'], function () {

    });
</script>
