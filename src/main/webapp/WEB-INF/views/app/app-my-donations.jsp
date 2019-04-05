<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<jsp:include page="components/head.jsp"/>
<header class="header--form-page">
    <jsp:include page="components/navbar-app.jsp"/>
    <section class="steps">
        <h2>Moje dary</h2>
        <div class="help--slides active">
            <p>Komu pomogłeś? Poniżej znajdziesz listę instytucji, które otrzymały od Ciebie darowiznę. Dziękujemy!</p>
            <div class="panel panel-default">
                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Data utworzenia</th>
                            <th scope="col">Status</th>
                            <th scope="col">Data odebrania</th>
                            <th scope="col">Nazwa instytucji</th>
                            <th scope="col">Ilość worków</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${donations}" var="donation" varStatus="loop">
                            <tr>
                                <th scope="row">${loop.count}</th>
                                <td><javatime:format value="${donation.created}" style="MM"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${donation.deliveryStatus}">Odebrano</c:when>
                                        <c:otherwise>Nieodebrano</c:otherwise>
                                    </c:choose>
                                </td>
                                <td><javatime:format value="${donation.deliveryDate}" style="MM"/></td>
                                <td>${donation.institutionDetails.institutionType.name} ${donation.institutionDetails.institutionName}</td>
                                <td>${donation.quantity}</td>
                                <td>
                                        <a class="btn btn--small pull-right"
                                           href="<c:url value="/app/donations/view/${donation.id}"/>">Szczegóły</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</header>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>