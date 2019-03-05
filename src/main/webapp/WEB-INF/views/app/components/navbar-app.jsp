<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="container container--70">
    <ul class="nav--actions">
        <li class="logged-user">
            Witaj ${currentUser.username}
            <ul class="dropdown">
                <li><a href="<c:url value="/app/profile"/>">Profil</a></li>
                <li><a href="#">Ustawienia</a></li>
                <li><a href="#">Moje zbiórki</a></li>
                <li><a href="<c:url value="/logout"/>">Wyloguj</a></li>
            </ul>
        </li>
    </ul>
    <ul>
        <li><a href="<c:url value="/app"/>" class="btn btn--without-border">Start</a></li>
        <li><a href="#steps" class="btn btn--without-border">O co chodzi?</a></li>
        <li><a href="#about" class="btn btn--without-border">O nas</a></li>
        <li><a href="#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
        <li><a href="#contact" class="btn btn--without-border">Kontakt</a></li>
    </ul>
</nav>