<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>

<style>
	body {
		font-family: 'Segoe UI', sans-serif;
		background: linear-gradient(135deg, #56ab2f, #a8e063);
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
		margin: 0;
	}

	/* 🌿 Glass container */
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

	/* ✨ Floating inputs */
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
		color: #e0e0e0;
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

	/* 🔘 Submit Button */
	input[type="submit"] {
		width: 100%;
		padding: 12px;
		background: linear-gradient(135deg, #00c853, #2e7d32);
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

	/* 🔙 Back Button */
	.back-btn {
		display: inline-block;
		margin-top: 18px;
		text-decoration: none;
		color: white;
		font-size: 14px;
		padding: 8px 14px;
		border-radius: 20px;
		background: rgba(0,0,0,0.2);
		transition: 0.3s;
	}

	.back-btn:hover {
		background: rgba(0,0,0,0.4);
		transform: scale(1.05);
	}
</style>

</head>
<body>

	<div class="container">
		<h2>👤 Add Student</h2>

		<form action="addStudent" method="post">
			
			<div class="input-group">
				<input type="text" name="name" required>
				<label>Student Name</label>
			</div>

			<div class="input-group">
				<input type="text" name="email" required>
				<label>Email Address</label>
			</div>

			<input type="submit" value="Add Student">

		</form>

		<a href="books" class="back-btn">⬅ Back to Dashboard</a>
	</div>

</body>
</html>