<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>

<jsp:include page="components/head.jsp"/>
<body>
<header class="header--form-page">
    <jsp:include page="components/navbar-app.jsp"/>
    <section class="steps" id="steps">
        <h2>Twój Profil</h2>
        <div>
            <div class="steps--item">
                <h3>Dołączono <javatime:format value="${currentUser.created}" style="MM"/></h3>

                <p>
                    <strong>Imię</strong>
                    <span> ${currentUser.userFirstName}</span>
                </p>
                <p>
                    <strong>Nazwisko</strong>
                    <span> ${currentUser.userLastName}</span>
                </p>
                <p>
                    <strong>Login</strong>
                    <span> ${currentUser.username}</span>
                </p>
                <p>
                    <strong>Email</strong>
                    <span> ${currentUser.email}</span>
                </p>
                <p>
                    <strong>Numer telefonu</strong>
                    <span> ${currentUser.phoneNumber}</span>
                </p>
                <p>
                    <strong>Adres</strong>
                    <c:forEach items="${currentUser.addresses}" var="address" varStatus="loop">
                        Nr mieszkania: ${address.flatNumber},
                        Nr domu: ${address.houseNumber},
                        Ulica: ${address.street},
                        Miasto: ${address.city},
                        Kod pocztowy: ${address.zipCode}
                    </c:forEach>
                </p>
                <a href="<c:url value="/app/profile/edit"/>" class="btn btn--highlighted">Edytuj</a>
            </div>
        </div>
    </section>
</header>
<jsp:include page="components/footer.jsp"/>