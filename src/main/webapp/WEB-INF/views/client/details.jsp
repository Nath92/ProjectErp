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
                <h3>${client.name}</h3>
              </div>

            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Dane klienta</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <section class="content invoice">
                      <!-- title row -->
                      <div class="row">
                        <div class="col-xs-12 invoice-header">
                          <h1>
                                          <i class="fa fa-user"></i> Klient
                                          <small class="pull-right">NIP: ${client.nip}</small>
                                      </h1>
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- info row -->
                      <div class="row invoice-info">
                        <div class="col-sm-4 invoice-col">
                          Ogólne
                          <address>
                                          <strong>Telefon : ${client.phone}</strong>
                                          <br>Email : ${client.email}
                                          <br>Opis : ${client.description}
                                      </address>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-4 invoice-col">
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-4 invoice-col">
                          <b>Klient #${client.id}</b>
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      <!-- Table row -->
                      <div class="row">
                        <div class="col-xs-12 table">
                          <table class="table table-striped">
                            <thead>
                              <tr>
                                <th>Kod pocztowy</th>
                                <th>Województwo</th>
                                <th>Miasto</th>
                                <th>Ulica</th>
                                <th>Numer domu</th>
                                <th>Numer lokalu</th>
                              </tr>
                            </thead>
                            <tbody>
                              <c:forEach items="${client.addresses}" var="address">
                                <tr>
                                  <td>${address.postalcode}</td>
                                  <td>${address.province}</td>
                                  <td>${address.city}</td>
                                  <td>${address.street}</td>
                                  <td>${address.housenumber}</td>
                                  <td>${address.localnumber}</td>
                                </tr>
                              </c:forEach>
                            </tbody>
                          </table>
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      <!-- this row will not appear when printing -->
                      <div class="row no-print">
                        <div class="col-xs-12">
                          <button class="btn btn-default" onclick="window.print();"><i class="fa fa-print"></i> Drukuj</button>
                          <button class="btn btn-danger"><a href="/ProjectErp/client/delete/${client.id}" style="text-decoration: none; color: white;">Usuń</a></button>
                          <button class="btn btn-success pull-right"><a href="/ProjectErp/client" style="text-decoration: none; color: white;"><i class="fa fa-arrow-left"></i> Wróć</a></button>
                        </div>
                      </div>
                    </section>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
<!-- /page content -->
<jsp:include page="../footer.jsp" />