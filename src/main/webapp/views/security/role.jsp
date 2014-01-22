<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-2-10
  Time: 上午9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/security/role/index">角色</a></li>
    <li><a href="${ctx}/security/role/${role.id}/edit">${role.name}</a></li>
</ol>
<form:form commandName="role" cssClass="form-horizontal" method="post">
    <form:hidden id='role_id' path="id"></form:hidden>
    <div class="form-group">
        <label class="col-lg-2 control-label">名称</label>

        <div class="col-lg-8">
            <form:input id='role_name' path="name" cssClass="form-control"></form:input>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-2 control-label">描述</label>

        <div class="col-lg-8">
            <form:textarea id='role_description' rows="5" path="description" cssClass="form-control"></form:textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="form-action ">
            <div class="col-lg-8 col-lg-offset-2">
                <input type="submit" id="role_ok" href="#" class="btn btn-primary" value="保存"/>
                <a href="${ctx}/security/role/index" class="btn btn-default">取消</a>
            </div>
        </div>
    </div>
</form:form>
<script type="text/javascript">
    require(['bootstrap'], function () {
        ;
    });
</script>