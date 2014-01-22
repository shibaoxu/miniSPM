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
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/security/role/index">角色</a></li>
</ol>
<div>
    <table class="table table-striped table-condensed table-hover table-bordered">
        <thead>
        <tr>
            <td>名称</td>
            <td>描述</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${roles}" var="role">
            <tr>
                <td><a href="${ctx}/security/role/${role.id}/users">${role.name}</a>
                </td>
                <td>${role.description}
                </td>
                <td>
                    <div class="dropdown">
                        <a class="relate_menu dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-list"></i>
                        </a>
                        <ul class="dropdown-menu pull-right" role="menu">
                            <li><a href="${ctx}/security/role/${role.id}/users"><i class="icon-user"></i>管理用户</a></li>
                            <li><a href="${ctx}/security/role/${role.id}/permissions/"><i class="icon-ok-circle"></i>管理权限</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="${ctx}/security/role/${role.id}/edit"><i class="icon-edit"></i>修改信息</a></li>
                            <li><a href="${ctx}/security/role/${role.id}/remove"><i class="icon-remove"></i>删除</a></li>
                        </ul>
                    </div>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="row">
    <div class="col-lg-6">
        <a class="btn btn-primary" href="${ctx}/security/role/new"><i class="icon-plus"></i>增加新角色</a>
    </div>
</div>
<script type="text/javascript">
    require(['bootstrap'],function(){;});
</script>
