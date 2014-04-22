<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-15
  Time: 下午4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:choose>
    <c:when test="${company['new']}"><c:set var="method" value="post"/></c:when>
    <c:otherwise><c:set var="method" value="put"/></c:otherwise>
</c:choose>

<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index"></a></li>
    <li><a href="${ctx}/admin/companies"><spring:message code="company"/></a></li>
    <li><a href="#">${company.name}</a></li>
</ol>
<form:form method="${method}" commandName="company" cssClass="form-horizontal">
    <div class="error">
        <form:errors path="*"/>
    </div>

    <div class="form-group">
        <label class="col-md-1 control-label" for="companyId">ID</label>

        <div class="col-md-6">
            <form:input path="id" id="companyId" readonly="true" cssClass="form-control"></form:input>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-1 control-label" for="companyName"><spring:message code="company.name"/></label>

        <div class="col-md-6">
            <form:input path="name" id="companyName" cssClass="form-control"></form:input>

        </div>
    </div>
    <div class="col-md-offset-1">
        <input type='submit' class="btn btn-primary" value="<spring:message code="command.save"/>">
        <a href="${ctx}/admin/companies" class="btn btn-default"><spring:message code="command.cancel"/></a>
    </div>
</form:form>
<script type="text/javascript">
    require(['bootstrap'], function () {
    });
</script>