<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mensajes</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<link href="css/dashboard.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Mensajes</a>
      <input class="form-control form-control-dark w-100" type="text" placeholder="Buscar" aria-label="Buscar">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="#">Salir</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link" href="home.jsp">
                  <span data-feather="home"></span>
                  Dashboard 
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="campana.jsp">
                  <span data-feather="globe"></span>
                  Campa�as 
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="mensaje.jsp">
                  <span data-feather="mail"></span>
                  Mensajes <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contacto.jsp">
                  <span data-feather="users"></span>
                  Contactos 
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="bar-chart-2"></span>
                  Reportes
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="layers"></span>
                  Integrations
                </a>
              </li>
            </ul>

            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Reportes Guardados</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Mes Actual
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Ultima semana
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Ultimo a�o
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Nuevo Mensaje</h1>
            <div class="btn-toolbar mb-2 mb-md-0">

              <div class="btn-group mr-2">
                <a class="btn btn-sm btn-outline-secondary" href="contacto.jsp">Cancelar</a>
              </div>

            </div>
          </div>

          <div class="form-responsive">
	          <form method="post" action="MensajeController" class="needs-validation" novalidate>
	            
				
	            <div class="mb-3">
	              <label for="campana">Campa�a</label>
	              <jsp:useBean id="pDao" class="model.CampanaDao" scope="request">
</jsp:useBean>
	              	<select class="form-control" id="campana" name="campana">
	              	
		              	<c:forEach var="campana" items="${pDao.list()}">
					      	<option value="<c:out value="${campana.id}"/>"><c:out value="${campana.nombre}"/></option>
					    </c:forEach>
				  	</select>
	              <div class="invalid-feedback">
	                Por favor seleccione una la campa�a.
	              </div>
	            </div>
				
				<div class="mb-3">
	              <label for="nombre">Contacto </label>
	              <jsp:useBean id="cDao" class="model.ContactoDao" scope="request">
</jsp:useBean>
	              	<select class="form-control" id="contacto" name="contacto">
		              	<c:forEach var="contacto" items="${cDao.list()}">
					      	<option value="<c:out value="${contacto.id}"/>"><c:out value="${contacto.nombre}"/></option>
					    </c:forEach>
				  	</select><div class="invalid-feedback">
	                Por favor seleccione un nombre de contacto.
	              </div>
	            </div>

	            
	            <hr class="mb-4">

	            <div class="custom-control custom-checkbox">
	              <input type="checkbox" class="custom-control-input" name="decline" id="decline">
	              <label class="custom-control-label" for="save-info">Declaro que la informaci�n obtenida cuenta con el consentimiento del contacto</label>
	            </div>
	
	            
	            
	            <hr class="mb-4">
	            <button class="btn btn-primary btn-lg btn-block" type="submit">Continue con el Mensaje</button>
	          </form>
          </div>
        </main>
      </div>
    </div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
</body>
</html>