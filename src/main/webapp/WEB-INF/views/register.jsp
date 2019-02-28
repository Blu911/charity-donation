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
    <h2>Załóż konto</h2>
    <form:form method="post"
               modelAttribute="user" role="form">
        <div class="form-group">
                <%--<input type="email" name="email" placeholder="Email"/>--%>
            <form:input path="email" type="email" placeholder="Email"/>
            <form:errors path="email"/>
        </div>
        <div class="form-group">
                <%--<input type="password" name="password" placeholder="Hasło"/>--%>
            <form:input path="password" type="password" placeholder="Hasło"/>
            <form:errors path="password"/>
        </div>
        <%--<div class="form-group">--%>
        <%--<input type="password" name="password2" placeholder="Powtórz hasło"/>--%>
        <%--</div>--%>

        <div class="form-group form-group--buttons">
            <a href="<c:url value="/login"/>" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>

<jsp:include page="components/footer.jsp"/>