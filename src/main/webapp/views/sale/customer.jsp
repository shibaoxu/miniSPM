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
        $(document).ready(function () {
            $('#customer_form').validate({
                invalidHandler: function(event, validator){
                    if(validator.numberOfInvalids()){
                        $('div#error').removeClass('hidden');
                        $('div#error').show();
                    }else{
                        $('div#error').hide();
                    }
                },
                errorLabelContainer: $("div#error"),
                rules: {
                    name: "required"
                },
                messages: {
                    name: '客户名称必须输入'
                },
                wrapper: "li",
                errorElement: "em"
            });
        })
    </script>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="${ctx}/index">首页</a></li>
    <li><a href="${ctx}/sale/index">销售</a></li>
    <li><a href="${ctx}/sale/customer/index">客户</a></li>
    <li><a href="${ctx}/sale/customer/119">${customer.name}</a></li>
</ol>
<div>
    <form:form commandName="customer" id='customer_form' cssClass="form-horizontal">
        <fieldset>
            <div id='error' class="error alert alert-warning hidden"></div>
            <form:hidden path="id"></form:hidden>
            <div class="form-group">
                <label class="control-label col-lg-1 text-right" for="customer_name">名称</label>

                <div class="col-lg-4">
                    <form:input id='customer_name' path="name" cssClass="form-control"></form:input>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-1 text-right" for="customer_industry">行业</label>

                <div class="col-lg-4">
                    <form:select path="industry.id" id='customer_industry' items="${industries}" itemLabel="name"
                                 itemValue="id" cssClass="form-control"></form:select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-1 text-right" for="customer_scale">规模</label>

                <div class="col-lg-2">
                    <form:select path="scale.id" id='customer_scale' items="${scales}" itemLabel="name"
                                 itemValue="id" cssClass="form-control"></form:select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-1 text-right" for="customer_ownerShip">所有制</label>

                <div class="col-lg-2">
                    <form:select path="ownership.id" id='customer_ownerShip' items="${ownerships}" itemLabel="name"
                                 itemValue="id" cssClass="form-control"></form:select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-2 col-lg-offset-1">
                    <div class="checkbox">
                        <label><form:checkbox path="develop"></form:checkbox>新客户</label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-1 text-right" for="customer_des">备注</label>

                <div class="col-lg-8">
                    <form:textarea path="des" id='customer_des' cssClass="form-control" rows="8"></form:textarea>
                </div>
            </div>

        </fieldset>
        <div class="row controls-row body-content form-action">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="form-group">
                    <input class="btn btn-primary" type="submit" value="保存">
                    <a class="btn btn-default" href="${ctx}/sale/customer/index">返回</a>
                </div>
            </div>
        </div>
    </form:form>
</div>

</body>
</html>