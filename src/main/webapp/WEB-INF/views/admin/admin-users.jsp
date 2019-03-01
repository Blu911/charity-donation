<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>

<jsp:include page="components/head.jsp"/>
<jsp:include page="components/navbar.jsp"/>
<jsp:include page="components/sidebar.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="<c:url value="/admin"/>">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">Użytkownicy</li>
        </ol>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Użytkownicy</h1>
        </div>
    </div><!--/.row-->
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">Lista</div>
            <div class="panel-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Data utworzenia</th>
                        <th scope="col">Login</th>
                        <th scope="col">Imię</th>
                        <th scope="col">Nazwisko</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userList}" var="user" varStatus="loop">
                        <tr>
                            <th scope="row">${loop.count}</th>
                            <td><javatime:format value="${user.created}" style="MM"/></td>
                            <td>${user.username}</td>
                            <td>${user.userFirstName}</td>
                            <td>${user.userLastName}</td>
                            <td>
                                <form method="post">
                                    <a class="btn pull-right"
                                       href="<c:url value="/admin/users/delete/${user.id}"/>">Usuń</a>
                                    <a class="btn pull-right"
                                       href="<c:url value="/admin/users/block/${user.id}"/>">Zablokuj</a>
                                    <a class="btn pull-right"
                                       href="<c:url value="/admin/users/edit/${user.id}"/>">Edytuj</a>
                                    <a class="btn pull-right"
                                       href="<c:url value="/admin/users/view/${user.id}"/>">Wyświetl</a>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="components/footer.jsp"/>