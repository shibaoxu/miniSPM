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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index"><spring:message code="topbar.systemManagement"/></a></li>
    <li><a href="#"><spring:message code="company"/> </a></li>
</ol>
<div class="row">
    <div class="col-md-6">
        <table class="table table-striped table-condensed table-hover table-bordered">
            <thead>
            <tr>
                <td>名称</td>
                <td class="operation"></td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${companies}" var="company">
                <tr>
                    <td><a href="${ctx}/admin/companies/${company.id}/edit">${company.name}</a></td>
                    <td class="text-center">
                        <div class="dropdown">
                            <a class="btn dropdown-toggle context-menu" data-toggle="dropdown">
                                <i class="fa fa-list"></i>
                            </a>
                            <ul class="dropdown-menu pull-right text-left" role="menu">
                                <li><a href="${ctx}/admin/companies/${company.id}/edit"><i
                                        class="fa fa-edit fa-fw"></i> <spring:message code="command.edit"/></a></li>
                                <li>
                                </li>
                                <li>
                                    <a href="${ctx}/admin/companies/${company.id}/delete?_method=delete"><i
                                            class="fa fa-cut fa-fw"></i> <spring:message code="command.delete"/></a>
                                </li>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <a class="btn btn-primary" href="${ctx}/admin/companies/new"><i class="fa fa-plus-circle fa-fw"></i> <spring:message code="command.create"/></a>
    </div>
</div>
<script type="text/javascript">
    require(['bootstrap'], function () {
    });

</script>
