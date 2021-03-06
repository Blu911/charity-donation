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
    <h2>${message}</h2>
    <form:form method="post" modelAttribute="password">
        <div class="form-group">
            <form:input path="passwordNew" type="password" placeholder="Nowe hasło"/>
        </div>
        <div class="form-group">
            <h3>Powtórz nowe hasło</h3>
            <form:input path="passwordNewConfirm" type="password" placeholder="Nowe hasło"/>
        </div>
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Wyślij</button>
        </div>
    </form:form>
</section>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>