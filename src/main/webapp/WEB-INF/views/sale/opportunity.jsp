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
</head>
<body>

<%@ include file="/WEB-INF/views/dialog/customer_dialog.jsp" %>
<div class="row-fluid">
    <form:form method="post" id='opportunity_form' commandName="opportunity" cssClass="form-horizontal">
        <fieldset>
            <legend><h3><i class="icon-star"></i>&nbsp销售机会</h3></legend>
            <div id='error' class="alert alert-block hide"></div>
            <div class="row-fluid">
                <form:hidden path="id" id="opportunityId"></form:hidden>
                <form:hidden id='customer_id' path="customer.id"></form:hidden>
                <form:hidden path="lastInfo"></form:hidden>

                <div class="controls-row">
                    <div class="row-fluid">
                        <label class="span1 rlabel">名称:</label>
                        <form:input path="name" id="opportunityName" cssClass="span11"></form:input>
                    </div>
                    <div class="row-fluid">
                        <label class="span1 rlabel">客户:</label>

                        <div class="input-append span2">
                            <input id='customer_name' name="customer_name" type="text" class="span11" readonly="true"
                                   value="${opportunity.customer.name}">
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
                        <%--<label class="span1 rlabel">成交价格:</label>--%>
                        <%--<form:input path="dealAmount" cssClass="span2"></form:input>--%>
                        <label class="span1 rlabel">签约时间:</label>
                        <form:input path="planDealDate" cssClass="span2"></form:input>

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
                        <c:if test="${opportunity.status == 'CLOSED'}">
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
    </form:form>
</div>
</div>
</body>
</html>