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
<ol class="breadcrumb">
    <li><a href="${ctx}/index">首页</a></li>
    <li><a href="${ctx}/sale/index">销售</a></li>
    <c:if test="${type == 'opportunity'}">
        <li><a href="${ctx}/sale/opportunity/index">销售机会</a></li>
    </c:if>
    <c:if test="${type == 'leads'}">
        <li><a href="${ctx}/sale/leads/index">销售线索</a></li>
    </c:if>

    <li><a href="${ctx}/sale/${type}/view/${leadsBase.id}">${leadsBase.name}</a></li>
    <li><a href="${ctx}/sale/${type}/${leadsBase.id}/action/index">销售活动</a></li>
    <li><a href="">${action.brief}</a></li>
</ol>

<div>
    <form:form commandName="action" cssClass="form-horizontal" id="action_form">
        <fieldset>
            <form:hidden path="id"></form:hidden>
            <form:hidden path="leadsBase.id"></form:hidden>
            <div id='error' class="alert alert-warning hidden"></div>
            <div class="form-group">
                <label class="control-label col-lg-2" for="action_type">活动类型</label>

                <div class="col-lg-4">
                    <form:select id='action_type' path="actionType.id" items="${actionTypes}" itemLabel="name"
                                 itemValue="id" cssClass="form-control"></form:select>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="action_brief">简述</label>

                <div class="col-lg-4">
                    <form:input id='action_brief' path="brief"
                                cssClass="form-control"></form:input>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" for="action_occur_date">发生时间</label>

                <div class="col-lg-2">
                    <form:input path="occurDate" cssClass="datepicker form-control" id='action_occur_date'
                                readonly="true"></form:input>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label" for="action_owner">所有者</label>

                <div class="col-lg-2">
                    <form:select path="owner.id" id='action_owner' items="${users}" itemLabel="name"
                                 itemValue="id" cssClass="form-control"></form:select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" for="action_customer_participants">客户方参入者</label>

                <div class="col-lg-4">
                    <form:input path="customerParticipants" cssClass="form-control"
                                id='action_customer_participants'></form:input>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" for="action_self_participants">我方参入者</label>

                <div class="col-lg-4">
                    <form:input path="selfParticipants" cssClass="form-control"
                                id='action_self_participants'></form:input>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-2 col-lg-offset-2">
                    <div class="checkbox">
                        <label><form:checkbox path="milestone"></form:checkbox>&nbsp;里程碑事件</label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-2" for="action_detail">详情</label>

                <div class="col-lg-8">
                    <form:textarea path="detail" id='action_detail' cssClass="form-control" rows="7"></form:textarea>
                </div>
            </div>
            <div class="row controls-row form-action">
                <div class="col-lg-10 col-lg-offset-2">
                <c:if test="${operation == 'add' || operation == 'edit'}">
                    <input class="btn btn-primary" type="submit" value="保存">
                </c:if>
                <a class="btn btn-default" href="${ctx}/sale/${type}/${action.leadsBase.id}/action/index">返回</a>
                </div>
            </div>
        </fieldset>
    </form:form>
</div>
<script type="text/javascript">
    require(['sale/action'],function(controller){

    });
</script>
