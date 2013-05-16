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
//            $('#datepicker').datepicker();
//            $('#convertToOpportunityForm').validate({
//                errorLabelContainer: $("div#error"),
//                rules: {
//                    planDealDate: "required"
//                },
//                messages: {
//                    planDealDate: '必须指定预计签约时间'
//                },
//                wrapper: "li",
//                errorElement: "em"
//            });

        });
    </script>
</head>
<body>

<div class="row-fluid">
    <form action="#" method="post" id="closeLeads" class="form-horizontal">
        <fieldset>
            <legend><h3><i class="icon-star"></i>&nbsp关闭销售线索或销售机会</h3></legend>
            <div id="error" class="alert alert-block hide"></div>
            <input type="hidden" name="leadsId" value="${leadsBaseId}">

            <div class="control-group">
                <label class="control-label">关闭原因</label>

                <div class="controls">
                    <select name="closeReasonId">
                        <c:forEach items="${closeReasons}" var="reason">
                            <option value="${reason.id}">${reason.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="closeReasonDetail">关闭原因详情</label>

                <div class="controls">
                    <textarea id="closeReasonDetail" name="closeReasonDetail" rows="10" class="span12"></textarea>
                </div>
            </div>
            <div class="form-actions">
                <input class="btn btn-primary" type="submit" value="确定">
                <c:if test='${url == "leads"}'>
                    <a class="btn" href="${ctx}/sale/leads/index">返回</a>
                </c:if>
                <c:if test='${url == "opportunity"}'>
                    <a class="btn" href="${ctx}/sale/opportunity/index">返回</a>
                </c:if>


            </div>
        </fieldset>
    </form>
</div>
</body>
</html>