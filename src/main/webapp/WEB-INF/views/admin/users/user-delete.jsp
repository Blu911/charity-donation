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
            <li class="active">Administratorzy / Usuń Administratora</li>
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
                <div class="panel-heading">Usuń Administratora
                    <a class="btn btn-primary pull-right" href="<c:url value="/admin/admins"/>" role="button">
                        Powrót</a>
                </div>
                <div class="panel-body">
                    <form:form method="post"
                               modelAttribute="user" role="form">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Id</label>
                                    ${user.id}
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Login</label>
                                    ${user.username}
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Imię</label>
                                    ${user.userFirstName}
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Nazwisko</label>
                                    ${user.userLastName}
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">E-mail</label>
                                    ${user.email}
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Telefon</label>
                                    ${user.phoneNumber}
                            </div>
                            <button type="submit" class="btn btn-primary btn-danger">Usuń</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div><!-- /.panel-->
    </div><!-- /.col-->


<jsp:include page="../components/footer.jsp"/>