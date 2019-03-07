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
                <h3>Dane osobowe</h3>

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
                <a href="<c:url value="/app/profile/edit"/>" class="btn btn--highlighted">Edytuj dane osobowe</a>

                <c:forEach items="${currentUser.addresses}" var="address" varStatus="loop">
                    <h3>Adres ${loop.count}</h3>
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
                    <span><a class="btn btn--small" href="<c:url value="/app/profile/edit/${address.id}"/>"
                             role="button">
                        Edytuj</a>
                    <a class="btn btn--small" href="<c:url value="/app/profile/delete/${address.id}"/>"
                       role="button">
                        Usuń</a>
                        </span>
                </c:forEach>
            </div>
        </div>
    </section>
</header>
<jsp:include page="components/footer.jsp"/>