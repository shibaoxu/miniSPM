<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-5-27
  Time: 下午4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="corpsePortlet" class="portlet">
    <div class="portlet-caption row body-content">
        <div class="portlet_title col-md-6"><h5>僵尸(数字为未活动天数)</h5></div>
    </div>
    <div class="portlet-content">
        <table id="corpse" class="table table-striped table-hover table-condensed">
            <tbody>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">

    require(['jquery'], function($){
        function getCorpsePortlet() {
            $('#corpse tbody').html("");
            $.getJSON("${ctx}/sale/report/portlet/corpse", function (data) {
                $.each(data, function (index, item) {
                    $("<TR><TD>" + item[0] + "</TD><TD>" +  item[1] + "</TD><TD>" + item[2] + "</TD></TR>").appendTo($('#corpse tbody'));
                });
            });
        }
        getCorpsePortlet();
    });

</script>