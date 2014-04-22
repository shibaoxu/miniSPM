<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-12-18
  Time: 下午3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/admin/org/staff/index">员工</a></li>
    <li><a href="">${staff.name}</a></li>
</ol>
<form:form method="post" commandName="staff" cssClass="form-horizontal">
    <fieldset>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="staffId">ID</label>

            <div class="col-lg-6">
                <form:input cssClass="form-control" path="id" id="staffId" readonly="true"></form:input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-2 control-label" for="staffName">名称</label>

            <div class="col-lg-6">
                <form:input cssClass="form-control" path="name" id="staffName"></form:input>

            </div>
        </div>
        <div class="form-group">
            <div class="form-action">
                <div class="col-lg-8 col-lg-offset-2">
                    <c:if test="${updatable}">
                        <input type='submit' class="btn btn-primary" value="保存">
                    </c:if>
                    <a href="${ctx}/admin/org/staff/index" class="btn btn-default">返回</a>
                </div>
            </div>
        </div>
    </fieldset>
</form:form>
<script type="text/javascript">
    require(['bootstrap'], function () {
    });
</script>
