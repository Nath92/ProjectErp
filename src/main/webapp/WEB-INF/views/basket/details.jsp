<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header.jsp" />
	<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Basket</h3>
              </div>

            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Szczegóły zamówienia</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <section class="content invoice">
                      <!-- title row -->
                      <div class="row">
                        <div class="col-xs-12 invoice-header">
                          <h1>
                                          <i class="fa fa-file"></i> Basket
                                          <small class="pull-right">Date: ${basket.createdDate}</small>
                                      </h1>
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- info row -->
                      <div class="row invoice-info">
                        <div class="col-sm-4 invoice-col">
                          Dane klienta
                          <address>
                                          <strong>Nazwa: ${basket.client.name}</strong>
                                          <br>Nip: ${basket.client.nip}
                                          <br>Opis: ${basket.client.description}
                                          <br>Telefon: ${basket.client.phone}
                                          <br>Email: ${basket.client.email}
                                      </address>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-4 invoice-col">
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-4 invoice-col">
                          <b>Basket #${basket.id}</b>
                          <br>
                          <br>
                          <b>Data dostarczenia:</b> ${basket.shippingDate}
                          <br>
                          <b>Termin płatności:</b> ${basket.paymentDate}
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
                                <th>Ilość</th>
                                <th>Produkt</th>
                                <th>Próba</th>
                                <th>Masa</th>
                                <th>Cena</th>
                              </tr>
                            </thead>
                            <tbody>
                              <c:forEach items="${basketItems}" var="basketItem">
                                <tr>
                                  <td>${basketItem.quantity}</td>
                                  <td>${basketItem.name}</td>
                                  <td>${basketItem.standard}</td>
                                  <td>${basketItem.weight}</td>
                                  <td>
                                    <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2"
                                      value = "${basketItem.price}" type = "currency"/>
                                  </td>
                                </tr>
                              </c:forEach>
                            </tbody>
                          </table>
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      <div class="row">
                        <!-- accepted payments column -->
                        <div class="col-xs-6">
                          <p class="lead">Formy płatności:</p>
                          <img src="<c:url value="/resources/images/creditCards/visa.png" />" alt="Visa">
                          <img src="<c:url value="/resources/images/creditCards/mastercard.png" />" alt="Mastercard">
                          <img src="<c:url value="/resources/images/creditCards/american-express.png" />" alt="American Express">
                          <img src="<c:url value="/resources/images/creditCards/paypal.png" />" alt="Paypal">
                          <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                            Wszystkie rachunki rachuneczki prosze wysyłać na maila pomidorro@patrycze.fake
                          </p>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-6">
                          <p class="lead">Płatność do: ${basket.paymentDate}</p>
                          <div class="table-responsive">
                            <table class="table">
                              <tbody>
                                <tr>
                                  <th style="width:50%">Kwota zamówienia:</th>
                                  <td>
                                    <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2"
                                      value = "${basket.totalPrice}" type = "currency"/>
                                  </td>
                                </tr>
                                <tr>
                                  <th>Podatek (23%)</th>
                                  <td>
                                    <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2"
                                      value = "${basket.totalPrice * 0.23}" type = "currency"/>
                                  </td>
                                </tr>
                                <tr>
                                  <th>Wysyłka:</th>
                                  <td><fmt:formatNumber minFractionDigits="2" maxFractionDigits="2"
                                    value = "5.80" type = "currency"/>
                                  </td>
                                </tr>
                                <tr>
                                  <th>Całość:</th>
                                  <td>
                                    <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2"
                                      value = "${basket.totalPrice * 1.23 + 5.80}" type = "currency"/>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      <!-- this row will not appear when printing -->
                      <div class="row no-print">
                        <div class="col-xs-12">
                          <button class="btn btn-default" onclick="window.print();"><i class="fa fa-print"></i> Drukuj</button>
                          <button class="btn btn-success pull-right"><a href="/ProjectErp/basket" style="text-decoration: none; color: white;"><i class="fa fa-arrow-left"></i> Wróć</a></button>
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