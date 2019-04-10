<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<jsp:include page="components/head.jsp"/>
<body>
<header class="header--main-page">
    <jsp:include page="components/navigation.jsp"/>

    <div class="slogan container container--90" id="start">
        <div class="slogan--item">
            <h1>
                Zacznij pomagać!<br/>
                Oddaj niechciane rzeczy w zaufane ręce
            </h1>

            <ul class="slogan--buttons">
                <li><a href="<c:url value="/login"/>" class="btn btn--large">Zaloguj się</a></li>
                <li><a href="<c:url value="/register"/>" class="btn btn--large">Załóż konto</a></li>
            </ul>
        </div>
    </div>
</header>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
