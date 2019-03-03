<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <div class="profile-sidebar">
        <div class="profile-userpic">
            <img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
        </div>
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">${currentUser.username}</div>
            <div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="divider"></div>
    <ul class="nav menu">
        <li><a href="<c:url value="/admin"/>"><em class="fa fa-home">&nbsp;</em>Panel</a></li>
        <li><a href="<c:url value="/admin/admins"/>"><em class="fa fa-user">&nbsp;</em> Administratorzy</a></li>
        <li><a href="<c:url value="/admin/users"/>"><em class="fa fa-group">&nbsp;</em> Użytkownicy</a></li>
        <li><a href="<c:url value="/admin/institutions"/>"><em class="fa fa-building">&nbsp;</em> Instytucje</a></li>
        <li><a href="<c:url value="/admin/donations"/>"><em class="fa fa-gift">&nbsp;</em> Darowizny</a></li>
        <li>
            <form action="/logout" method="post">
                <input class="fa fa-id-badge" type="submit" value="Wyloguj">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </li>
    </ul>
</div>
<!--/.sidebar-->
