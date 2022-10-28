<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#loginForm').validate({
		
		rules:{
			userId:{
				required:true,
			},
	        password:{
				required:true
	             }
		},
	messages:{
		userId:{
			required:"Enter UserId",
			
		},
		password:{
			required:"Enter Password"
		}
	}	});
	
});</script>
</head>

<body>
	<div align=center>
		<h2>Login Page</h2>

		<form id="loginForm" action="LoginServlet" method="post">
			<table>
				<tr>
					<td>User ID</td>
					<td><input type="text" name="userId" id="userId"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" id="password"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" value="login"></td>
				</tr>

			</table>

		</form>
	</div>

</body>
</html>