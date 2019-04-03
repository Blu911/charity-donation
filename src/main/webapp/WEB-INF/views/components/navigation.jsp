<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="container container--70">
    <ul class="nav--actions">
        <li><a href="<c:url value="/login"/>" class="btn btn--small btn--without-border">Zaloguj</a></li>
        <li><a href="<c:url value="/register"/>" class="btn btn--small btn--highlighted">Załóż konto</a></li>
    </ul>
    <ul>
        <li><a href="<c:url value="/"/>" class="btn btn--without-border">Start</a></li>
        <li><a href="<c:url value="/steps"/>" class="btn btn--without-border">O co chodzi?</a></li>
        <li><a href="<c:url value="/about-us"/>" class="btn btn--without-border">O nas</a></li>
        <li><a href="<c:url value="/help"/>" class="btn btn--without-border">Fundacje i organizacje</a></li>
        <li><a href="<c:url value="/contact"/>" class="btn btn--without-border">Kontakt</a></li>
    </ul>

    <button onclick="topFunction()" id="myBtn" title="Go to top">Powrót</button>
</nav>