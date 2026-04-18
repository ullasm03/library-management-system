<%@page import="com.jsp.library.entity.Issue"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Issue Details</title>

<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(135deg, #eef2f7, #ffffff);
	margin: 0;
	padding: 20px;
	text-align: center;
}

/* Title */
h2 {
	color: #1e3a8a;
	font-size: 28px;
	margin-bottom: 20px;
	letter-spacing: 1px;
}

/* Container */
.table-container {
	width: 90%;
	margin: auto;
	background: white;
	border-radius: 15px;
	box-shadow: 0 10px 25px rgba(0,0,0,0.15);
	padding: 15px;
}

/* Table */
table {
	width: 100%;
	border-collapse: collapse;
	border-radius: 10px;
	overflow: hidden;
}

/* Header */
th {
	background: linear-gradient(135deg, #2563eb, #3b82f6);
	color: white;
	padding: 14px;
	font-size: 14px;
	text-transform: uppercase;
}

/* Cells */
td {
	padding: 12px;
	border-bottom: 1px solid #e5e7eb;
	color: #374151;
	font-size: 14px;
}

/* Alternate rows */
tr:nth-child(even) {
	background-color: #f9fafb;
}

/* Hover */
tr {
	transition: 0.3s;
}

tr:hover {
	background-color: #e0f2fe;
	transform: scale(1.01);
}

/* Status */
.status-issued {
	color: #dc2626;
	font-weight: bold;
}

.status-returned {
	color: #16a34a;
	font-weight: bold;
}

/* Return Button */
.return-btn {
	text-decoration: none;
	background: linear-gradient(135deg, #22c55e, #4ade80);
	color: white;
	padding: 7px 14px;
	border-radius: 20px;
	font-size: 13px;
	font-weight: 600;
	transition: 0.3s;
	box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

.return-btn:hover {
	transform: scale(1.1);
	box-shadow: 0 8px 18px rgba(0,0,0,0.3);
}

/* Back Button */
.back-btn {
	display: inline-block;
	margin-top: 20px;
	text-decoration: none;
	background: linear-gradient(135deg, #6c757d, #adb5bd);
	color: white;
	padding: 8px 16px;
	border-radius: 20px;
	font-size: 14px;
	transition: 0.3s;
}

.back-btn:hover {
	transform: scale(1.05);
}
</style>

</head>
<body>

<h2>📄 Issue Details</h2>

<%
List<Issue> list = (List<Issue>) request.getAttribute("list");
%>

<div class="table-container">
	<table>
		<tr>
			<th>Student</th>
			<th>Book Name</th>
			<th>Issue Date</th>
			<th>Return Date</th>
			<th>Status</th>
			<th>Action</th>
		</tr>

		<%
		for(Issue issue : list){
		%>
		<tr>
			<td><%=issue.getStudent().getName()%></td>
			<td><%=issue.getBook().getName()%></td>
			<td><%=issue.getIssueDate()%></td>
			<td><%=issue.getReturnDate()%></td>

			<td>
				<%
				if("ISSUED".equals(issue.getStatus())){
				%>
					<span class="status-issued">ISSUED</span>
				<%
				}else{
				%>
					<span class="status-returned">RETURNED</span>
				<%
				}
				%>
			</td>

			<td>
				<%
				if("ISSUED".equals(issue.getStatus())){
				%>
					<a class="return-btn" href="returnBook?id=<%=issue.getBook().getId()%>">
						Return
					</a>
				<%
				}else{
				%>
					✔ Done
				<%
				}
				%>
			</td>
		</tr>
		<%
		}
		%>

	</table>
</div>

<a href="books" class="back-btn">⬅ Back to Dashboard</a>

</body>
</html>