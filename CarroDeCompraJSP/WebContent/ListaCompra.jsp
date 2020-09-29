<!-- Parada Sánchez Liliana -->
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Lista de compras</title>
</head>
<body>
	<h1>Supermercado JSP</h1>
	<form name="Formulario_Compra" action="ListaCompra.jsp">

		<p>Artículos a comprar:</p>
		<p>
			<label> <input type="checkbox" name="articulos" value="Agua ">
				Agua
			</label> <br> 
			<label> <input type="checkbox" name="articulos" value="Leche"> 
				Leche
			</label> <br> 
			<label> <input type="checkbox" name="articulos"	value="Pan"> 
				Pan
			</label> <br> 
			<label> <input type="checkbox" name="articulos" value="Mazanas"> 
				Manzanas
			</label> <br> 
			<label> <input type="checkbox" name="articulos" value="Carne"> 
				Carne
			</label> <br> 
			<label> <input type="checkbox" name="articulos" value="Pescado"> 
				Pescado
			</label>
		</p>
		<p>
			<input type="submit" name="button" id="button" value="Guardar">
			<br>
		</p>
	</form>
	
	<h2>Carrito de compras</h2>
	
	<%
	List<String> listaElementos = (List<String>)session.getAttribute("misElementos");
	
	if(listaElementos == null){
		listaElementos = new ArrayList<String>();
		session.setAttribute("misElementos", listaElementos);
	}
	
	String[] elementos = request.getParameterValues("articulos");
	
	if(elementos != null){
		for(String elemento : elementos){
			if(!listaElementos.contains(elemento)){
				listaElementos.add(elemento);	
			}else{
				out.print("Ya seleccionó "+elemento);
			}
		}
	}
	
	for(String elemento : listaElementos){
		out.print("<UL><li>" + elemento + "</li></UL>");
	}
	
	%>
</body>
</html>