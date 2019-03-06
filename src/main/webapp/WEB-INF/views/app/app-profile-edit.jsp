<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="components/head.jsp"/>
<body>
<header class="header--form-page">
    <jsp:include page="components/navbar-app.jsp"/>
    <section class="steps" id="steps">
        <h2>Twój Profil</h2>
        <div>
            <form:form method="post"
                       modelAttribute="currentUser" role="form" cssClass="steps--item">
                <div class="steps--item">
                    <h3>Dołączono <javatime:format value="${currentUser.created}" style="MM"/></h3>
                    <div class="form-group">
                        <p class="form-section--columns form-section">
                            <strong>Imię </strong>
                            <form:input path="userFirstName"/>
                            <form:errors path="userFirstName"/>
                        </p>
                        <p class="form-section--columns form-section">
                            <strong>Nazwisko </strong>
                            <form:input path="userLastName"/>
                            <form:errors path="userLastName"/>
                        </p>
                        <p class="form-section--columns">
                            <strong>E-mail </strong>
                            <form:input path="email"/>
                            <form:errors path="email"/>
                        </p>
                        <p class="form-section--columns">
                            <strong>Telefon </strong>
                            <form:input path="phoneNumber"/>
                            <form:errors path="phoneNumber"/>
                        </p>
                        <p class="form-section--columns">
                            <strong>Login </strong>
                            <form:input path="username"/>
                            <form:errors path="username"/>
                        </p>
                        <p class="form-section--columns">
                            <strong>Hasło </strong>
                            <form:input path="password" type="password"/>
                            <form:errors path="password"/>
                        </p>
                        <button type="submit" class="btn btn-primary btn-warning">Edytuj</button>
                    </div>
                </div>
            </form:form>
        </div>
    </section>
</header>
<jsp:include page="components/footer.jsp"/>
