<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Asiakas"%>  
<%@ page import="java.util.ArrayList"%>  
<%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="main.css">
<title>Asiakkaiden haku</title>
</head>
<body>
<form action="HaeAsiakkaat" method="post">
Hakusana:
<input type="text" name="hakusana" id="hakusana">&nbsp;
<input type="submit" value="Hae" id="hae">
<input type="button" value="Lis�� uusi asiakas" id="lisaa">
</form>
<%
if(request.getParameter("ilmo")!=null){
	out.print(request.getParameter("ilmo")+"<br>");	
}
%>
<br>
<table border="1">
<tr>
<th>Etunimi</th> <!--th = table heading-->
<th>Sukunimi</th>
<th>Puhelin</th>
<th>S�hk�posti</th>
</tr>
<%
if(request.getAttribute("asiakkaat")!=null){	
	ArrayList<Asiakas> asiakkaat = (ArrayList<Asiakas>)request.getAttribute("asiakkaat");
	for(int i=0;i<asiakkaat.size();i++){
		out.print("<tr>");
		out.print("<td>" + asiakkaat.get(i).getEtunimi() + "</td>");
		out.print("<td>" + asiakkaat.get(i).getSukunimi() + "</td>");
		out.print("<td>" + asiakkaat.get(i).getPuhelin() + "</td>");
		out.print("<td>" + asiakkaat.get(i).getSposti() + "</td>");
		out.print("</tr>");
	}	
}
%>
</table>
<script>
	$(document).ready(function(){
		$("#hakusana").focus();
	    $("#lisaa").click(function(){
	    	window.location.href = 'lisaaasiakas.jsp';
	    });
	});
</script>
</body>
</html>