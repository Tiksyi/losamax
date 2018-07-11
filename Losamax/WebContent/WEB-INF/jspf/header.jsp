<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="<c:url value="/paricontroller/goToMenu"/>">LOSAMAX</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="<c:url value="/paricontroller/goToMenu"/>"><span
						class="glyphicon glyphicon-home"></span>&nbsp;<spring:message
							code="accueil.accueil" /></a></li>
				<li><a href="<c:url value="/clientcontroller/parier"/>"><spring:message
							code="accueil.parier" /></a></li>

				<c:forEach var="s" items="${listeSports}">
					<li></li>
					<li><a href="<c:url value="/paricontroller/${s.nom}"/>"
						class="capital"><c:out value="${fn:toLowerCase(s.nom)}" /></a></li>

				</c:forEach>

				<li><a href="#"><spring:message code="accueil.apropos" /></a></li>
				<li><a href="<c:url value="/clientcontroller/contact"/>"><span
						class="glyphicon glyphicon-envelope"></span>&nbsp;<spring:message
							code="accueil.contact" /></a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><spring:message
							code="accueil.langue" /><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="?lang=fr">FR</a></li>
						<li><a href="?lang=en">EN</a></li>
						<li><a href="?lang=ru">RU</a></li>
					</ul>
				</li>
				<sec:authorize access="hasRole('ROLE_ANONYMOUS')">
					<li><a href="<c:url value="/clientcontroller/goToCreer" />"><span
							class="glyphicon glyphicon-user"></span>&nbsp;<spring:message
								code="accueil.inscription" /></a></li>
					<li><a href="<c:url value="/clientcontroller/goToLogin" />"><span
							class="glyphicon glyphicon-log-in"></span>&nbsp;<spring:message
								code="accueil.connexion" /></a></li>
				</sec:authorize>
				
				
				<sec:authorize access="hasRole('ROLE_USER')">
					<c:set var="username" scope="session">
						<sec:authentication property="principal.username" />
					</c:set>
					<li><a
						href="<c:url value="/clientcontroller/compte/${username}" />"><span
							class="glyphicon glyphicon-tasks"></span>&nbsp;${username}</a></li>
					<li><a href="<c:url value="/logout" />"><span
							class="glyphicon glyphicon-remove"></span>&nbsp;<spring:message
								code="accueil.deconnexion" /></a></li>
				</sec:authorize>
				
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<c:set var="username" scope="session">
						<sec:authentication property="principal.username" />
					</c:set>
					<li><a href="<c:url value="/admincontroller/goToAdmin" />"><span
							class="glyphicon glyphicon-tasks"></span>&nbsp;<sec:authentication
								property="principal.username" /></a></li>
					<li><a href="<c:url value="/logout" />"><span
							class="glyphicon glyphicon-remove"></span>&nbsp;<spring:message
								code="accueil.deconnexion" /></a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</nav>


<!-- </body> -->