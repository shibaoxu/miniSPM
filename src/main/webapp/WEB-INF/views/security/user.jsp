<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-30
  Time: 下午9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title></title>
</head>
<body>


<div class="row-fluid">
    <form:form commandName="user" cssClass="form-horizontal">
        <fieldset>
            <legend><i class="icon-user"></i>用户信息</legend>
            <form:hidden path="id"></form:hidden>
            <form:hidden path="salt"></form:hidden>
            <form:hidden path="password"></form:hidden>
            <div class="control-group">
                <label class="control-label" for="user_job_number">工号</label>

                <div class="controls">
                    <form:input id='user_job_number' path="jobNumber"></form:input>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="user_name">姓名</label>

                <div class="controls">
                    <form:input id='user_name' path="name"></form:input>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="user_mail">邮箱</label>

                <div class="controls">
                    <form:input path="mail" id='user_mail'></form:input>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="user_status">状态</label>

                <div class="controls">
                    <form:input path="status" id='user_status' readonly="true"></form:input>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="staff">员工</label>

                <div class="controls">
                    <%--<form:input path="staff" id='staff' readonly="true"></form:input>--%>
                    <form:select path="staff.id" id="staff" items="${staffs}" itemLabel="name" itemValue="id">
                        </form:select>
                </div>
            </div>

        </fieldset>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="保存">
            <a class="btn" href="${ctx}/security/user/index">返回</a>
        </div>
    </form:form>
</div>

</body>
</html>