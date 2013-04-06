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
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
</head>
<body>
<h3><i class="icon-shopping-cart"></i>&nbsp客户</h3>
<div class="row-fluid">
    <form class="form-search" action="#">
        <input type="text" class="search-query input-large" name="search_LIKE_name" placeholder="请输入客户名称..." value="${param.search_LIKE_name}">
        <button type="submit" class="btn" id="search_btn">搜索</button>
    </form>
</div>

<table class="table table-striped table-bordered table-hover table-condensed">
    <thead>
    <tr>
        <td>名称</td>
        <td>行业</td>
        <td>规模</td>
        <td>是否新客户</td>
        <td></td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers.content}" var="customer">
        <tr <c:if test="${customer.develop}">class="success" </c:if>>
            <td>
                <a href="${ctx}/sale/customer/${customer.id}">${customer.name}</a>
            </td>
            <td>
                    ${customer.industry.name}
            </td>
            <td>
                    ${customer.scale.name}
            </td>
            <td>
                <c:if test="${customer.develop}">
                    是
                </c:if>
            </td>

            <td>
                <div class="btn-group">
                    <button class="btn btn-mini">操作</button>
                    <button class="btn btn btn-mini dropdown-toggle" data-toggle="dropdown">
                        &nbsp<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="${ctx}/sale/customer/${customer.id}"><i class="icon-edit"></i>修改</a></li>
                        <li><a href="${ctx}/sale/customer/${customer.id}/remove"><i class="icon-remove"></i>删除</a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<tags:pagination page="${customers}"></tags:pagination>
<div class="row-fluid">
    <div class="span6">
        <a class="btn" href="${ctx}/sale/customer/new"><i class="icon-plus"></i>增加新的客户</a>
    </div>
</div>

</body>
</html>

