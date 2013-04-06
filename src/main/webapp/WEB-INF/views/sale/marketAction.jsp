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

<html>
<head>
    <title></title>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#datepicker').datepicker();
            $('#action_form').validate({
                errorLabelContainer: $("div#error"),
                rules: {
                    brief: "required",
                    eventDate: "required",
                    detail: "required",
                    customer_name: "required"
                },
                messages: {
                    brief: {required: "活动简述必须输入"},
                    detail: "活动详情必须输入",
                    customer_name: "必须选择一个客户，如客户不存在请联系主管增加"
                },
                wrapper: "li",
                errorElement: "em"
            });
        });
    </script>
</head>
<body>
<%@ include file="/WEB-INF/views/dialog/customer_dialog.jsp" %>

<div class="row-fluid">
    <form:form commandName="action" cssClass="form-horizontal" id='action_form'>
        <fieldset>
            <legend><h3><i class="icon-bullhorn"></i>&nbsp市场活动:${action.customer.name}/${action.brief}</h3></legend>
            <form:hidden path="id"></form:hidden>
            <form:hidden id='customer_id' path="customer.id"></form:hidden>
            <div id='error' class="alert alert-block hide"></div>
            <div class="control-group">
                <label class="control-label" for="action_type">活动类型</label>

                <div class="controls">
                    <form:select id='action_type' path="actionType.id" items="${actionTypes}" itemLabel="name"
                                 itemValue="id" cssClass=""></form:select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="action_brief">简述</label>

                <div class="controls">
                    <form:input id='action_brief' path="brief" cssClass="span5"></form:input>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="customer_name">客户</label>

                <div class="controls">
                    <div class="input-append span5">
                        <input id='customer_name' name="customer_name" type="text" class="span11" readonly="true"
                               value="${action.customer.name}">
                    <span class="btn add-on" data-toggle="modal" href="#customer_dialog" data-keyboard="true"><i
                            class="icon-search"></i></span>
                    </div>
                    <span for="customer_name"></span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="event_date">时间</label>

                <div class="controls">

                    <div class="input-append date" id="datepicker" data-date="${action.eventDate}"
                         data-date-format="yyyy-mm-dd" data-date-autoclose="true">
                        <form:input path="eventDate" cssClass="span6" id='event_date' readonly="true"></form:input>
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="action_owner">所有者</label>

                <div class="controls">
                    <form:select path="owner.id" id='action_owner' items="${users}" itemLabel="name"
                                 itemValue="id" cssClass="span3"></form:select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="action_department">部门</label>

                <div class="controls">
                    <form:select path="department.id" id='action_department' items="${departments}" itemLabel="name"
                                 itemValue="id" cssClass="span3"></form:select>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <label><form:checkbox path="important"></form:checkbox>&nbsp;重要</label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="action_detail">详情</label>

                <div class="controls">
                    <form:textarea path="detail" id='action_detail' cssClass="span10" rows="7"></form:textarea>
                </div>
            </div>

            <c:if test="${operation=='new'||operation=='edit'}">
                <div class="form-actions">
                    <input class="btn btn-primary" type="submit" value="保存">
                    <a class="btn" href="${ctx}/sale/market_action/index">返回</a>
                </div>
            </c:if>
        </fieldset>
    </form:form>
</div>

</body>
</html>