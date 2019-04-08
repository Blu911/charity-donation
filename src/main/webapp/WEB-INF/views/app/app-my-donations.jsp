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
                    <table class="table" id="myDonationsTable">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col" onclick="sortTable(0)">Data utworzenia <i class="arrow down"></i></th>
                            <th scope="col" onclick="sortTable(1)">Status <i class="arrow down"></i></th>
                            <th scope="col" onclick="sortTable(2)">Data odebrania <i class="arrow down"></i></th>
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