<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Oddam w dobre ręce</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<header>
        <nav class="container container--70">
            <ul class="nav--actions">
                <li><a href="<c:url value="/login"/>" class="btn btn--small btn--without-border">Zaloguj</a></li>
                <li><a href="<c:url value="/register"/>" class="btn btn--small btn--without-border">Załóż konto</a></li>
            </ul>
            <ul>
                <li><a href="<c:url value="/start"/>" class="btn btn--without-border">Start</a></li>
                <li><a href="<c:url value="/info"/>" class="btn btn--without-border">O co chodzi?</a></li>
                <li><a href="<c:url value="/about-us"/>" class="btn btn--without-border">O nas</a></li>
                <li><a href="<c:url value="/institutions"/>" class="btn btn--without-border">Fundacje i organizacje</a></li>
                <li><a href="<c:url value="/contact"/>" class="btn btn--without-border">Kontakt</a></li>
            </ul>
        </nav>
</header>