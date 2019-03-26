<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://sargue.net/jsptags/time" %>

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
            <%--<p data-step="3">--%>
            <%--Jeśli wiesz komu chcesz pomóc, możesz wpisać nazwę tej organizacji w--%>
            <%--wyszukiwarce. Możesz też filtrować organizacje po ich lokalizacji--%>
            <%--bądź celu ich pomocy.--%>
            <%--</p>--%>
            <p data-step="3">
                Na podstawie Twoich kryteriów oraz rzeczy, które masz do oddania
                wybraliśmy organizacje, którym możesz pomóc. Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/5</div>
        <form:form method="post" modelAttribute="donation">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                <c:forEach items="${whatToDonate}" var="what" varStatus="loop">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <form:checkbox
                                    path="whatToDonate[${loop.index}]"
                                    value="${what}"
                                    class="whatToDonate checkbox"
                                    id="${what.id}"

                            />
                                <%--<span class="checkbox"></span>--%>
                            <span class="description"
                            >${what.name}</span
                            >
                        </label>
                    </div>
                </c:forEach>

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
                        <input type="number" name="quantity" step="1" min="1" id="bagQuantity"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 3 -->
            <%--<div data-step="3">--%>
            <%--<h3>Lokalizacja:</h3>--%>

            <%--<div class="form-group form-group--dropdown">--%>
            <%--<select name="localization">--%>
            <%--<option value="0">- wybierz -</option>--%>
            <%--<option value="warsaw">Warszawa</option>--%>
            <%--<option value="wroclaw">Wrocław</option>--%>
            <%--<option value="poznan">Poznań</option>--%>
            <%--<option value="gdansk">Gdańsk</option>--%>
            <%--</select>--%>
            <%--</div>--%>

            <%--<div class="form-section">--%>
            <%--<h4>Komu chcesz pomóc?</h4>--%>
            <%--<div class="form-section--checkboxes">--%>
            <%--<div class="form-group form-group--checkbox">--%>
            <%--<label>--%>
            <%--<input type="checkbox" name="help[]" value="children"/>--%>
            <%--<span class="checkbox">dzieciom</span>--%>
            <%--</label>--%>
            <%--</div>--%>

            <%--<div class="form-group form-group--checkbox">--%>
            <%--<label>--%>
            <%--<input type="checkbox" name="help[]" value="mothers"/>--%>
            <%--<span class="checkbox">samotnym matkom</span>--%>
            <%--</label>--%>
            <%--</div>--%>

            <%--<div class="form-group form-group--checkbox">--%>
            <%--<label>--%>
            <%--<input type="checkbox" name="help[]" value="homeless"/>--%>
            <%--<span class="checkbox">bezdomnym</span>--%>
            <%--</label>--%>
            <%--</div>--%>

            <%--<div class="form-group form-group--checkbox">--%>
            <%--<label>--%>
            <%--<input type="checkbox" name="help[]" value="disabled"/>--%>
            <%--<span class="checkbox">niepełnosprawnym</span>--%>
            <%--</label>--%>
            <%--</div>--%>

            <%--<div class="form-group form-group--checkbox">--%>
            <%--<label>--%>
            <%--<input type="checkbox" name="help[]" value="old"/>--%>
            <%--<span class="checkbox">osobom starszym</span>--%>
            <%--</label>--%>
            <%--</div>--%>
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

            <!-- STEP 3 -->
            <div data-step="3">
                <h2>Wybierz organizacje, której chcesz pomóc:</h2>
                <c:forEach items="${institutions}" var="institution">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <form:radiobutton path="institutionDetails" value="${institution}" class="institution"/>
                            <span class="checkbox radio"></span>
                            <span class="description">
                  <div class="title">
                          ${institution.institutionType.name}
                          "${institution.institutionName}" -
                        <c:forEach items="${institution.addresses}" var="address">
                            ${address.city}
                        </c:forEach>
                  </div>
                  <div class="subtitle">
                          Cel i misja: ${institution.institutionGoalAndMission}
                  </div>
                </span>
                        </label>
                    </div>
                </c:forEach>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 4 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzeczy przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">

                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Numer mieszkania <input type="number" name="pickUpAddress.flatNumber" step="1"
                                                            id="flatNumber"/>
                            </label>
                            <span class="error" id="errorFlatNumber"></span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Numer domu <input type="number" name="pickUpAddress.houseNumber" step="1" min="1"
                                                      id="houseNumber"/> </label>
                            <span class="error" id="errorHouseNumber"></span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Ulica <input type="text" name="pickUpAddress.street" id="street"/> </label>
                            <span class="error" id="errorStreet"></span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto <input type="text" name="pickUpAddress.city" id="city"/> </label>
                            <span class="error" id="errorCity"></span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy <input type="text" name="pickUpAddress.zipCode" id="zipCode"/>
                            </label>
                            <span class="error" id="errorZipCode"></span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <input type="tel" name="pickUpPhoneNumber" id="tel"/>
                            </label>
                            <span class="error" id="errorTel"></span>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data <input type="date" name="pickUpDate" id="date"/></label>
                            <span class="error" id="errorDate"></span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina <input type="time" name="pickUpTime" id="time"/> </label>
                            <span class="error" id="errorTime"></span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <textarea name="pickUpComment" rows="5"></textarea>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text"
                                ><span id="numberOfBags"></span><span id="what"></span></span
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

            <!-- STEP 6 -->
            <div data-step="6">
                <h2>
                    Dziękujemy za przesłanie formularza Na maila prześlemy wszelkie
                    informacje o odbiorze.
                </h2>
            </div>
        </form:form>
    </div>
</section>


<jsp:include page="../components/footer.jsp"/>