<%@page import="java.util.Map"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%
Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
//Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>formulario de usuarios</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	</head>
	<body class="container">
		<h3>Formulario de usuarios</h3>
		<%
		if(errores != null && errores.size()> 0){ 
		%>
		<ul>
		
		<%for(String error: errores.values()){ %>
		 	<li>
		 		<%=error %>
		 	</li>
		<%} %>
		</ul>
		<%} %>
		<form action="/webapp-form/registro" method="post">
			<div class="row mb-3">
				<label for="username" class="col-form-label col-sm-2">User Name</label>
				<div class="col-sm-4">
					<input type="text" name="username" id="username" class="form-control">
				</div>
				<div class="row">
					
					<%
					if(errores != null && errores.containsKey("username")){
						out.println("<small style='color : red;' class='col-sm-4 offset-sm-2 px-4'>"+errores.get("username")+"</small>");
					}
					%>
					
				</div>
			</div>
			<div class="row mb-3">
				<label for="password" class="col-form-label col-sm-2">Password</label>
				<div class="col-sm-4">
					<input type="password" name="password" id="password" class="form-control">
				</div>
				<div class="row">
				<%
				if(errores != null && errores.containsKey("password")){
					out.println("<small style='color : red;' class='col-sm-4 offset-sm-2 px-4'>"+errores.get("password")+"</small>");
				}
				%>
				</div>
			</div>
			<div class="row mb-3">
				<label for="email" class="col-form-label col-sm-2">Email</label>
				<div class="col-sm-4">
					<input type="email" name="email" id="email" class="form-control">
				</div>
				<div class="row">
				<%
				if(errores != null && errores.containsKey("email")){
					out.println("<small style='color : red;' class='col-sm-4 offset-sm-2 px-4'>"+errores.get("email")+"</small>");
				}
				%>
				</div>
			</div>
			
			<div class="row mb-3">
				<label for="pais" class="col-form-label col-sm-2">Pais</label>
				<div class="col-sm-4">
					<select name="pais" id="pais" class="form-select">
						<option value="">--Selecione un Pais</option>
						<option value="CO" selected>Colombia</option>
						<option value="CL">Chile</option>
						<option value="ES">EspaÃ±a</option>
						<option value="VE">Venezuela</option>
						<option value="MX">Mexico</option>
						<option value="AR">Argentina</option>
						<option value="PE">Peru</option>
						<option value="UR">Uriguay</option>
					</select>
				</div>
			</div>
			<%
				if(errores != null && errores.containsKey("pais")){
					out.println("<small style='color : red;'>"+errores.get("pais")+"</small>");
				}
			%>
			<div class="row mb-3">
				<label for="lenguajes" class="col-form-label col-sm-2">Lenguajes de programacion</label>
				<div class="col-sm-4">
					<select name="lenguajes" id="lenguajes" multiple class="form-select">
						<option value="java" selected>Java SE</option>
						<option value="javaScript">Java Script</option>
						<option value="Angular">Angular</option>
						<option value="javaee" selected>Java EE</option>
						<option value="spring">Spring Boot</option>
					</select>
				</div>
			</div>
			<%
				if(errores != null && errores.containsKey("lenguajes")){
					out.println("<small style='color : red;'>"+errores.get("lenguajes")+"</small>");
				}
			%>
			<div class="row mb-3">
				<label class="col-form-label col-sm-2">Roles</label>
				<div class="form-check">
					<input type="checkbox" name="roles" value="ROLE_ADMIN" class="form-check-input">
					<label class="form-check-label">Administrador</label>
				</div>
				<div class="form-check">
					<input type="checkbox" name="roles" value="ROLE_USER" checked class="form-check-input">
					<label class="form-check-label">Usuario</label>
				</div>
				<div class="form-check">
					<input type="checkbox" name="roles" value="ROLE_MODERATOR" class="form-check-input">
					<label class="form-check-label">Moderador</label>
				</div>
			</div>
			<%
				if(errores != null && errores.containsKey("roles")){
					out.println("<small style='color : red;'>"+errores.get("roles")+"</small>");
				}
			%>
			
			<div class="row mb-3">
				<label class="col-form-label col-sm-2">Idiomas</label>
				<div class="form-check">
					<input type="radio" name="idioma" value="es" checked class="form-check-input">
					<label class="form-check-label">Español</label>
				</div>
				<div class="form-check">
					<input type="radio" name="idioma" value="en" class="form-check-input">
					<label class="form-check-label">Ingles</label>
				</div>
				<div class="form-check">
					<input type="radio" name="idioma" value="fr" class="form-check-input">
					<label class="form-check-label">Framces</label>
				</div>
			</div>
			<%
				if(errores != null && errores.containsKey("idioma")){
					out.println("<small style='color : red;' class='col-md-4 col-md-offset-2'>"+errores.get("idioma")+"</small>");
				}
			%>
			
			<div class="row mb-3">
				<div>
					<input type="submit" value="Enviar" class="btn btn-primary">
				</div>
			</div>
		</form>
	</body>
</html>
