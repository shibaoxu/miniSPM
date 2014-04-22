<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-15
  Time: 下午8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/admin/org/department/index">公司</a></li>
    <li><a href="">${department.name}</a></li>
</ol>
<form:form method="post" commandName="department" cssClass="form-horizontal">
    <fieldset>
        <div class="form-group">
            <label class="col-md-2 control-label" for="departmentId">ID</label>

            <div class="col-md-6">
                <form:input cssClass="form-control" path="id" id="departmentId" disabled="true"></form:input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label" for="departmentName">名称</label>

            <div class="col-md-6">
                <form:input cssClass="form-control" path="name" id="departmentName"></form:input>

            </div>
        </div>
        <div class="form-group">
            <div class="form-action">
                <div class="col-md-8 col-md-offset-2">
                    <c:if test="${updatable}">
                        <input type='submit' class="btn btn-primary" value="保存">
                    </c:if>
                    <a href="${ctx}/admin/org/department/index" class="btn btn-default">返回</a>
                </div>
            </div>
        </div>
    </fieldset>
</form:form>
<script type="text/javascript">
    require(['bootstrap'], function () {
    });
</script>