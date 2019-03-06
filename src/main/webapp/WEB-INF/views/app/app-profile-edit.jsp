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
                       modelAttribute="user" role="form">
                <div class="steps--item">
                    <h3>Dołączono <javatime:format value="${user.created}" style="MM"/></h3>

                    <p>
                        <strong>Imię </strong>
                        <span><form:input path="userFirstName" class="form-control"/></span>
                        <span><form:errors path="userFirstName" class="form-group has-error"/></span>
                    </p>
                    <p>
                        <strong>Nazwisko </strong>
                        <form:input path="userLastName" class="form-control"/>
                        <form:errors path="userLastName" class="form-group has-error"/>
                    </p>
                    <p>
                        <strong>E-mail </strong>
                        <form:input path="email" class="form-control"/>
                        <form:errors path="email" class="form-group has-error"/>
                    </p>
                    <p>
                        <strong>Telefon </strong>
                        <form:input path="phoneNumber"/>
                        <form:errors path="phoneNumber"/>
                    </p>
                    <p>
                        <strong>Login </strong>
                        <form:input path="username"/>
                        <form:errors path="username"/>
                    </p>
                    <p>
                        <strong>Hasło </strong>
                        <form:input path="password" type="password"/>
                        <form:errors path="password"/>
                    </p>
                    <button type="submit" class="btn btn-primary btn-warning">Edytuj</button>
                </div>
            </form:form>
        </div>
    </section>
</header>
<jsp:include page="components/footer.jsp"/>
