<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.List" %>
<%
List<String> errores = (List<String>) request.getAttribute("errores");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>formulario de usuarios</title>
	</head>
	<body>
		<h3>Formulario de usuarios</h3>
		<%
		if(errores != null && errores.size()> 0){ 
		%>
		<ul>
		
		<%for(String error:errores){ %>
		 	<li>
		 		<%=error %>
		 	</li>
		<%} %>
		</ul>
		<%} %>
		<form action="/webapp-form/registro" method="post">
			<div>
				<label for="username">User Name</label>
				<div>
					<input type="text" name="username" id="username">
				</div>
			</div>
			<div>
				<label for="password">Password</label>
				<div>
					<input type="password" name="password" id="password">
				</div>
			</div>
			<div>
				<label for="email">Email</label>
				<div>
					<input type="email" name="email" id="email">
				</div>
			</div>
			
			<div>
				<label for="pais">Pais</label>
				<div>
					<select name="pais" id="pais">
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
			<div>
				<label for="lenguajes">Lenguajes de programacion</label>
				<div>
					<select name="lenguajes" id="lenguajes" multiple>
						<option value="java" selected>Java SE</option>
						<option value="javaScript">Java Script</option>
						<option value="Angular">Angular</option>
						<option value="javaee" selected>Java EE</option>
						<option value="spring">Spring Boot</option>
					</select>
				</div>
			</div>
			<div>
				<label>Roles</label>
				<div>
					<input type="checkbox" name="roles" value="ROLE_ADMIN">
					<label>Administrador</label>
				</div>
				<div>
					<input type="checkbox" name="roles" value="ROLE_USER" checked>
					<label>Usuario</label>
				</div>
				<div>
					<input type="checkbox" name="roles" value="ROLE_MODERATOR">
					<label>Moderador</label>
				</div>
			</div>
			
			<div>
				<label>Idiomas</label>
				<div>
					<input type="radio" name="idioma" value="es" checked>
					<label for="idioma">EspaÃ±ol</label>
				</div>
				<div>
					<input type="radio" name="idioma" value="en">
					<label for="idioma">Ingles</label>
				</div>
				<div>
					<input type="radio" name="idioma" value="fr">
					<label for="idioma">Framces</label>
				</div>
			</div>
			
			<div>
				<div>
					<input type="submit" value="Enviar">
				</div>
			</div>
		</form>
	</body>
</html>
