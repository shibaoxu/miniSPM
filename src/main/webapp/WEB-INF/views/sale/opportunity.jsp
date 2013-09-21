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
    <script type="text/javascript">
        $(document).ready(function () {
            $('#planDealDate').datepicker({
                format: 'yyyy-mm-dd'
            });

        })
    </script>

</head>
<body>

<%@ include file="/WEB-INF/views/dialog/customer_dialog.jsp" %>
<ol class="breadcrumb">
    <li><a href="${ctx}/index">首页</a></li>
    <li><a href="${ctx}/sale/index">销售</a></li>
    <li><a href="${ctx}/sale/opportunity/index">销售机会</a></li>
    <li><a href="">${opportunity.name}</a></li>
</ol>

<div>
    <form:form method="post" id='opportunity_form' commandName="opportunity" cssClass="form-inline">
    <fieldset>
        <div id='error' class="alert alert-warning hidden"></div>
            <form:hidden path="id" id="opportunityId"></form:hidden>
            <form:hidden id='customer_id' path="customer.id"></form:hidden>
            <form:hidden path="lastInfo"></form:hidden>
        <div class="controls-row body-content row">
            <label class="col-lg-1 text-right">名称</label>

            <div class="col-lg-11">
                <form:input path="name" id="opportunityName" cssClass="form-control"></form:input>
            </div>
        </div>
        <div class="controls-row body-content row">
            <label class="col-lg-1 text-right">客户</label>
            <div class="col-lg-2">
                <div class="input-group">
                    <input id='customer_name' name="customer_name" type="text" class="form-control" readonly="true"
                           value="${opportunity.customer.name}">
                        <span class="input-group-btn" data-toggle="modal" href="#customer_dialog" data-keyboard="true">
                            <button class="btn btn-default" type="button"><span class="icon-search"/></button>
                        </span>

                </div>
            </div>
            <label class="col-lg-1 text-right">来源</label>

            <div class="col-lg-2">
                <form:select path="source.id" cssClass="form-control">
                    <form:options items="${sources}" itemLabel="name" itemValue="id"></form:options>
                </form:select>
            </div>
            <label class="col-lg-1 text-right">所有者</label>

            <div class="col-lg-2">
                <form:select path="owner.id" items="${users}" itemLabel="name" itemValue="id"
                             cssClass="form-control"></form:select>
            </div>
            <label class="col-lg-1 text-right">部门</label>

            <div class="col-lg-2">
                <form:select path="department.id" items="${departments}" itemLabel="name" itemValue="id"
                             cssClass="form-control"></form:select>
            </div>
        </div>
        <div class="controls-row body-content row">
            <label class="col-lg-1 text-right">最低价</label>

            <div class="col-lg-2">
                <form:input id="lowAmount" path="lowAmount" cssClass="form-control"></form:input>
            </div>

            <label class="col-lg-1 text-right">最高价</label>

            <div class="col-lg-2">
                <form:input path="highAmount" cssClass="form-control"></form:input>
            </div>

            <label class="col-lg-1 text-right">签约时间</label>

            <div class="col-lg-2">
                <form:input path="planDealDate" cssClass="datepicker form-control" id='planDealDate'></form:input>
            </div>

        </div>
        <div class="controls-row body-content row">
            <label class="col-lg-1 text-right">详情</label>

            <div class="col-lg-11">
                <form:textarea path="des" cssClass="form-control" rows="5"></form:textarea>
            </div>
        </div>
        <div class="controls-row body-content row">
            <label class="col-lg-1 text-right">状态</label>

            <div class="col-lg-2">
                <form:input path="status" cssClass="form-control" readonly="true"></form:input>
            </div>
            <label class="col-lg-1 text-right">创建日期</label>

            <div class="col-lg-2">
                <form:input path="createdDate" readonly="true" cssClass="form-control"></form:input>
            </div>
            <c:if test="${opportunity.status == 'CLOSED'}">
                <label class="col-lg-1 text-right">关闭原因</label>

                <div class="col-lg-2">
                    <form:select path="closedReason.id" items="${closedReasons}" itemValue="id" itemLabel="name"
                                 cssClass="form-control"></form:select>
                </div>
                <label class="col-lg-1">关闭时间</label>

                <div class="col-lg-2">
                    <form:input path="lastModifiedDate" cssClass="form-control" readonly='true'></form:input>
                </div>

            </c:if>
        </div>
        <c:if test="${opportunity.status == 'CLOSED'}">
        <div class="controls-row body-content row">
            <label class="col-lg-1">关闭详情</label>

            <div class="col-lg-11">
                <form:textarea path="closeReasonDetail" cssClass="form-control" rows="5"></form:textarea>
            </div>
        </div>
        </c:if>

</div>
</fieldset>
<div class="row controls-row body-content form-action">
    <div class="col-lg-11 col-lg-offset-1">
        <a href="${ctx}/sale/opportunity/${opportunity.id}/action/index" class="btn btn-primary">查看销售活动</a>
        <a href="${ctx}/sale/opportunity/index" class="btn btn-default">返回</a>
    </div>
</div>

</form:form>
</div>
</div>
</body>
</html>