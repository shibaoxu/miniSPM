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
<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/security/user/index">用户</a></li>
    <li><a href="">${user.name}</a></li>
</ol>
<div class="row">
    <form:form commandName="user" cssClass="form-horizontal">
        <form:hidden path="id"></form:hidden>
        <form:hidden path="salt"></form:hidden>
        <form:hidden path="password"></form:hidden>
        <div class="form-group">
            <label class="control-label col-lg-2" for="user_job_number">工号</label>

            <div class="col-lg-4">
                <form:input id='user_job_number' cssClass="form-control" path="jobNumber"></form:input>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2" for="user_name">姓名</label>

            <div class="col-lg-4">
                <form:input id='user_name' cssClass="form-control" path="name"></form:input>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-lg-2" for="user_mail">邮箱</label>

            <div class="col-lg-4">
                <form:input path="mail" cssClass="form-control" id='user_mail'></form:input>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2" for="user_status">状态</label>

            <div class="col-lg-4">
                <form:input path="status" cssClass="form-control" id='user_status' readonly="true"></form:input>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2" for="staff">员工</label>

            <div class="col-lg-4">
                <form:select path="staff.id" cssClass="form-control" id="staff" items="${staffs}" itemLabel="name"
                             itemValue="id">
                </form:select>
            </div>
        </div>
        <div class="form-group">
            <div class="form-action ">
                <div class="col-lg-8 col-lg-offset-2">
                    <input class="btn btn-primary" type="submit" value="保存">
                    <a class="btn btn-default" href="${ctx}/security/user/index">返回</a>
                </div>
            </div>
        </div>
    </form:form>
</div>

