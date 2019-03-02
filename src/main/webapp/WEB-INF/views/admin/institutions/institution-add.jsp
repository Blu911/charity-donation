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
            <li class="active">Instytucje / Dodaj Instytucję</li>
        </ol>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Instytucje</h1>
        </div>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Dodaj Instytucję
                    <a class="btn btn-primary pull-right" href="<c:url value="/admin/institutions"/>" role="button">
                        Powrót</a>
                </div>
                <div class="panel-body">
                    <form:form method="post"
                               modelAttribute="user" role="form">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Nazwa</label>
                                <form:input path="institutionName" class="form-control"/>
                                <form:errors path="institutionName" class="form-group has-error"/>
                            </div>
                            <div class="form-group">
                                <label>E-mail</label>
                                <form:input path="email" class="form-control"/>
                                <form:errors path="email" class="form-group has-error"/>
                            </div>
                            <div class="form-group">
                                <label>Login</label>
                                <form:input path="username" class="form-control"/>
                                <form:errors path="username" class="form-group has-error"/>
                            </div>
                            <div class="form-group">
                                <label>Hasło</label>
                                <form:input path="password" class="form-control"/>
                                <form:errors path="password" class="form-group has-error"/>
                            </div>
                            <button type="submit" class="btn btn-primary btn-success">Dodaj</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div><!-- /.panel-->
    </div><!-- /.col-->
</div>

<jsp:include page="../components/footer.jsp"/>