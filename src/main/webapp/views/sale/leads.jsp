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

<%@ include file="/views/dialog/customer_dialog.jsp" %>
<ol class="breadcrumb">
    <li><a href="${ctx}/index">首页</a></li>
    <li><a href="${ctx}/sale/index">销售</a></li>
    <li><a href="${ctx}/sale/leads/index">销售线索</a></li>
    <li><a href="">${leads.name}</a></li>
</ol>

<div>
    <form:form method="post" id='leads_form' commandName="leads" cssClass="form-inline">
        <fieldset>
            <div id='error' class="alert alert-warning hidden"></div>
            <form:hidden path="id" id="leadsId"></form:hidden>
            <form:hidden id='customer_id' path="customer.id"></form:hidden>
            <form:hidden path="lastInfo"></form:hidden>
            <form:hidden path="lastModifiedDate"></form:hidden>

            <div class="controls-row row body-content">
                <label class="col-lg-1 text-right" for='leadsName'>名称</label>

                <div class="col-lg-11">
                    <form:input path="name" id="leadsName" cssClass="form-control"></form:input>
                </div>
            </div>
            <div class="controls-row row body-content">
                <label class="col-lg-1 text-right">客户</label>

                <div class="col-lg-2">
                    <div class="input-group">
                        <input id='customer_name' name="customer_name" type="text" class="form-control" readonly="true"
                               value="${leads.customer.name}">
                        <span class="input-group-btn" data-toggle="modal" href="#cDialog" data-keyboard="true">
                            <button class="btn btn-default" type="button"><span class="icon-search"/></button>
                        </span>
                    </div>
                </div>

                <label class="col-lg-1 text-right">来源</label>

                <div class="col-lg-2">
                    <form:select path="source.id" items="${sources}" itemLabel="name" itemValue="id" cssClass="form-control">
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

            <div class="row controls-row body-content">
                <label class="col-lg-1 text-right">最低价</label>

                <div class="col-lg-2">
                    <form:input id="lowAmount" path="lowAmount" cssClass="form-control"></form:input>
                </div>
                <label class="col-lg-1 text-center">最高价</label>

                <div class="col-lg-2">
                    <form:input path="highAmount" cssClass="form-control"></form:input>
                </div>
            </div>
            <div class="row controls-row body-content">
                <label class="col-lg-1 text-right">详情</label>

                <div class="col-lg-11">
                    <form:textarea path="des" cssClass="form-control" rows="5"></form:textarea>
                </div>
            </div>

            <div class="row body-content controls-row">
                <label class="col-lg-1 text-right">状态</label>

                <div class="col-lg-2">
                    <form:input path="status" cssClass="form-control" readonly="true"></form:input>
                </div>
                <label class="col-lg-1 text-right">创建日期</label>

                <div class="col-lg-2">
                    <form:input path="createdDate" readonly="true" cssClass="form-control"></form:input>
                </div>

                <c:if test="${leads.status == 'CLOSED'}">

                <label class="col-lg-1 text-right">关闭原因</label>

                <div class="col-lg-2">
                    <form:select path="closedReason.id" items="${closedReasons}" itemValue="id" itemLabel="name"
                                 cssClass="form-control"></form:select>
                </div>

                <label class="col-lg-1 text-right">关闭时间</label>

                <div class="col-lg-2">
                    <form:input path="lastModifiedDate" cssClass="form-control"></form:input>
                </div>
            </div>

            <div class="row controls-row body-content">
                <label class="col-lg-1 text-right">关闭详情</label>

                <div class="col-lg-11">
                    <form:textarea path="closeReasonDetail" cssClass="form-control" rows="3"></form:textarea>
                </div>
            </div>
            </c:if>
        </fieldset>
        <div class="row controls-row body-content form-action">
            <div class="col-lg-11 col-lg-offset-1">
                <c:if test="${operation == 'add' || operation == 'edit'}">
                    <input type='submit' class="btn btn-primary" value="保存">
                </c:if>
                <c:if test="${operation == 'view' || operation == 'edit'}">
                    <a href="${ctx}/sale/leads/${leads.id}/action/index" class="btn btn-primary">查看销售活动</a>
                </c:if>

                <a href="${ctx}/sale/leads/index" class="btn btn-default">返回</a>
            </div>
        </div>

    </form:form>
</div>
<script type="text/javascript">
    require(['sale/leads'],function(controller){

    });

</script>
