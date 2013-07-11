<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-16
  Time: 下午5:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="row-fluid portlet-row">
    <div class="span4">
        <jsp:include page="./report/portlet/saleActivity.jsp"></jsp:include>
    </div>
    <div class="span4">
        <jsp:include page="./report/portlet/customerActivity.jsp"></jsp:include>
    </div>

</div>

<div class="row-fluid portlet-row">
    <div class="span6">
        <jsp:include page="./report/portlet/leadsActivity.jsp"></jsp:include>
    </div>

    <div class="span6">
        <jsp:include page="./report/portlet/corpse.jsp"></jsp:include>
    </div>
</div>
<div class="row-fluid portlet-row">
    <div class="span6">
        <jsp:include page="./report/portlet/newLeads.jsp"></jsp:include>
    </div>

    <div class="span6">
        <jsp:include page="./report/portlet/newOpportunity.jsp"></jsp:include>
    </div>
</div>

</body>
</html>