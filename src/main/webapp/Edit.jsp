<%@page import="com.entities.Notes"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp" %>
<meta charset="UTF-8">
<title>Update:Noteswala</title>
</head>
<body>
		<div class="container">
		 <%@include file="Menu.jsp"%>
		 <h3 style='text-align:center;'>Edit Your Note Here</h3>
		 <%
		 	int noteId=Integer.parseInt(request.getParameter("note_id").trim()); 
		 	Session s=FactoryProvider.getFactory().openSession();
		 	Notes note=(Notes)s.get(Notes.class,noteId);
		 %>
		 <form class="container text-center" action="EditServlet" method="post">
		 		<input name="note_id" value="<%=note.getId()%>" type="hidden">
  				<div class="form-group">
   					 <label for="Title">Note Title</label>
   					 <input type="text" name="title" value="<%=note.getTitle() %>" required class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter Title">
   
  				</div>
  				<div class="form-group">
   					 <label for="Content">Content</label>
  					 <textarea name="content"  class="form-control" required id="content" placeholder="Enter Content" style="height:300px;"><%=note.getContent()%></textarea>
 				</div>
  
  				<button type="submit" class="btn btn-danger">Edit</button>
		</form>
		 
		 
		</div>

</body>
</html>