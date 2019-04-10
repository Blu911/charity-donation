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
                       modelAttribute="currentUser" role="form" cssClass="steps--item">
                <div class="steps--item">
                    <h3>Dołączono <javatime:format value="${currentUser.created}" style="MM"/></h3>
                    <div class="form-group">
                        <p class="form-section--columns form-section">
                            <label>Imię <form:errors path="userFirstName"/></label>
                        </p>
                        <p>
                            <form:input path="userFirstName"/>
                        </p>
                        <p class="form-section--columns form-section">
                            <label>Nazwisko <form:errors path="userLastName"/></label>
                        </p>
                        <p>
                            <form:input path="userLastName"/>
                        </p>
                        <p class="form-section--columns">
                            <label>E-mail <form:errors path="email"/></label>
                        </p>
                        <p>
                            <form:input path="email"/>
                        </p>
                        <p class="form-section--columns">
                            <label>Telefon <form:errors path="phoneNumber"/></label>
                        </p>
                        <p>
                            <form:input path="phoneNumber"/>
                        </p>
                        <p class="form-section--columns">
                            <label>Login <form:errors path="username"/></label>
                        </p>
                        <p>
                            <form:input path="username"/>
                        </p>
                        <p class="form-section--columns">
                            <label>Hasło <form:errors path="password"/></label>
                        </p>
                        <p>
                            <form:input path="password" type="password"/>
                        </p>
                        <button type="submit" class="btn btn-primary btn-warning">Edytuj</button>
                        <a class="btn" href="<c:url value="/app/profile"/>" role="button">
                            Powrót</a>
                    </div>
                </div>
            </form:form>
        </div>
    </section>
</header>
<jsp:include page="../components/footer.jsp"/>
