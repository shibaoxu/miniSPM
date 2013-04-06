<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-15
  Time: 下午8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title></title>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#leads_form').validate({
                errorLabelContainer: $("div#error"),
                rules: {
                    name: "required",
                    customer_name: "required",
//                    lowAmount: {
//                        required: true,
//                        number: true,
//                        min: 0
//                    },
//                    highAmount: {
//                        required: true,
//                        number: true,
//                        min: 0
//                    },
//                    dealAmount: {
//                        required: true,
//                        number: true,
//                        min: 0
//                    },
                    des: "required"
                },
                messages: {
                    name: '销售线索名称必须输入',
                    des: "销售线索详细描述必须输入,且需尽可能详细",
                    customer_name: "必须选择一个客户，如客户不存在请联系主管增加",
                },
                wrapper: "li",
                errorElement: "em"
            });
        })
    </script>
</head>
<body>

<%@ include file="/WEB-INF/views/dialog/customer_dialog.jsp" %>
<div class="row-fluid">
    <form:form method="post" id='leads_form' commandName="leads" cssClass="form-horizontal">
        <fieldset>
            <legend><h3><i class="icon-eye-open"></i>&nbsp销售线索</h3></legend>
            <div id='error' class="alert alert-block hide"></div>
            <div class="row-fluid">
                <form:hidden path="id" id="leadsId"></form:hidden>
                <form:hidden id='customer_id' path="customer.id"></form:hidden>
                <form:hidden path="lastInfo"></form:hidden>
                <form:hidden path="lastModifiedDate"></form:hidden>
                    <%--<form:hidden path="owner.id"></form:hidden>--%>

                <div class="controls-row">
                    <div class="row-fluid">
                        <label class="span1 rlabel">名称:</label>
                        <form:input path="name" id="leadsName" cssClass="span11"></form:input>
                    </div>
                    <div class="row-fluid">
                        <label class="span1 rlabel">客户:</label>

                        <div class="input-append span2">
                            <input id='customer_name' name="customer_name" type="text" class="span11" readonly="true"
                                   value="${leads.customer.name}">
                            <span class="btn add-on" data-toggle="modal" href="#customer_dialog" data-keyboard="true"><i
                                    class="icon-search"></i></span>
                        </div>
                        <label class="span1 rlabel">来源:</label>
                        <form:select path="source.id" cssClass="span2">
                            <form:options items="${sources}" itemLabel="name" itemValue="id"></form:options>
                        </form:select>
                        <label class="span1 rlabel">所有者:</label>
                        <form:select path="owner.id" items="${users}" itemLabel="name" itemValue="id"
                                     cssClass="span2"></form:select>
                        <label class="span1 rlabel">部门:</label>
                        <form:select path="department.id" items="${departments}" itemLabel="name" itemValue="id"
                                     cssClass="span2"></form:select>

                    </div>
                    <div class="row-fluid">
                        <label class="span1 rlabel">预测价格:</label>
                        <form:input id="lowAmount" path="lowAmount" cssClass="span2"></form:input>
                        <label class="clabel span1">－</label>
                        <form:input path="highAmount" cssClass="span2"></form:input>
                    </div>
                    <div class="row-fluid">
                        <div class="control-group">
                            <label class="span1 rlabel">详情:</label>
                            <form:textarea path="des" cssClass="span11" rows="5"></form:textarea>
                        </div>
                    </div>

                    <div class="row-fluid">
                        <label class="span1 rlabel">状态:</label>
                        <form:input path="status" cssClass="span2" readonly="true"></form:input>
                        <label class="span1 rlabel">创建日期:</label>
                        <form:input path="createdDate" readonly="true" cssClass="span2"></form:input>
                        <c:if test="${leads.status == 'CLOSED'}">
                        <label class="span1 rlabel">关闭原因:</label>
                        <form:select path="closedReason.id" items="${closedReasons}" itemValue="id" itemLabel="name"
                                     cssClass="span2"></form:select>
                        <label class="span1 rlabel">关闭时间:</label>
                        <form:input path="lastModifiedDate" cssClass="span2"></form:input>
                    </div>
                    <div class="row-fluid">
                        <div class="control-group">
                            <label class="span1 rlabel">关闭详情:</label>
                            <form:textarea path="closeReasonDetail" cssClass="span11" rows="3"></form:textarea>
                        </div>
                    </div>
                    </c:if>
                </div>
            </div>
        </fieldset>
        <c:if test="${operation == 'add' || operation == 'edit'}">

            <div class="form-actions">
                <input type='submit' class="btn btn-primary" value="保存">
                <a href="${ctx}/sale/leads/index" class="btn">返回</a>
            </div>
        </c:if>
    </form:form>
</div>
</div>
</body>
</html>