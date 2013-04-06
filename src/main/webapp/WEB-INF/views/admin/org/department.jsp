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

<html>
<head>
    <title></title>
</head>
<body>
<form:form method="post" commandName="department" cssClass="form-horizontal">
    <fieldset>
        <legend>部门信息</legend>
        <div class="control-group">
            <label class="control-label" for="departmentId">ID</label>

            <div class="controls">
                <form:input path="id" id="departmentId" disabled="true"></form:input>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="departmentName">名称</label>

            <div class="controls">
                <form:input path="name" id="departmentName"></form:input>

            </div>
        </div>
        <div class="controls">
            <c:if test="${updatable}">
                <input type='submit' class="btn btn-primary" value="保存">
            </c:if>
            <a href="${ctx}/admin/org/department/index" class="btn">返回</a>
        </div>
    </fieldset>
</form:form>
</body>
</html>