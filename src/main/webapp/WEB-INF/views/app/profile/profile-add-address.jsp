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
                            <label>Nr mieszkania <form:errors path="flatNumber"/></label>
                        </p>
                        <p>
                            <form:input path="flatNumber"/>
                        </p>
                        <p class="form-section--columns form-section">
                            <label>Nr domu <form:errors path="houseNumber"/></label>
                        </p>
                        <p>
                            <form:input path="houseNumber"/>
                        </p>
                        <p class="form-section--columns">
                            <label>Ulica <form:errors path="street"/></label>
                        </p>
                        <p>
                            <form:input path="street"/>

                        </p>
                        <p class="form-section--columns">
                            <label>Miasto <form:errors path="city"/></label>
                        </p>
                        <p>
                            <form:input path="city"/>

                        </p>
                        <p class="form-section--columns">
                            <label>Kod pocztowy <form:errors path="zipCode"/></label>
                        </p>
                        <p>
                            <form:input path="zipCode"/>
                        </p>
                        <button type="submit" class="btn">Dodaj</button>
                        <a class="btn" href="<c:url value="/app/profile"/>" role="button">
                            Powrót</a>
                    </div>
                </div>
            </form:form>
        </div>
    </section>
</header>
<jsp:include page="../components/footer.jsp"/>
