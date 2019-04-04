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

            <p>
                <strong>Data utworzenia</strong>
                <span> <javatime:format value="${donation.created}" style="MM"/></span>
            </p>
            <p>
                <strong>Nazwa instytucji</strong>
                <span> ${donation.institutionDetails.institutionType.name} ${donation.institutionDetails.institutionName}</span>
            </p>
            <p>
                <strong>Ilość worków</strong>
                <span> ${donation.quantity}</span>
            </p>
            <p>
                <strong>Status</strong>
                <span> ${currentUser.email}</span>
            </p>
            <p>
                <strong>Data odebrania</strong>
                <span> ${currentUser.phoneNumber}</span>
            </p>
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