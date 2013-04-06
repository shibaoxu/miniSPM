<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-15
  Time: 下午3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
</head>
<body>
<h3>公司管理</h3>
<table class="table table-striped table-bordered table-hover table-condensed">
    <thead>
    <tr>
        <td>名称</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${companies}" var="company">
        <tr>
            <td><i class="icon-home"></i><a href="${ctx}/admin/org/company/view/${company.id}">${company.name}</a></td>
            <td>

                <div class="btn-group">
                    <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">
                        操作
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="${ctx}/admin/org/company/edit/${company.id}"><i class="icon-edit"></i>修改</a></li>
                        <li><li class="divider"/></li>
                        <li><a href="${ctx}/admin/org/company/del/${company.id}"><i class="icon-remove"></i>删除</a> </li>
                    </ul>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="row-fluid">
    <div class="span6">
        <a class="btn" href="${ctx}/admin/org/company/new"><i class="icon-plus"></i>增加新公司</a>
    </div>
    <%--<tags:pagination page="${users}" paginationSize="5"/>--%>
    <%--<div class="span6 pagination pagination-right">--%>
    <%--<ul>--%>
    <%--<li><a href="#">首页</a></li>--%>
    <%--<li><a href="#">前一页</a></li>--%>
    <%--<li><a href="#">后一页</a></li>--%>
    <%--<li><a href="#">尾页</a></li>--%>
    <%--</ul>--%>
    <%--</div>--%>
</div>

</body>
</html>