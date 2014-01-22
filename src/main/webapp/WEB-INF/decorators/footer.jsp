<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-11-12
  Time: 下午9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="url" value="${pageContext.request.servletPath}"/>
<footer>

</footer>
<script type="text/javascript">
    require(['domReady!', 'jquery', 'admin/main'], function (domReady, $, main) {
        main.activeBar("${url}");
    });
</script>