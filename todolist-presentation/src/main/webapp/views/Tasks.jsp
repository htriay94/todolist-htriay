<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/materialize.min.css"/>"
	type="text/css" rel="stylesheet" media="screen,projection">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Tasks</title>
</head>
<body>
	<nav>
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo">Todolist</a>
      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
        <li><a href="<c:url value="/categories"/>">Categories</a></li>
        <li><a href="<c:url value="/tasks"/>">Tâches</a></li>
      </ul>
      <ul class="side-nav" id="mobile-demo">
        <li><a href="<c:url value="/categories"/>">Categories</a></li>
        <li><a href="<c:url value="/tasks"/>">Tâches</a></li>
      </ul>
    </div>
  </nav>
	<ul class="collection">
		<c:forEach items="${tasks}" var="task">
			<li class="collection-item">
				${task.label} commençant le 
				<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${task.beginningDate}" /></li>
		</c:forEach>
		<c:if test="${not empty message}"%>
   			<b>${message}</b>
  		</c:if>
		<form:form action="/listTasksNotEndedBetween" method="get">
			Recherche des taches non finies entre la période
			entre le <form:input type="date" path="starting" size="30"/>
			et le <form:input type="date" path="ending" size="30"/>.
			<form:input type="submit" value="Rechercher"/>
		</form:form>
	</ul>
	
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/main.js"/>"></script>
	</body>
</html>