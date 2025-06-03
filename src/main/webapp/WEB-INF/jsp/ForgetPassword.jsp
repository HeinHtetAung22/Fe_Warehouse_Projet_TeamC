<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Main Content (scrollable) -->
<div class="main-content">
	<div class="top-bar">
		<div
			class="search-container position-relative d-flex align-items-center">
			<i class="fas fa-search position-absolute search-icon ms-3"></i> <input
				type="search" class="form-control ps-5" placeholder="Search..." />
			<div class="right-icons position-absolute end-0 pe-3">
				<i class="fas fa-bell fa-lg me-3" style="cursor: pointer;"></i> <i
					class="fas fa-user-circle fa-lg" style="cursor: pointer;"></i>
			</div>
		</div>
	</div>

	<div class="d-flex mb-3">
		<div class="ms-auto">
			<button class="btn btn-sm btn-primary mt-2">
				<i class="fas fa-plus me-1"></i> Add New
			</button>
		</div>
	</div>

	<div class="card">
		<div class="card-body forgot-password-form">
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