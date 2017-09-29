<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                    <h2>Dodaj klienta</h2>
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
                    <form:form method="post" modelAttribute="client" id="demo-form2" cssClass="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Nazwa <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input id="name" path="name" required="true" cssClass="form-control col-md-7 col-xs-12"/>
                          <form:errors path="name" cssClass="error" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nip">NIP <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input id="nip" path="nip" required="true" cssClass="form-control col-md-7 col-xs-12"/>
                          <form:errors path="nip" cssClass="error" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="phone" class="control-label col-md-3 col-sm-3 col-xs-12">Numer telefonu <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input id="phone" path="phone" required="true" cssClass="form-control col-md-7 col-xs-12"/>
                          <form:errors path="phone" cssClass="error" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="email" class="control-label col-md-3 col-sm-3 col-xs-12">E-mail
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:input id="email" path="email" cssClass="form-control col-md-7 col-xs-12"/>
                          <form:errors path="email" cssClass="error" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="description" class="control-label col-md-3 col-sm-3 col-xs-12">Opis
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <form:textarea id="description" path="description" cssClass="form-control col-md-7 col-xs-12"/>
                          <form:errors path="description" cssClass="error" />
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-primary" type="button"><a href="/ProjectErp/" style="text-decoration: none; color: white;">Wróć</a></button>
                          <button class="btn btn-primary" type="reset">Reset</button>
                          <button type="submit" class="btn btn-success">Dodaj adres</button>
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
<jsp:include page="../footer.jsp" />