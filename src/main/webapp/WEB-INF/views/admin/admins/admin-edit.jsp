<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>

<jsp:include page="../components/head.jsp"/>
<jsp:include page="../components/navbar.jsp"/>
<jsp:include page="../components/sidebar.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="<c:url value="/admin"/>">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">Administratorzy / Dane Administratora</li>
        </ol>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Administratorzy</h1>
        </div>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Edytuj Administratora
                    <a class="btn btn-primary pull-right" href="<c:url value="/admin/admins"/>" role="button">
                        Powrót</a>
                </div>
                <div class="panel-body">
                    <form:form method="post"
                               modelAttribute="admin" role="form">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Imię</label>
                                <form:input path="userFirstName" class="form-control"/>
                                <form:errors path="userFirstName" class="form-group has-error"/>
                            </div>
                            <div class="form-group">
                                <label>Nazwisko</label>
                                <form:input path="userLastName" class="form-control"/>
                                <form:errors path="userLastName" class="form-group has-error"/>

                            </div>
                            <div class="form-group">
                                <label>E-mail</label>
                                <form:input path="email" class="form-control"/>
                                <form:errors path="email" class="form-group has-error"/>
                            </div>
                            <div class="form-group">
                                <label>Telefon</label>
                                <form:input path="phoneNumber" class="form-control"/>
                                <form:errors path="phoneNumber" class="form-group has-error"/>
                            </div>
                            <div class="form-group">
                                <label>Login</label>
                                <form:input path="username" class="form-control"/>
                                <form:errors path="username" class="form-group has-error"/>
                            </div>
                            <div class="form-group">
                                <label>Hasło</label>
                                <form:input path="password" type="password" class="form-control"/>
                                <form:errors path="password" class="form-group has-error"/>
                            </div>
                            <button type="submit" class="btn btn-primary btn-warning">Edytuj</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div><!-- /.panel-->
    </div><!-- /.col-->


<jsp:include page="../components/footer.jsp"/>