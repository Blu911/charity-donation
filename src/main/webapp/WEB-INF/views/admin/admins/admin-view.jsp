<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<jsp:include page="../components/header.jsp"/>
<body>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span></button>
            <a class="navbar-brand" href="<c:url value="/home"/>"><span>E-</span>Instruktor</a>
            <div class="navbar-nav nav-pills">
                <ul class="nav navbar-top-links ">
                    <li><a href="<c:url value="/home"/>">
                        <span><strong>Strona główna</strong></span>
                    </a>
                    </li>
                </ul>
            </div>
            <div class="navbar-nav nav-pills">
                <ul class="nav navbar-top-links ">
                    <li><a href="<c:url value="/login"/>">
                        <span><strong>Zaloguj</strong></span>
                    </a>
                    </li>
                </ul>
            </div>
            <div class="navbar-nav navbar-right nav-pills">
                <ul class="nav navbar-top-links navbar-right">
                    <li><a href="<c:url value="/panel"/>">
                        <span><strong>Panel Instruktora</strong></span>
                    </a>
                    </li>
                </ul>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</nav><!--/.navbar-->

<div class="col-lg-12">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="<c:url value="/home"/>">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">Strona główna</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Oferty</h1>
        </div>
    </div><!--/.row-->
    <div class="panel panel-default">
        <div class="panel-heading">
            Dodano: <javatime:format value="${offer.created}" style="MM"/>
        </div>
        <div class="panel-body">
            <form class="form-horizontal" action="" method="post">
                <fieldset>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Tytuł</label>
                        <div class="col-md-9">
                            ${offer.title}
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">Minuty</label>
                        <div class="col-md-9">
                            ${offer.minutes}
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Cena</label>
                        <div class="col-md-9">
                            ${offer.price}
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Kategoria</label>
                        <div class="col-md-9">
                            ${offer.category.name}
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">Opis</label>
                        <div class="col-md-9">
                            ${offer.description}
                        </div>
                    </div>
                    <div class="divider"></div>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<!-- /.col-->


<jsp:include page="../components/footer.jsp"/>