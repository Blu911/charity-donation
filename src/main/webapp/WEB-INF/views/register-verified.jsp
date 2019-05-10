<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>

<jsp:include page="components/head.jsp"/>
<body>
<header>
    <jsp:include page="components/navigation.jsp"/>
</header>
<section class="login-page">
    <h2>Gratulacje! Konto aktywowane!</h2>
    <a href="<c:url value="/login"/>" class="btn btn--small btn--without-border">Zaloguj</a>
</section>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>