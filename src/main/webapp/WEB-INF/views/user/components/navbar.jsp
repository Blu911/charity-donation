<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span></button>
            <a class="navbar-brand" href="<c:url value="/admin"/>"><span>Admin</span>Panel</a>
            <div class="navbar-nav nav-pills">
                <ul class="nav navbar-top-links ">
                    <li><a href="<c:url value="/"/>">
                        <span><strong>Start</strong></span>
                    </a>
                    </li>
                </ul>
            </div>
            <div class="navbar-nav nav-pills">
                <ul class="nav navbar-top-links ">
                    <li><a href="<c:url value="/steps"/>">
                        <span><strong>O co chodzi?</strong></span>
                    </a>
                    </li>
                </ul>
            </div>
            <div class="navbar-nav nav-pills">
                <ul class="nav navbar-top-links ">
                    <li><a href="<c:url value="/about-us"/>">
                        <span><strong>O nas</strong></span>
                    </a>
                    </li>
                </ul>
            </div>
            <div class="navbar-nav nav-pills">
                <ul class="nav navbar-top-links ">
                    <li><a href="<c:url value="/help"/>">
                        <span><strong>Fundacje i organizacje</strong></span>
                    </a>
                    </li>
                </ul>
            </div>
            <div class="navbar-nav nav-pills">
                <ul class="nav navbar-top-links ">
                    <li><a href="<c:url value="/contact"/>">
                        <span><strong>Kontakt</strong></span>
                    </a>
                    </li>
                </ul>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</nav><!--/.navbar-->