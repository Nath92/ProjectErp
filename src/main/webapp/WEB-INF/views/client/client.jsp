<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp" />

<!-- page content -->
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>
					Klienci
				</h3>
			</div>
		</div>

		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							Lista wszystkich klientów
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false"><i
									class="fa fa-wrench"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Settings 1</a></li>
									<li><a href="#">Settings 2</a></li>
								</ul></li>
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<table id="datatable" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Nazwa</th>
									<th>NIP</th>
									<th>Nr telefonu</th>
									<th>Email</th>
									<th>Opis</th>
									<th data-orderable="false">Szczegóły</th>
									<th data-orderable="false">Złóż zamowienie</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach items="${clients}" var="client" varStatus="count">
									<tr>
										<td>${client.name}</td>
										<td>${client.nip}</td>
										<td>${client.phone}</td>
										<td>${client.email}</td>
										<td>${client.description}</td>
										<td><button>
												<a href="/ProjectErp/client/get/${client.id}"
													style="text-decoration: none">Szczegóły</a>
											</button></td>
										<td><button>
												<a href="/ProjectErp/basket/add/${client.id}"
													style="text-decoration: none">Nowe</a>
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