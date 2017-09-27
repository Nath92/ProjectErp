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
				<h3>
					Basket
				</h3>
			</div>
		</div>

		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							Lista wszystkich zamówień
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<table id="datatable" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Data utworzenia</th>
									<th>Data dostarczenia</th>
									<th>Data platnosci</th>
									<th>Kwota</th>
									<th data-orderable="false">Link do szczegółów</th>
									<th data-orderable="false">Link do usunięcia</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach items="${baskets}" var="basket" varStatus="count">
									<tr>
										<td>${basket.createdDate}</td>
										<td>${basket.shippingDate}</td>
										<td>${basket.paymentDate}</td>
										<td>${basket.totalPrice}</td>
										<td><button>
												<a href="/ProjectErp/basket/get/${basket.id}"
													style="text-decoration: none">Szczegóły</a>
											</button></td>
										<td><button>
												<a href="/ProjectErp/basket/delete/${basket.id}"
													style="text-decoration: none">Usuń</a>
											</button></td> 
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>

		</div>
	</div>
</div>
<!-- /page content -->
<jsp:include page="../footer.jsp" />