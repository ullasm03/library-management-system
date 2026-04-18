<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>

<style>
	body {
		font-family: 'Segoe UI', sans-serif;
		background: linear-gradient(135deg, #43cea2, #185a9d);
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
		margin: 0;
	}

	/* 🌟 Glass container */
	.container {
		background: rgba(255, 255, 255, 0.15);
		backdrop-filter: blur(12px);
		padding: 35px;
		border-radius: 20px;
		box-shadow: 0 15px 35px rgba(0,0,0,0.3);
		width: 320px;
		color: white;
		text-align: center;
		animation: fadeIn 0.8s ease-in-out;
	}

	@keyframes fadeIn {
		from { opacity: 0; transform: translateY(20px); }
		to { opacity: 1; transform: translateY(0); }
	}

	h2 {
		margin-bottom: 25px;
	}

	/* ✨ Floating input style */
	.input-group {
		position: relative;
		margin-bottom: 20px;
	}

	.input-group input {
		width: 100%;
		padding: 12px;
		border: none;
		border-radius: 8px;
		outline: none;
		background: rgba(255,255,255,0.2);
		color: white;
		font-size: 14px;
	}

	.input-group label {
		position: absolute;
		top: 50%;
		left: 12px;
		transform: translateY(-50%);
		color: #ddd;
		font-size: 13px;
		pointer-events: none;
		transition: 0.3s;
	}

	.input-group input:focus + label,
	.input-group input:valid + label {
		top: -8px;
		font-size: 11px;
		color: #fff;
	}

	/* 🔘 Button */
	input[type="submit"] {
		width: 100%;
		padding: 12px;
		background: linear-gradient(135deg, #00c6ff, #0072ff);
		color: white;
		border: none;
		border-radius: 25px;
		cursor: pointer;
		font-size: 16px;
		font-weight: bold;
		transition: 0.3s;
		box-shadow: 0 5px 15px rgba(0,0,0,0.3);
	}

	input[type="submit"]:hover {
		transform: scale(1.05);
		box-shadow: 0 10px 20px rgba(0,0,0,0.4);
	}

	/* 🔙 Back button */
	.back-btn {
		display: inline-block;
		margin-top: 15px;
		text-decoration: none;
		color: white;
		font-size: 14px;
		opacity: 0.8;
		transition: 0.3s;
	}

	.back-btn:hover {
		opacity: 1;
		text-decoration: underline;
	}
</style>

</head>
<body>

	<div class="container">
		<h2>📘 Add Book</h2>

		<form action="addBook" method="post">
			
			<div class="input-group">
				<input type="text" name="name" required>
				<label>Book Name</label>
			</div>

			<div class="input-group">
				<input type="text" name="author" required>
				<label>Author</label>
			</div>

			<div class="input-group">
				<input type="text" name="availableCopies" required>
				<label>No of Copies</label>
			</div>

			<input type="submit" value="Add Book">

		</form>

		<a href="books" class="back-btn">⬅ Back to Book List</a>
	</div>

</body>
</html>