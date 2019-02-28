<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="container container--70">
    <ul class="nav--actions">
        <li class="logged-user">
            Witaj USER
            <ul class="dropdown">
                <li><a href="#">Panel</a></li>
                <li><a href="#">Administratorzy</a></li>
                <li><a href="#">Użytkownicy</a></li>
                <li><a href="#">Instytucje</a></li>
                <li><a href="#">Dary</a></li>
                <li><a href="#">Wyloguj</a></li>
            </ul>
        </li>
    </ul>

    <ul>
        <li><a href="<c:url value="/"/>" class="btn btn--without-border">Start</a></li>
        <li><a href="<c:url value="/steps"/>" class="btn btn--without-border">O co chodzi?</a></li>
        <li><a href="<c:url value="/about-us"/>" class="btn btn--without-border">O nas</a></li>
        <li><a href="<c:url value="/help"/>" class="btn btn--without-border">Fundacje i organizacje</a></li>
        <li><a href="<c:url value="/contact"/>" class="btn btn--without-border">Kontakt</a></li>
    </ul>
</nav>