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
    <h2>Zresetuj hasło</h2>
    <form>
        <div class="form-group">
            <h3>Podaj adres e-mail, na który mamy wysłać link resetujący hasło</h3>
            <input name="email" type="email" placeholder="E-mail"/>
        </div>
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Wyślij</button>
        </div>
    </form>
</section>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>