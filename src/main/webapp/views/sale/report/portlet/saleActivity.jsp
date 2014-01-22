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
<div id="saleActivityPortlet" class="portlet">
    <div class="portlet-caption row body-content">
        <div class="portlet_title col-lg-6"><h5>销售活跃度</h5></div>
        <div class="col-lg-3">
            <h5><a class="plate active" value="RED" href="#" style="color: red">高调</a>|<a class="plate" value="BLACK"
                                                                                         href="#"
                                                                                         style="color: black">低调</a></h5>
        </div>
        <div class="portlet_subtitle col-lg-3"><h5><a class="period active" value="WEEK" href="#">周</a>|<a class="period"
                                                                                                        value="MONTH"
                                                                                                        href="#">月</a>|<a
                class="period" value="ALL" href="#">总</a></h5></div>
    </div>
    <div class="portlet-content">
        <table id="saleActivity" class="table table-striped table-hover table-condensed">
            <tbody>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">
    require(['jquery','bootstrap'], function($){
        $('#saleActivityPortlet a.plate').click(function(){
            $('#saleActivityPortlet a.plate').removeClass("active");
            $(this).addClass("active");
            getSaleActivityPortlet();
            return false;
        });

        $('#saleActivityPortlet a.period').click(function(){
            $('#saleActivityPortlet a.period').removeClass("active");
            $(this).addClass("active");
            getSaleActivityPortlet();
            return false;
        });

        function getSaleActivityPortlet() {
            $('#saleActivity tbody').html("");
            var style = $('#saleActivityPortlet a.plate.active').attr("value");
            var period = $('#saleActivityPortlet a.period.active').attr("value");
            $.getJSON("${ctx}/sale/report/portlet/saleActivity/" + style + "/" + period, function (data) {
                $.each(data, function (index, item) {
                    $("<TR><TD>" + item[0] + "</TD><TD>" + item[1] + "</TD></TR>").appendTo($('#saleActivity tbody'));
                });
            });
        };
        getSaleActivityPortlet();
    });
</script>
