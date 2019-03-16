<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../components/head.jsp"/>
<body>
<header class="header--form-page">
    <jsp:include page="../components/navbar-app.jsp"/>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Oddaj rzeczy, których już nie chcesz<br/>
                <span class="uppercase">potrzebującym</span>
            </h1>

            <div class="slogan--steps">
                <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
                <ul class="slogan--steps-boxes">
                    <li>
                        <div><em>1</em><span>Wybierz rzeczy</span></div>
                    </li>
                    <li>
                        <div><em>2</em><span>Spakuj je w worki</span></div>
                    </li>
                    <li>
                        <div><em>3</em><span>Wybierz fundację</span></div>
                    </li>
                    <li>
                        <div><em>4</em><span>Zamów kuriera</span></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Jeśli wiesz komu chcesz pomóc, możesz wpisać nazwę tej organizacji w
                wyszukiwarce. Możesz też filtrować organizacje po ich lokalizacji
                bądź celu ich pomocy.
            </p>
            <p data-step="4">
                Na podstawie Twoich kryteriów oraz rzeczy, które masz do oddania
                wybraliśmy organizacje, którym możesz pomóc. Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="5">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/5</div>

        <form:form method="post"
                   modelAttribute="donation">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                <div class="form-group form-group--checkbox ">
                    <form:checkboxes path="whatToDonate" items="${whatToDonate}"
                                     itemLabel="name" itemValue="id" cssClass="checkbox"/>
                    <form:errors path="whatToDonate"/>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
                        <form:input path="quantity" type="number" step="1" min="1" id="a"/>
                        <form:errors path="quantity"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <%--<!-- STEP 3 -->--%>
            <%--<div data-step="3">--%>
            <%--<h3>Lokalizacja:</h3>--%>

            <%--<div class="form-group form-group--dropdown">--%>
            <%--<select name="localization">--%>
            <%--<c:forEach items="${institutionAddresses}" var="address">--%>
            <%--<option value="city">${address.city}</option>--%>
            <%--</c:forEach>--%>
            <%--</select>--%>
            <%--</div>--%>

            <%--&lt;%&ndash;<div class="form-group form-group--dropdown">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<form:select path="institutionDetails.id">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<form:options items="${institutionAddresses}" itemLabel="city" itemValue="id"/>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</form:select>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--<div class="form-section">--%>
            <%--<h4>Komu chcesz pomóc?</h4>--%>
            <%--<div class="form-section--checkboxes">--%>
            <%--<c:forEach items="${helpsWho}" var="who">--%>
            <%--<div class="form-group form-group--checkbox">--%>
            <%--<label>--%>
            <%--<input type="checkbox" name="help[]" value="children"/>--%>
            <%--<span class="checkbox">${who.name}</span>--%>
            <%--</label>--%>
            <%--</div>--%>
            <%--</c:forEach>--%>
            <%--</div>--%>
            <%--</div>--%>

            <%--<div class="form-section">--%>
            <%--<h4>Wpisz nazwę konkretnej organizacji (opcjonalnie)</h4>--%>
            <%--<div class="form-group">--%>
            <%--<textarea rows="4" name="organization_search"></textarea>--%>
            <%--</div>--%>
            <%--</div>--%>

            <%--<div class="form-group form-group--buttons">--%>
            <%--<button type="button" class="btn prev-step">Wstecz</button>--%>
            <%--<button type="button" class="btn next-step">Szukaj</button>--%>
            <%--</div>--%>
            <%--</div>--%>

            <!-- STEP 4 -->
            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>
                <form:radiobuttons path="institutionDetails"
                                   items="${institutions}" itemLabel="institutionName" itemValue="id"/>
                <form:errors path="institutionDetails"/>
                    <%--<form:select path="institutionDetails" cssClass="form-group form-group--checkbox">--%>
                    <%--<form:options items="${institutions}" itemLabel="institutionName" itemValue="id"/>--%>
                    <%--</form:select>--%>

                    <%--<div class="form-group form-group--checkbox">--%>
                    <%--<label>--%>
                    <%--<input type="radio" name="organization" value="old"/>--%>
                    <%--<span class="checkbox radio"></span>--%>
                    <%--<span class="description">--%>
                    <%--<div class="title">Fundacja “Bez domu”</div>--%>
                    <%--<div class="subtitle">--%>
                    <%--Cel i misja: Pomoc dla osób nie posiadających miejsca--%>
                    <%--zamieszkania--%>
                    <%--</div>--%>
                    <%--</span>--%>
                    <%--</label>--%>
                    <%--</div>--%>

                    <%--<div class="form-group form-group--checkbox">--%>
                    <%--<label>--%>
                    <%--<input type="radio" name="organization" value="old"/>--%>
                    <%--<span class="checkbox radio"></span>--%>
                    <%--<span class="description">--%>
                    <%--<div class="title">Fundacja “Dla dzieci"</div>--%>
                    <%--<div class="subtitle">--%>
                    <%--Cel i misja: Pomoc osobom znajdującym się w trudnej sytuacji--%>
                    <%--życiowej.--%>
                    <%--</div>--%>
                    <%--</span>--%>
                    <%--</label>--%>
                    <%--</div>--%>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Numer mieszkania <form:input path="pickUpAddress.houseNumber" type="number"
                                                                 name="houseNumber" step="1" min="0"/>
                                <form:errors path="pickUpAddress.houseNumber"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Numer domu <form:input path="pickUpAddress.flatNumber" type="number"
                                                           name="flatNumber" step="1" min="0"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Ulica <form:input path="pickUpAddress.street" type="text" name="address"/> </label>
                            <form:errors path="pickUpAddress.street"/>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto <form:input path="pickUpAddress.city" type="text" name="city"/> </label>
                            <form:errors path="pickUpAddress.city"/>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy <form:input path="pickUpAddress.zipCode" type="text" name="postcode"/>
                            </label>
                            <form:errors path="pickUpAddress.zipCode"/>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <form:input path="pickUpPhoneNumber" type="phone" name="phone"/>
                            </label>
                            <form:errors path="pickUpPhoneNumber"/>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data <form:input path="pickUpDate" type="date" name="data"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina <form:input path="pickUpTime" type="time" name="time"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <form:textarea path="pickUpComment" name="more_info" rows="5"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>

            <!-- STEP 6 -->
            <div data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text"
                                >4 worki ubrań w dobrym stanie dla dzieci</span
                                >
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text"
                                >Dla fundacji "Mam marzenie" w Warszawie</span
                                >
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li>Prosta 51</li>
                                <li>Warszawa</li>
                                <li>99-098</li>
                                <li>123 456 789</li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li>13/12/2018</li>
                                <li>15:40</li>
                                <li>Brak uwag</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>

            <!-- STEP 7 -->
            <div data-step="7">
                <h2>
                    Dziękujemy za przesłanie formularza Na maila prześlemy wszelkie
                    informacje o odbiorze.
                </h2>
            </div>
        </form:form>
    </div>
</section>

<jsp:include page="../components/footer.jsp"/>