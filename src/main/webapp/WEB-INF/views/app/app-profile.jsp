<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>

<jsp:include page="components/head.jsp"/>
<body>
<header class="header--form-page">
    <jsp:include page="components/navbar-app.jsp"/>
    <section class="steps">
        <div class="steps--item">
            <h3>Dane osobowe</h3>

            <div class="panel panel-default">
                <div class="panel-body">
                    <table class="table">
                        <tbody>
                        <tr>
                            <th>Imię</th>
                            <td>${currentUser.userFirstName}</td>
                        </tr>
                        <tr>
                            <th>Nazwisko</th>
                            <td>${currentUser.userLastName}</td>
                        </tr>
                        <tr>
                            <th>Login</th>
                            <td>${currentUser.username}</td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td>${currentUser.email}</td>
                        </tr>
                        <tr>
                            <th>Numer telefonu</th>
                            <td>${currentUser.phoneNumber}</td>
                        </tr>
                        </tbody>
                    </table>
                    <a href="<c:url value="/app/profile/edit"/>" class="btn btn--small">Edytuj dane osobowe</a>
                    </br>
                    <a class="btn btn--small" href="<c:url value="/app/profile/add"/>"
                       role="button">Dodaj nowy adres</a>

                    <c:forEach items="${currentUser.addresses}" var="address" varStatus="loop">
                        <h3>Adres ${loop.count}</h3>
                        <table class="table">
                            <tbody>
                            <tr>
                                <th>Nr mieszkania</th>
                                <td>${address.flatNumber}</td>
                            </tr>
                            <tr>
                                <th>Nr domu</th>
                                <td>${address.houseNumber}</td>
                            </tr>
                            <tr>
                                <th>Ulica</th>
                                <td>${address.street}</td>
                            </tr>
                            <tr>
                                <th>Miasto</th>
                                <td>${address.city}</td>
                            </tr>
                            <tr>
                                <th>Kod pocztowy</th>
                                <td>${address.zipCode}</td>
                            </tr>
                            </tbody>
                        </table>
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