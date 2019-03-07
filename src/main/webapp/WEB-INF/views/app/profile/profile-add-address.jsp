<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../components/head.jsp"/>
<body>
<header class="header--form-page">
    <jsp:include page="../components/navbar-app.jsp"/>
    <section class="steps" id="steps">
        <h2>Twój Profil</h2>
        <div>
            <form:form method="post"
                       modelAttribute="address" role="form" cssClass="steps--item">
                <div class="steps--item">
                    <h3>Adres</h3>
                    <div class="form-group">
                        <p class="form-section--columns form-section">
                            <strong>Nr mieszkania </strong>
                            <form:input path="flatNumber"/>
                            <form:errors path="flatNumber"/>
                        </p>
                        <p class="form-section--columns form-section">
                            <strong>Nr domu </strong>
                            <form:input path="houseNumber"/>
                            <form:errors path="houseNumber"/>
                        </p>
                        <p class="form-section--columns">
                            <strong>Ulica </strong>
                            <form:input path="street"/>
                            <form:errors path="street"/>
                        </p>
                        <p class="form-section--columns">
                            <strong>Miasto </strong>
                            <form:input path="city"/>
                            <form:errors path="city"/>
                        </p>
                        <p class="form-section--columns">
                            <strong>Kod pocztowy </strong>
                            <form:input path="zipCode"/>
                            <form:errors path="zipCode"/>
                        </p>
                        <button type="submit" class="btn btn-primary btn-warning">Dodaj</button>
                    </div>
                </div>
            </form:form>
            <a class="btn" href="<c:url value="/app/profile"/>" role="button">
                Powrót</a>
        </div>
    </section>
</header>
<jsp:include page="../components/footer.jsp"/>
