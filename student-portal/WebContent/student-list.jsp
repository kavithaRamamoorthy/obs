<%@ page import="com.sm.api.Student"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.TreeMap"%>
<%@ page import="java.text.DecimalFormat"%>
<%
	ArrayList<Student> std = (ArrayList<Student>) request.getAttribute("students");
TreeMap<String, ArrayList<Student>> depWise = new TreeMap<String, ArrayList<Student>>();
DecimalFormat df = new DecimalFormat("#.00");
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Page</title>

<style>
.popup {
	position: relative;
	cursor: pointer;
}

.popup .popuptext {
	visibility: hidden;
	width: 160px;
	background-color: #555;
	color: #fff;
	text-align: center;
	padding: 8px 0;
	position: absolute;
	bottom: 125%;
	left: 50%;
	margin-left: -80px;
}

.popup .show {
	visibility: visible;
}
</style>
</head>
<body>
	<div align="center">
		<p>Welcome ${username}</p>
	</div>
	<div align="center">

		<table border="1" width="500" align="center">
			<tr bgcolor="6495ED">
				<th><b>Department</b></th>
				<th><b>Student ID</b></th>
				<th><b>Marks</b></th>
				<th><b>Pass%</b></th>
			</tr>

			<%
				float d1 = 0, d2 = 0, d3 = 0, d1p = 0, d2p = 0, d3p = 0;
			float pp = 0;
			for (int index = 0; index < std.size(); index++) {
				Student s = std.get(index);
				if (s.getDepName().equalsIgnoreCase("dep1")) {
					d1++;
					if (s.getMarks() > 40)
				d1p++;

				} else if (s.getDepName().equalsIgnoreCase("dep2")) {
					d2++;
					if (s.getMarks() > 40)
				d2p++;
				} else if (s.getDepName().equalsIgnoreCase("dep3")) {
					d3++;
					if (s.getMarks() > 40)
				d3p++;
				}

				if (depWise.containsKey(s.getDepName())) {
					depWise.get(s.getDepName()).add(s);
				} else {
					depWise.put(s.getDepName(), new ArrayList<Student>());
					depWise.get(s.getDepName()).add(s);
				}
			}
			%>




			<%
				for (ArrayList<Student> list : depWise.values()) {
				if (list.get(0).getDepName().equalsIgnoreCase("dep1"))
					pp = (d1p * 100) / d1;
				else if (list.get(0).getDepName().equalsIgnoreCase("dep2"))
					pp = (d2p * 100) / d2;
				else if (list.get(0).getDepName().equalsIgnoreCase("dep3"))
					pp = (d3p * 100) / d3;
			%>
			<tr>
				<td rowspan=<%=list.size()%>><%=list.get(0).getDepName()%></td>
				<td class="popup"
					onclick="myFunction('<%=list.get(0).getStudId()%>')"><%=list.get(0).getStudId()%>
					<span class="popuptext" id=<%=list.get(0).getStudId()%>><%=list.get(0).getStudName()%></span></td>
				<td><%=list.get(0).getMarks()%></td>

				<td rowspan=<%=list.size()%>><%=Float.valueOf(df.format(pp))%></td>
			</tr>
			<%
				for (int i = 1; i < list.size(); i++) {
			%>
			<tr>
				<td class="popup"
					onclick="myFunction('<%=list.get(i).getStudId()%>')"><%=list.get(i).getStudId()%>
					<span class="popuptext" id=<%=list.get(i).getStudId()%>><%=list.get(i).getStudName()%></span></td>
				<td><%=list.get(i).getMarks()%></td>

			</tr>

			<%
				}
			%>
			<%
				}
			%>
		</table>
	</div>

	<script>
		function myFunction(popup) {
			var popup = document.getElementById(popup);
			popup.classList.toggle("show");
		}
	</script>

</body>
</html>