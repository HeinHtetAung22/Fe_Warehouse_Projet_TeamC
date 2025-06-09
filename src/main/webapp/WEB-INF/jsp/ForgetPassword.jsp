<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Main Content (scrollable) -->
<div class="main-content">

	<div class="card" style="">
		<div class="card-body forgot-password-form" >
			<h2>Forgot Password</h2>
			<form id="forgotPasswordForm">
				<div class="mb-3">
					<label for="email" class="form-label">Email Address</label> <input
						type="email" class="form-control" id="email"
						placeholder="Enter your email" required>
					<div class="form-text">We'll send a password reset link to
						your email</div>
				</div>
				<div id="message" class="message"></div>
				<button type="submit" class="btn btn-primary btn-submit">Send
					Reset Link</button>
			</form>
		</div>
	</div>

	<!-- Additional content to demonstrate scrolling -->
	<div style="height: 1000px;"></div>
</div>
<script>
	document
			.getElementById('forgotPasswordForm')
			.addEventListener(
					'submit',
					function(e) {
						e.preventDefault();
						const email = document.getElementById('email').value;
						const messageDiv = document.getElementById('message');

						// Simple validation
						if (!email) {
							messageDiv.textContent = 'Please enter your email address';
							messageDiv.className = 'message error';
							return;
						}

						// Simulate sending the reset link
						messageDiv.textContent = 'Password reset link has been sent to your email';
						messageDiv.className = 'message success';

						// In a real application, you would make an AJAX call here
						console.log('Password reset requested for:', email);
					});
</script>