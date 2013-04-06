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
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
</head>
<body>
<h3><i class="icon-star"></i>&nbsp销售机会</h3>

<form class="form-search" action="#">
    <input type="text" class="search-query input-large" name="search_condition" placeholder="请输入搜索条件..."
           value="${param.search_condition}">
    <button type="submit" class="btn" id="search_btn">搜索</button>
</form>

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
                <a href="${ctx}/sale/${opportunity.id}/action/index">
                        ${opportunity.lastInfo}
                </a>
            </td>
            <td>${opportunity.owner.name}</td>
            <td>${opportunity.department.name}</td>
            <td>
                <div class="btn-group">
                    <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">
                        操作
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="${ctx}/sale/opportunity/edit/${opportunity.id}"><i class="icon-edit"></i>修改基本信息</a>
                        </li>
                        <li><a href="${ctx}/sale/${opportunity.id}/action/index"><i
                                class="icon-eye-close"></i>查看活动记录</a>
                        </li>
                            <%--<li>--%>
                            <%--<li class="divider"/>--%>
                            <%--</li>--%>
                            <%--<li><a href="${ctx}/sale/opportunity/edit/${opportunity.id}"><i class="icon-edit"></i>转销售机会</a></li>--%>
                            <%--<li><a href="${ctx}/sale/opportunity/del/${opportunity.id}"><i class="icon-remove"></i>成交</a></li>--%>
                            <%--<li><a href="${ctx}/sale/opportunity/del/${opportunity.id}"><i class="icon-remove"></i>关闭</a></li>--%>
                            <%--<li>--%>
                            <%--<li class="divider"/>--%>
                            <%--</li>--%>
                            <%--<li><a href="${ctx}/sale/opportunity/del/${opportunity.id}"><i class="icon-remove"></i>删除</a></li>--%>
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