<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-15
  Time: 下午7:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div>
    <ol class="breadcrumb">
        <li><a href="${ctx}/admin/index"><spring:message code="topbar.systemManagement"/></a></li>
        <li><a href="#"><spring:message code="sidebar.department"/></a></li>
    </ol>
</div>

<div class="row">
    <%--<div class="col-md-12">--%>
    <div class="toolbar clearfix">
        <form class="" action="#">
            <div class="col-md-6">
                <div class="input-group">
                    <input type="text" class="form-control" name="search_condition" placeholder="请输入搜索条件..."
                           value="${param.search_condition}">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default" id="search_btn"><span class="fa fa-search"/></button>
                </span>
                </div>
            </div>
            <div class="col-md-2">
                <a class="btn btn-primary" href="${ctx}/admin/departments/new"><i
                        class="fa fa-plus-circle fa-fw"></i><spring:message code="command.create"/></a>
            </div>
        </form>
    </div>

    <%--</div>--%>
</div>
<div class="table-responsive">
    <table class="table table-striped table-condensed table-hover table-bordered">
        <thead>
        <tr>
            <td>名称</td>
            <td class="operation"></td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${departments.content}" var="department">
            <tr>
                <td><a href="${ctx}/admin/departments/${department.id}/edit">${department.name}</a></td>
                <td class="text-center">
                    <div class="dropdown">
                        <a class="btn dropdown-toggle context-menu" data-toggle="dropdown">
                            <i class="fa fa-list fa-fw"></i>
                        </a>
                        <ul class="dropdown-menu pull-right text-left" role="menu">
                            <li><a href="${ctx}/admin/org/departments/${department.id}/edit"><i
                                    class="fa fa-edit fa-fw"></i>修改</a>
                            </li>
                            <li>
                            </li>
                            <li><a href="${ctx}/admin/org/departments/${department.id}/delete?_method=delete"><i
                                    class="fa fa-cut fa-fw"></i>删除</a>
                            </li>
                        </ul>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <tags:pagination page="${departments}"></tags:pagination>
</div>
<script type="text/javascript">
    require(['bootstrap'], function () {
    });

</script>
