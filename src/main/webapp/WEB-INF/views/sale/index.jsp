<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-16
  Time: 下午5:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<div class="row portlet-row">
    <div class="col-lg-6">
        <jsp:include page="./report/portlet/saleActivity.jsp"></jsp:include>
    </div>
    <div class="col-lg-6">
        <jsp:include page="./report/portlet/customerActivity.jsp"></jsp:include>
    </div>

</div>

<div class="row portlet-row">
    <div class="col-lg-6">
        <jsp:include page="./report/portlet/leadsActivity.jsp"></jsp:include>
    </div>

    <div class="col-lg-6">
        <jsp:include page="./report/portlet/corpse.jsp"></jsp:include>
    </div>
</div>
<div class="row portlet-row">
    <div class="col-lg-6">
        <jsp:include page="./report/portlet/newLeads.jsp"></jsp:include>
    </div>

    <div class="col-lg-6">
        <jsp:include page="./report/portlet/newOpportunity.jsp"></jsp:include>
    </div>
</div>

</body>
</html>