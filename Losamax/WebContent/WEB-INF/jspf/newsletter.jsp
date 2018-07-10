<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title><spring:message code="message.titre" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/static/css/styles.css" />">
<%-- <link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
<script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script>
<script src="<c:url value="/static/jquery/js/jquery.js" />"></script> --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<body>
<c:import url="./header.jsp"/>

<div class="Container">
<h1><spring:message code="newsletter.titre" /></h1>
<form method=post action="newsletter.jsp">
            
                <label for="msg">Votre message :</label><textarea name="message" id="message" cols="100" rows="15" required /></textarea>
                <br>
                <input type="submit" value="publier" class="boutonRouge" onclick="chargementEnCours();"></input>
            </form>  
 </div>