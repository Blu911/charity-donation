<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
                <p>
                    <strong>Nr mieszkania:</strong>
                    <span> ${address.flatNumber}</span>
                </p>
                <p>
                    <strong>Nr domu:</strong>
                    <span> ${address.houseNumber}</span>
                </p>
                <p>
                    <strong>Ulica:</strong>
                    <span> ${address.street}</span>
                </p>
                <p>
                    <strong>Miasto:</strong>
                    <span> ${address.city}</span>
                </p>
                <p>
                    <strong> Kod pocztowy:</strong>
                    <span> ${address.zipCode}</span>
                </p>
                <button type="submit" class="btn btn--highlighted" role="button">
                    Usuń adres
                </button>
                </form:form>
            </div>
            <a class="btn" href="<c:url value="/app/profile"/>" role="button">
                Powrót</a>
        </div>
    </section>
</header>
<jsp:include page="../components/footer.jsp"/>
