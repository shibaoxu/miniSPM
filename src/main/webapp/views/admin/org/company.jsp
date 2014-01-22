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
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/admin/org/company/index">公司</a></li>
    <li><a href="">${company.name}</a></li>
</ol>
<form:form method="post" commandName="company" cssClass="form-horizontal">
    <div class="form-group">
        <label class="col-lg-2 control-label" for="companyId">ID</label>

        <div class="col-lg-6">
            <form:input path="id" id="companyId" disabled="true" cssClass="form-control"></form:input>
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-2 control-label" for="companyName">名称</label>

        <div class="col-lg-6">
            <form:input path="name" id="companyName" cssClass="form-control"></form:input>

        </div>
    </div>
    <div class="form-group">
        <div class="form-action">
            <div class="col-lg-8 col-lg-offset-2">
                <c:if test="${updatable}">
                    <input type='submit' class="btn btn-primary" value="保存">
                </c:if>
                <a href="${ctx}/admin/org/company/index" class="btn btn-default">返回</a>
            </div>
        </div>
    </div>
</form:form>
<script type="text/javascript">
    require(['bootstrap'], function () {
    });

</script>