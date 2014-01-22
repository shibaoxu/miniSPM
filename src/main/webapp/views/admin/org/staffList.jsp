<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-12-18
  Time: 下午3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/admin/org/staff/index">员工</a></li>
</ol>
<div class="row">
    <div class="col-lg-6">
        <table class="table table-striped table-condensed table-hover table-bordered">
            <thead>
            <tr>
                <td>名称</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${staffs}" var="staff">
                <tr>
                    <td><a href="${ctx}/admin/org/staff/${staff.id}/view">${staff.name}</a></td>
                    <td>
                        <div class="dropdown">
                            <a class="relate_menu dropdown-toggle" data-toggle="dropdown">
                                <i class="icon-list"></i>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${ctx}/admin/org/staff/${staff.id}/edit"><i
                                        class="icon-edit"></i>修改</a></li>
                                <li>
                                <li class="divider"/>
                                </li>
                                <li><a href="${ctx}/admin/org/staff/${staff.id}/remove"><i
                                        class="icon-remove"></i>删除</a></li>
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
    <div class="col-lg-6">
        <a class="btn btn-primary" href="${ctx}/admin/org/staff/new"><i class="icon-plus"></i>增加员工</a>
    </div>
</div>
<script type="text/javascript">
    require(['bootstrap'], function () {
    });

</script>
