<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-15
  Time: 下午2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>miniSPM<sitemesh:title/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <%--<link rel="shortcut icon" href="${ctx}/static/images/favicon.ico" />--%>
    <link rel="shortcut icon" href="${ctx}/static/images/logo.png" />
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/awesome/css/font-awesome.css" rel="stylesheet">

    <script src="static/require/require.js"></script>

    <sitemesh:head/>
</head>

<body>


<%@ include file="/WEB-INF/decorators/header.jsp" %>

<sitemesh:body/>

<%@ include file="/WEB-INF/decorators/footer.jsp" %>
</body>
</html>