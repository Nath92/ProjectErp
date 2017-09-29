<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link href="<c:url value="/resources/build/css/city-autocomplete.min.css" />" rel="stylesheet">

<jsp:include page="../header.jsp" />

	<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Formularze</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search"></div>
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Dodaj adres</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form:form method="post" modelAttribute="address" id="demo-form2" cssClass="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="postalcode">Kod pocztowy <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input id="postalcode" path="postalcode" required="true" maxlength="6" pattern="[0-9]{2}-[0-9]{3}" cssClass="postal-code form-control col-md-7 col-xs-12"/>
                          <form:errors path="postalcode" cssClass="error" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="province">Województwo <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:select id="province" required="true" path="province" class="select2_group form-control">
                            <form:option disabled="true" selected="selected"
                              label="Proszę wybrać" value="" />
                            <form:options items="${provinces}"/>
                          </form:select>
                          <form:errors path="province" cssClass="error" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="city">Miasto <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input path="city" id="city" required="true" autocomplete="off" data-country="pl" list="cities" cssClass="form-control col-md-7 col-xs-12"/>
                          <form:errors path="city" cssClass="error" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="street" class="control-label col-md-3 col-sm-3 col-xs-12">Ulica <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input id="street" path="street" required="true" pattern="[A-Za-z]{3,74}" cssClass="form-control col-md-7 col-xs-12"/>
                          <form:errors path="street" cssClass="error" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="housenumber" class="control-label col-md-3 col-sm-3 col-xs-12">Numer domu <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input id="housenumber" required="true" path="housenumber" cssClass="form-control col-md-7 col-xs-12"/>
                          <form:errors path="housenumber" cssClass="error" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="localnumber" class="control-label col-md-3 col-sm-3 col-xs-12">Numer mieszkania
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input id="localnumber" path="localnumber" pattern="[0-9]{0,4}" cssClass="form-control col-md-7 col-xs-12"/>
                          <form:errors path="localnumber" cssClass="error" />
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-primary" type="button"><a href="/ProjectErp/" style="text-decoration: none; color: white;">Wróć</a></button>
                          <button class="btn btn-primary" type="reset">Reset</button>
                          <button type="submit" class="btn btn-success">Dodaj</button>
                        </div>
                      </div>

                    </form:form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
	<spring:url value="/resources/build/js/cleave.min.js" var="cleaveJs" />
	<spring:url value="/resources/build/js/jquery.city-autocomplete.min.js" var="citiesJs" />
	<spring:url value="/resources/build/js/jquery.js" var="jQuery" />
	<spring:url value="//maps.googleapis.com/maps/api/js?key=AIzaSyANc_kBCCjhESTLWNhHaPkpWS1Xyyyqvgslibraries=places&language=pl" var="googleJs" />
	<script src="${jQuery}"></script>	
	<script src="${cleaveJs}"></script>
	<script src="${citiesJs}"></script>	
	<script src="//maps.googleapis.com/maps/api/js?key=AIzaSyCzrPKnpTqA1pOu9w7LADyh3uJoNqyZScE&libraries=places&language=pl"></script>	
	<script>
		$('#city').cityAutocomplete();

		var cleave = new Cleave('.postal-code', {
			delimiter : '-',
			blocks : [ 2, 3 ],
			numeral : true
		});
	</script>
<jsp:include page="../footer.jsp" />