<%@page import="com.jsp.library.entity.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library Dashboard</title>

<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(to right, #e3f2fd, #ffffff);
	margin: 0;
	padding: 0;
}

/* 🔷 Header */
.header {
	background-color: #007bff;
	color: white;
	padding: 18px;
	text-align: center;
	font-size: 26px;
	font-weight: bold;
	letter-spacing: 1px;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
}

/* 🔘 Navigation */
.nav {
	text-align: center;
	margin: 25px 0;
}

.nav a {
	text-decoration: none;
	color: white;
	padding: 14px 28px;
	margin: 10px;
	border-radius: 30px;
	display: inline-block;
	font-weight: 600;
	font-size: 16px;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
	transition: all 0.3s ease;
}

.nav a:nth-child(1) {
	background: linear-gradient(135deg, #007bff, #00c6ff);
}
.nav a:nth-child(2) {
	background: linear-gradient(135deg, #28a745, #5efc8d);
}
.nav a:nth-child(3) {
	background: linear-gradient(135deg, #ff7e5f, #feb47b);
}

.nav a:hover {
	transform: translateY(-3px) scale(1.05);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
}

/* 📦 Container */
.container {
	width: 80%;
	margin: auto;
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
}

/* 📊 Table */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th {
	background: #007bff;
	color: white;
	padding: 14px;
	font-size: 14px;
}

td {
	padding: 12px;
	border-bottom: 1px solid #ddd;
	text-align: center;
}

tr:hover {
	background-color: #f1f8ff;
	transform: scale(1.01);
}

tr:nth-child(even) {
	background-color: #fafafa;
}

/* 📕 Issue Button */
.issue-btn {
	text-decoration: none;
	background: linear-gradient(135deg, #ff416c, #ff4b2b);
	color: white;
	padding: 8px 16px;
	border-radius: 20px;
	font-size: 13px;
	font-weight: bold;
	transition: 0.3s;
	display: inline-block;
	box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

.issue-btn:hover {
	transform: scale(1.1);
	box-shadow: 0 6px 15px rgba(0,0,0,0.3);
}

.issue-btn:active {
	transform: scale(0.95);
}

h2 {
	text-align: center;
}

/* 📱 Responsive */
@media (max-width: 768px) {
	.container {
		width: 95%;
	}
}
</style>

</head>
<body>

	<!-- 🔷 Header -->
	<div class="header">📚 Library Management System</div>

	<!-- 🔘 Navigation -->
	<div class="nav">
		<a href="addBookPage">📘 Add Book</a>
		<a href="addStudentPage">👤 Add Student</a>
		<a href="issueDetails">📄 Issue Details</a>
	</div>

	<!-- 📦 Content -->
	<div class="container">

		<h2>📘 Book List</h2>

		<%
		List<Book> list = (List<Book>) request.getAttribute("list");
		%>

		<table>
			<tr>
				<th>Name</th>
				<th>Author</th>
				<th>Available Copies</th>
				<th>Issue Book</th>
			</tr>

			<%
			for (Book book : list) {
			%>
			<tr>
				<td><%=book.getName()%></td>
				<td><%=book.getAuthor()%></td>
				<td><%=book.getAvailableCopies()%></td>
				<td>
					<a class="issue-btn" href="issuePage?id=<%= book.getId() %>">Issue</a>
				</td>
			</tr>
			<%
			}
			%>

		</table>

	</div>

</body>
</html>