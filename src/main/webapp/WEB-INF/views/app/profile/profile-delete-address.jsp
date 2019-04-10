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
                <div class="panel panel-default">
                    <div class="panel-body">
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
                        <button type="submit" class="btn" role="button">
                            Usuń adres
                        </button>
                        <a class="btn" href="<c:url value="/app/profile"/>" role="button">
                            Powrót</a>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</header>
<jsp:include page="../components/footer.jsp"/>
