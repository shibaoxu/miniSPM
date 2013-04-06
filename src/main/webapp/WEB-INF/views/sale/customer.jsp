<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-1-22
  Time: 下午12:38
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
        $(document).ready(function(){
            $('#customer_form').validate({
                errorLabelContainer:$("div#error"),
                rules:{
                    name:"required"
                },
                messages:{
                    name:'客户名称必须输入'
                },
                wrapper:"li",
                errorElement: "em"
            });
        })
    </script>
</head>
<body>
<div class="row-fluid">
    <form:form commandName="customer" id='customer_form' cssClass="form-horizontal">
        <fieldset>
            <legend><h3><i class="icon-shopping-cart"></i>&nbsp客户:${customer.name}</h3></legend>
            <div id='error' class="error alert alert-block hide"></div>
            <form:hidden path="id"></form:hidden>
            <div class="control-group">
                <label class="control-label" for="customer_name">名称</label>

                <div class="controls">
                    <form:input id='customer_name' path="name" cssClass="span5"></form:input>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="customer_industry">行业</label>

                <div class="controls">
                    <form:select path="industry.id" id='customer_industry' items="${industries}" itemLabel="name"
                                 itemValue="id"></form:select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="customer_scale">规模</label>

                <div class="controls">
                    <form:select path="scale.id" id='customer_scale' items="${scales}" itemLabel="name"
                                 itemValue="id"></form:select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="customer_ownerShip">所有制</label>

                <div class="controls">
                    <form:select path="ownership.id" id='customer_ownerShip' items="${ownerships}" itemLabel="name"
                                 itemValue="id"></form:select>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <label><form:checkbox path="develop"></form:checkbox>&nbsp;新客户</label>
                </div>
            </div>

            <%--<div class="control-group">--%>
                <%--<div class="controls">--%>
                    <%--<label><form:checkbox path="important"></form:checkbox>&nbsp;重要</label>--%>
                <%--</div>--%>
            <%--</div>--%>

            <div class="control-group">
                <label class="control-label" for="customer_des">备注</label>

                <div class="controls">
                    <form:textarea path="des" id='customer_des' cssClass="span8" rows="8"></form:textarea>
                </div>
            </div>

            <div class="form-actions">
                <input class="btn btn-primary" type="submit" value="保存">
                <a class="btn" href="${ctx}/sale/customer/index">返回</a>
            </div>
        </fieldset>
    </form:form>
</div>

</body>
</html>