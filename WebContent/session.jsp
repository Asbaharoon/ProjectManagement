<%@page import="java.util.*"%> 
<% 
 
if (session.getAttribute("user_id") == null || session.getAttribute("user_name") == null ) 
{
	response.sendRedirect("index.jsp");
}
else{
	System.out.println("Logado");
}

Enumeration<String> parametros = request.getParameterNames();   
while ( parametros.hasMoreElements() ) 
{   
  String parameterName = (String) parametros.nextElement();   
  String parameterValue = request.getParameter(parameterName); 
  if(parameterValue.equals("logout")) {
	  session.invalidate(); 
	  System.out.println("logout");
	  response.sendRedirect("index.jsp");
  }
} 

%>