<%@page import="com.jsp.library.entity.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.library.entity.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Issue Book</title>

<style>
	body {
		font-family: 'Segoe UI', sans-serif;
		background: linear-gradient(135deg, #667eea, #764ba2);
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
		margin: 0;
	}

	.container {
		background: rgba(255,255,255,0.15);
		backdrop-filter: blur(12px);
		padding: 30px;
		border-radius: 20px;
		width: 350px;
		text-align: center;
		color: white;
		box-shadow: 0 10px 30px rgba(0,0,0,0.3);
	}

	h2 {
		margin-bottom: 20px;
	}

	.book-box {
		background: rgba(255,255,255,0.2);
		padding: 10px;
		border-radius: 10px;
		margin-bottom: 20px;
		font-size: 16px;
	}

	select {
		width: 100%;
		padding: 10px;
		border-radius: 8px;
		border: none;
		margin-top: 10px;
		font-size: 14px;
	}

	button {
		margin-top: 20px;
		width: 100%;
		padding: 12px;
		border: none;
		border-radius: 25px;
		background: linear-gradient(135deg, #ff416c, #ff4b2b);
		color: white;
		font-size: 16px;
		cursor: pointer;
		transition: 0.3s;
	}

	button:hover {
		transform: scale(1.05);
	}

	.back-btn {
		display: inline-block;
		margin-top: 15px;
		color: white;
		text-decoration: none;
	}
</style>

</head>
<body>

	<%
	Book book = (Book) request.getAttribute("book");
	List<Student> list = (List<Student>) request.getAttribute("list");
	%>

	<div class="container">
		<h2>📖 Issue Book</h2>

		<div class="book-box">
			<b>Book:</b> <%= book.getName() %>
		</div>

		<form action="issueBook" method="post">

			<!-- ✅ Hidden inside form -->
			<input type="hidden" name="bookId" value="<%=book.getId()%>">

			<label>Select Student</label>
			<select name="studentId" required>
				<option value="">-- Select Student --</option>

				<%
				for(Student student : list){
				%>
				<option value="<%= student.getId() %>">
					<%= student.getName() %>
				</option>
								
				<%
				}
				%>
			</select>

			<button type="submit">Issue Book</button>

		</form>

		<a href="books" class="back-btn">⬅ Back</a>
	</div>

</body>
</html>