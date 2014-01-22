<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-1-22
  Time: 下午12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<%@ include file="/views/dialog/customer_dialog.jsp" %>
<ol class="breadcrumb">
    <li><a href="${ctx}/index">首页</a></li>
    <li><a href="${ctx}/sale/index">销售</a></li>
    <li><a href="${ctx}/sale/market_action/index">市场活动</a></li>
    <li><a href="">${action.brief}</a></li>
</ol>
<div>
    <form:form commandName="action" cssClass="form-horizontal" id='action_form'>
        <fieldset>
            <form:hidden path="id"></form:hidden>
            <form:hidden id='customer_id' path="customer.id"></form:hidden>
            <div id='error' class="alert alert-warning hidden">
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" for="action_brief">简述</label>

                <div class="col-lg-6">
                    <form:input id='action_brief' path="brief" cssClass="form-control"></form:input>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" for="action_type">活动类型</label>

                <div class="col-lg-4">
                    <form:select id='action_type' path="actionType.id" items="${actionTypes}" itemLabel="name"
                                 itemValue="id" cssClass="form-control"></form:select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2" for="customer_name">客户</label>

                <div class="col-lg-4">
                    <div class="input-group">
                        <input id='customer_name' name="customer_name" type="text"
                               class="form-control" readonly="true"
                               value="${action.customer.name}">
                       <span class="input-group-btn" data-toggle="modal" data-target="#cDialog" data-keyboard="false">
                            <button class="btn btn-default" type="button"><span class="icon-search"/></button>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2" for="datepicker">时间</label>

                <div class="col-lg-10">
                    <form:input path="eventDate" cssClass="datepicker" id='datepicker' readonly="true"></form:input>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2" for="action_owner">所有者</label>

                <div class="col-lg-4">
                    <form:select path="owner.id" id='action_owner' items="${users}" itemLabel="name"
                                 itemValue="id" cssClass="form-control"></form:select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2" for="action_department">部门</label>

                <div class="col-lg-4">
                    <form:select path="department.id" id='action_department' items="${departments}" itemLabel="name"
                                 itemValue="id" cssClass="form-control"></form:select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-2 col-lg-offset-2">
                    <div class="checkbox">
                        <label>
                            <form:checkbox path="important"></form:checkbox>重要
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2" for="action_detail">详情</label>

                <div class="col-lg-9">
                    <form:textarea path="detail" id='action_detail' cssClass="form-control" rows="8"></form:textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="form-action">
                    <c:if test="${operation=='new'||operation=='edit'}">
                        <div class="col-lg-10 col-lg-offset-2 ">
                            <input class="btn btn-primary" type="submit" value="保存">
                            <a class="btn btn-default" href="${ctx}/sale/market_action/index">返回</a>
                        </div>
                    </c:if>
                </div>
            </div>
        </fieldset>
    </form:form>
</div>
<script type="text/javascript">
    require(['sale/marketAction'], function (controller) {
    });
</script>