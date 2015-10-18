<%--
  Created by IntelliJ IDEA.
  User: dean
  Date: 10/18/15
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Config</title>
</head>
<body>
<c:forEach items="${vlansNames}" var="vlan">
  <c:out value="${vlan}" escapeXml="false" />
</c:forEach>

<c:forEach items="${vlansId}" var="vlanId">
  <c:out value="${vlanId}" escapeXml="false" />
</c:forEach>

<c:forEach items="${eapsList}" var="eaps">
  <c:out value="${eaps}" escapeXml="false" />
</c:forEach>

<c:forEach items="${nodesList}" var="node">
  <c:out value="${node}" escapeXml="false" />
</c:forEach>
</body>
</html>
