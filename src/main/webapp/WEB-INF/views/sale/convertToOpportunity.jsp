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
            $('#convertToOpportunityForm').validate({
                errorLabelContainer: $("div#error"),
                rules: {
                    planDealDate: "required"
                },
                messages: {
                    planDealDate: '必须指定预计签约时间'
                },
                wrapper: "li",
                errorElement: "em"
            });

        });
    </script>
</head>
<body>

<div class="row-fluid">
    <form action="#" method="post" id="convertToOpportunityForm" class="form-horizontal">
        <fieldset>
            <legend><h3><i class="icon-star"></i>&nbsp创建销售机会</h3></legend>
            <div id="error" class="alert alert-block hide"></div>
            <input type="hidden" name="leadsId" value="${leadsId}">
            <div class="control-group">
                <label class="control-label" for="lowAmount">签约额下限</label>

                <div class="controls">
                    <input type="number" min="0" name="lowAmount" id="lowAmount" step="any" value="${lowAmount}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="highAmount">签约额上限</label>

                <div class="controls">
                    <input type="number" min="0" name="highAmount" id="highAmount" step="any" value="${highAmount}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="planDealDate">预计签约时间</label>

                <div class="controls">
                    <div class="input-append date" id="datepicker" data-date="${planDealDate}"
                         data-date-format="yyyy-mm-dd" data-date-autoclose="true">
                        <input type="text" required="required" name="planDealDate" class="span12" id='planDealDate'
                               readonly="true"/>
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <input class="btn btn-primary" type="submit" value="确定">
                <a class="btn" href="${ctx}/sale/leads/index">返回</a>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>