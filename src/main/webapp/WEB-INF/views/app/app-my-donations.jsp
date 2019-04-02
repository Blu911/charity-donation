<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<jsp:include page="components/head.jsp"/>
<header class="header--form-page">
    <jsp:include page="components/navbar-app.jsp"/>

    <section class="help">
        <h2>Moje dary</h2>
        <div class="help--slides active">
            <p>Komu pomogłeś? Poniżej znajdziesz listę. Dziękujemy!</p>
            <ul class="help--slides-items">
                <c:forEach items="${donations}" var="donation">
                    <li>
                        <div class="col">
                            <div class="title"><javatime:format value="${donation.created}" style="MM"/></div>
                            <div class="subtitle">${donation.institutionDetails.institutionType.name} ${donation.institutionDetails.institutionName}</div>
                            <div class="subtitle">Ilość oddanych worków: ${donation.quantity} </div>
                        </div>

                        <div class="col">
                            <div class="text">szczegóły</div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </section>
</header>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>