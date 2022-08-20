package form;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/registro")
public class FormServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String pais = req.getParameter("pais");
		String [] lenguajes = req.getParameterValues("lenguajes");
		String [] roles = req.getParameterValues("roles");
		String idioma = req.getParameter("idioma");
		
		List<String> errores = new ArrayList<String>();
		
		if(username == null || username.isBlank()) {
			errores.add("El User name es obligatorio");
		}
		if(email == null || !email.contains("@")) {
			errores.add("Verificar el formato de correo");
		}
		if(password == null || password.isBlank()) {
			errores.add("Digite una contraseña");
		}
		if(pais == null || pais.isBlank()) {
			errores.add("Seleccione un Pais");
		}
		if(lenguajes == null || Arrays.asList(lenguajes).isEmpty()) {
			errores.add("Selecciones al menos un lenguaje de programacion");
		}
		if(roles == null || Arrays.asList(roles).isEmpty()) {
			errores.add("Selecciones al menos un rol");
		}
		if(idioma == null) {
			errores.add("Seleccione un idioma");
		}
		
		if(errores.isEmpty()) {
		try(PrintWriter out = resp.getWriter()){
			out.println("<!DOCTYPE html>");
	        out.println("<html>");
	        out.println("    <head>");
	        out.println("        <meta charset=\"UTF-8\">");
	        out.println("        <title>Hola Mundo Servlet</title>");
	        out.println("    </head>");
	        out.println("    <body>");
	        out.println("        <h1>Resultado Form</h1>");
	        out.println("        <ul>");
	        out.println("        	<li> User name: "+username+"</li>");
	        out.println("        	<li> Email: "+email+"</li>");
	        out.println("        	<li> Pasword: "+password+"</li>");
	        out.println("        	<li> Pais: "+pais+"</li>");
	        out.println("        	<li>Lenguajes: <br><ul>");
	        Arrays.asList(lenguajes).forEach(lenguaje -> {
	        	out.println("        	<li> Lenguaje: "+lenguaje+"</li>");	        	
	        	
	        });
	        out.println("        	</ul></li>");
	        out.println("        	<li>Roles: <br><ul>");
	        Arrays.asList(roles).forEach(rol -> {
	        	out.println("        	<li> Lenguaje: "+rol+"</li>");	        	
	        	
	        });
	        out.println("        	</ul></li>");
	        out.println("        	<li> Idioma"+idioma+"</li>");
	        out.println("        </ul>");
	        out.println("    </body>");
	        out.println("</html>");
		}
		}else {
			req.setAttribute("errores", errores);
			getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
			/*errores.forEach(error ->{
				out.println("        	<li>"+error+"</li>");
				
			});
			out.println("        	<p><a href=\"/webapp-form\">Volver</a></p>");*/
		}
	}

	
}
