<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-2-8
  Time: 上午8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.lang.Exception" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title></title>
</head>
<body>
    <div class="alert alert-error alert-block">
        <%
            Exception ex = (Exception)request.getAttribute("exception");
            String message = ex.getMessage();
            ex.printStackTrace(response.getWriter());
        %>

    </div>
</body>
</html>