<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="pl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<title>Autoryzacja</title>

<!-- Bootstrap -->
<link
	href="<c:url value="/resources/vendors/bootstrap/dist/css/bootstrap.min.css" />"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="<c:url value="/resources/vendors/font-awesome/css/font-awesome.min.css" />"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="<c:url value="/resources/vendors/nprogress/nprogress.css" />"
	rel="stylesheet">
<!-- Animate.css -->
<link
	href="<c:url value="/resources/vendors/animate.css/animate.min.css" />"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="<c:url value="/resources/build/css/custom.min.css" />"
	rel="stylesheet">
</head>

<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form:form method="post" modelAttribute="account"
						action="/ProjectErp/account/login">
						<h1>Zaloguj</h1>
						${loginError}
						<div>
							<form:input type="text" class="form-control" path="username"
								placeholder="Nazwa użytkownika" required="true" />
						</div>
						<div>
							<form:input type="password" class="form-control" placeholder="Hasło" path="password"
								required="true" />
						</div>
						<div>
							<input type="submit" class="btn btn-default submit"
								value="Zaloguj"/>
						</div>
						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								Nie masz konta? <a href="#signup" class="to_register">
									Zarejestruj </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<i class="fa fa-paw"></i> ProjectERP!
								</h1>
								<p></p>
							</div>
						</div>
					</form:form>
				</section>
			</div>

			<div id="register" class="animate form registration_form">
				<section class="login_content">
					<form:form method="post" modelAttribute="account"
						action="/ProjectErp/account/register">
						<h1>Zarejestruj</h1>
						${registerError}
						<div>
							<form:input type="text" class="form-control" path="username"
								placeholder="Nazwa użytkownika" required="true" />
						</div>
						<div>
							<form:input type="password" class="form-control" placeholder="Hasło" path="password"
								required="true" />
						</div>
						<div>
							<input type="submit" class="btn btn-default submit"
								value="Zarejestruj"/>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								Masz już konto? <a href="#signin" class="to_register">
									Zaloguj </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<i class="fa fa-paw"></i> ProjectERP!
								</h1>
								<p></p>
							</div>
						</div>
					</form:form>
				</section>
			</div>
		</div>
	</div>
</body>
</html>
