<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-30
  Time: 下午9:39
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
        });
    </script>
</head>
<body>

<div id="action_error">

</div>
<div class="row-fluid">
    <form:form commandName="action" cssClass="form-horizontal" id="action_form">
        <fieldset>
            <legend><h3><i class="icon-coffee"></i>&nbsp销售线索:${leadsBase.customer.name}/${leadsBase.name}</h3></legend>
            <form:hidden path="id"></form:hidden>
            <form:hidden path="leadsBase.id"></form:hidden>
            <div class="control-group">
                <label class="control-label" for="action_type">活动类型</label>

                <div class="controls">
                    <form:select id='action_type' path="actionType.id" items="${actionTypes}" itemLabel="name"
                                 itemValue="id"></form:select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="action_brief">简述</label>

                <div class="controls">
                    <form:input id='action_brief' path="brief"
                                cssClass="span5 {required:true,minlength:3}"></form:input>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="action_occur_date">发生时间</label>

                <div class="controls">
                    <div class="input-append date" id="datepicker" data-date="${action.occurDate}"
                         data-date-format="yyyy-mm-dd" data-date-autoclose="true">
                        <form:input path="occurDate" cssClass="span6" id='action_occur_date'
                                    readonly="true"></form:input>
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="action_owner">所有者</label>

                <div class="controls">
                    <form:select path="owner.id" id='action_owner' items="${users}" itemLabel="name"
                                 itemValue="id"></form:select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="action_customer_participants">客户方参入者</label>

                <div class="controls">
                    <form:input path="customerParticipants" cssClass="span8"
                                id='action_customer_participants'></form:input>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="action_self_participants">我方参入者</label>

                <div class="controls">
                    <form:input path="selfParticipants" cssClass="span8" id='action_self_participants'></form:input>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                        <%--<label><input type="checkbox" name="milestone" checked="${action.milestone}">&nbsp;里程碑事件</label>--%>
                    <label><form:checkbox path="milestone"></form:checkbox>&nbsp;里程碑事件</label>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="action_detail">详情</label>

                <div class="controls">
                    <form:textarea path="detail" id='action_detail' cssClass="span10" rows="7"></form:textarea>
                </div>
            </div>
            <c:if test="${operation == 'add' || operation == 'edit'}">
                <div class="form-actions">
                    <input class="btn btn-primary" type="submit" value="保存">
                    <a class="btn" href="${ctx}/sale/leads/${action.leadsBase.id}/action/index">返回</a>
                </div>
            </c:if>
        </fieldset>
    </form:form>
</div>
</body>
</html>