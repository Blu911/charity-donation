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
            <li class="active">Darowizny / Szczegóły Darowizny</li>
        </ol>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Darowizny</h1>
        </div>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Szczegóły Darowizny
                    <a class="btn btn-primary pull-right" href="<c:url value="/admin/donations"/>" role="button">
                        Powrót</a>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" action="" method="post">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Id</label>
                                <div class="col-md-9">
                                    ${donation.id}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Od kogo</label>
                                <div class="col-md-9">
                                    ${donation.userDetails.username}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Dla kogo</label>
                                <div class="col-md-9">
                                    ${donation.institutionDetails.institutionType.name} ${donation.institutionDetails.institutionName}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Co przekazano</label>
                                <div class="col-md-9">
                                    <c:forEach items="${donation.whatToDonate}" var="gift" varStatus="loop">
                                        <li>${gift.name}</li>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Ilość worków</label>
                                <div class="col-md-9">
                                    ${donation.quantity}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Adres dostawy</label>
                                <div class="col-md-9">
                                    <li>Nr mieszkania: ${donation.pickUpAddress.flatNumber}</li>
                                    <li>Nr domu: ${donation.pickUpAddress.houseNumber}</li>
                                    <li>Ulica: ${donation.pickUpAddress.street}</li>
                                    <li>Miasto: ${donation.pickUpAddress.city}</li>
                                    <li>Kod pocztowy: ${donation.pickUpAddress.zipCode}</li>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Szczegóły dostawy</label>
                                <div class="col-md-9">
                                    <li>Data odbioru: ${donation.pickUpDate}</li>
                                    <li>Czas odbioru: ${donation.pickUpTime}</li>
                                    <li>Telefon kontaktowy: ${donation.pickUpPhoneNumber}</li>
                                    <li>Komentarz dla kuriera: ${donation.pickUpComment}</li>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../components/footer.jsp"/>