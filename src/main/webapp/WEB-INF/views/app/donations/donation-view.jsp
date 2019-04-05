<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<jsp:include page="../components/head.jsp"/>
<header class="header--form-page">
    <jsp:include page="../components/navbar-app.jsp"/>
    <section class="steps">
        <div class="steps--item">
            <h3>Darowizna</h3>

            <div class="panel panel-default">
                <div class="panel-body">
                    <table class="table">
                        <tbody>
                        <tr>
                            <th>Data utworzenia</th>
                            <td><javatime:format value="${donation.created}" style="MM"/></td>
                        </tr>
                        <tr>
                            <th>Nazwa instytucji</th>
                            <td>${donation.institutionDetails.institutionType.name} ${donation.institutionDetails.institutionName}</td>
                        </tr>
                        <tr>
                            <th>Ilość worków</th>
                            <td>${donation.quantity}</td>
                        </tr>
                        <tr>
                            <th>Ilość worków</th>
                            <td>${donation.quantity}</td>
                        </tr>
                        <tr>
                            <th>Ilość worków</th>
                            <td>${donation.quantity}</td>
                        </tr>
                        <tr>
                            <th>Status</th>
                            <td>
                                <c:choose>
                                    <c:when test="${donation.deliveryStatus}">Odebrano</c:when>
                                    <c:otherwise>Nieodebrano</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>Data odebrania</th>
                            <td><javatime:format value="${donation.deliveryDate}" style="MM"/></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <c:choose>
                <c:when test="${not donation.deliveryStatus}">
                    <a class="btn btn--highlighted" href="<c:url value="/app/donations/confirm/${donation.id}"/>"
                       role="button">Potwierdź
                        odbiór</a>
                </c:when>
            </c:choose>
            <a class="btn" href="<c:url value="/app/donations"/>" role="button">
                Powrót</a>
        </div>
    </section>
</header>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>