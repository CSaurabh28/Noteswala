<!doctype html>
<html lang="en">
  <head>
   <%@include file="head.jsp" %>
  
  </head>
  <body>
 <div class="container-fluid">
     <%@include file="Menu.jsp"%> 
 </div>

<form class="container text-center" action="SaveNoteServlet" method="post">
  <div class="form-group">
    <label for="Title">Note Title</label>
    <input type="text" name="title" required class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter Title">
   
  </div>
  <div class="form-group">
    <label for="Content">Content</label>
    <textarea name="content" class="form-control" required id="content" placeholder="Enter Content" style="height:300px;"></textarea>
  </div>
  
  <button type="submit" class="btn btn-primary">Add</button>
</form>

   
  </body>
</html>