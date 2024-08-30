<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp" %>

<meta charset="UTF-8">
<title>View Notes:Noteswala</title>
</head>
<body>
	<div class="container">
		 <%@include file="Menu.jsp"%> 
		 <br>
		 <h1 class='text-uppercase' style='text-align:center;'>View Notes</h1>
		 	
		 	<div class='row'>
				<div class='col-12'>
						
						<%
		 					Session s=FactoryProvider.getFactory().openSession();
		 					Query q=s.createQuery("from Notes");
		 					List <Notes> list=q.list();
		 	
		 					for(Notes note:list)
		 					{
		 				%>
		 						<div class="card mt-3" >
  									<img class="card-img-top m-4"  style='max-width:50px;' src="img/notes.png" alt="Card image cap">
  										<div class="card-body px-5" >
   									 			<h5 class="card-title"><%=note.getTitle() %></h5>
   									 			<p class="card-text "><%=note.getContent() %></p><br>
   									 			<p class="card-text text-primary">Date:<%=note.getAddeddate() %></p>
   									 			<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">delete</a>
   									 			<a href="Edit.jsp?note_id=<%=note.getId() %>" class="btn btn-danger">Edit</a>
 						 				</div>
								</div>
		 				
		 				<%
		 					}
		 					s.close();
		 				%>
					
				</div>	 
		 	</div>
		 
	</div>

</body>
</html>