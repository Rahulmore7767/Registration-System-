<%
String Msg = (String)session.getAttribute("MSG");
if(Msg != null)
{
	  //out.println(Msg);
%>
	 <div class="alert alert-success alert-dismissible fade show" role="alert">
<strong><%= Msg %></strong> 
<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button>
</div>
	  
	  
	  <%
	  
	  session.removeAttribute("massage");
}



%>