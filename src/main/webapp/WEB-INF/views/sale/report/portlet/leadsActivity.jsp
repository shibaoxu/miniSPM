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
<div id="leadsActivityPortlet" class="portlet">
    <div class="portlet-caption row body-content">
        <div class="portlet_title col-lg-6"><h5>线索及机会活跃度</h5></div>
        <div class="col-lg-3">
        </div>
        <div class="portlet_subtitle span3"><h5><a class="period active" value="WEEK" href="#">周</a>|<a class="period"
                                                                                                        value="MONTH"
                                                                                                        href="#">月</a>|
            <a class="period" value="ALL" href="#">总</a></h5></div>
    </div>
    <div class="portlet-content">
        <table id="leadsActivity" class="table table-striped table-hover table-condensed">
            <tbody>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">

    $('#leadsActivityPortlet a.period').click(function () {
        $('#leadsActivityPortlet a.period').removeClass("active");
        $(this).addClass("active");
        getLeadsActivityPortlet();
        return false;
    });

    function getLeadsActivityPortlet() {
        $('#leadsActivity tbody').html("");
        var period = $('#leadsActivityPortlet a.period.active').attr("value");
        $.getJSON("${ctx}/sale/report/portlet/leadsActivity/" + period, function (data) {
            $.each(data, function (index, item) {
                $("<TR><TD>" + item[0] + "</TD><TD>" + item[1] + "</TD><TD>" + item[2] +"</TD></TR>").appendTo($('#leadsActivity tbody'));
            });
        });
    }
    getLeadsActivityPortlet();
</script>