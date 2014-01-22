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
    <li><a href="${ctx}/sale/leads/index">销售线索</a></li>
    <li><a href="${ctx}/sale/leads/view/${leads.id}">${leads.name}</a></li>
    <li><a href='#'>转化成销售机会</a></li>
</ol>

<div>
    <form action="#" method="post" id="convertToOpportunityForm" class="form-horizontal">
        <fieldset>
            <div id="error" class="alert alert-block hide"></div>
            <input type="hidden" name="leadsId" value="${leadsId}">

            <div class="form-group">
                <label class="col-lg-2 control-label" for="lowAmount">签约额下限</label>

                <div class="col-lg-4">
                    <input class="form-control" type="number" min="0" name="lowAmount" id="lowAmount" step="any"
                           value="${lowAmount}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" for="highAmount">签约额上限</label>

                <div class="col-lg-4">
                    <input class="form-control" type="number" min="0" name="highAmount" id="highAmount" step="any"
                           value="${highAmount}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label" for="planDealDate">预计签约时间</label>

                <div class="col-lg-2">
                    <input type="text" required="required" name="planDealDate" class="form-control" id='planDealDate'
                           readonly="true" value="${planDealDate}"/>
                </div>
            </div>
            <div class="row form-action">
                <div class="col-lg-10 col-lg-offset-2">
                <input class="btn btn-primary" type="submit" value="确定">
                <a class="btn btn-default" href="${ctx}/sale/leads/index">返回</a>
                </div>
            </div>
        </fieldset>
    </form>
</div>
<script type="text/javascript">
    require(['sale/convert'],function(){
        ;
    });
</script>
