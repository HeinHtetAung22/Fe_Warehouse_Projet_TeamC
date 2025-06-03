<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Main Content -->
<div class="main-content" style="overflow-y: auto;">
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

	<div class="card shadow-sm border-0">
		<div class="card-header bg-white border-0 py-3">
			<h5 class="card-title mb-0 text-primary">
				<i class="fas fa-key me-2"></i>Change Password
			</h5>
		</div>
		<div class="card-body pt-1">
			<form id="changePasswordForm" class="needs-validation" novalidate>
				<div class="mb-4">
					<label for="currentPassword" class="form-label fw-semibold">Current
						Password</label>
					<div class="input-group">
						<input type="password" class="form-control border-end-0"
							id="currentPassword" placeholder="Enter current password"
							required> <span class="input-group-text bg-white">
							<i class="fas fa-eye password-toggle text-muted"
							onclick="togglePassword('currentPassword')"></i>
						</span>
					</div>
					<div class="invalid-feedback">Please enter your current
						password</div>
				</div>

				<div class="mb-4">
					<label for="newPassword" class="form-label fw-semibold">New
						Password</label>
					<div class="input-group">
						<input type="password" class="form-control border-end-0"
							id="newPassword" placeholder="Enter new password" required
							pattern=".{6,}" oninput="checkPasswordStrength(this.value)">
						<span class="input-group-text bg-white"> <i
							class="fas fa-eye password-toggle text-muted"
							onclick="togglePassword('newPassword')"></i>
						</span>
					</div>
					<div class="invalid-feedback">Password must be at least 6
						characters</div>
					<div class="password-strength mt-2">
						<div class="progress" style="height: 4px;">
							<div id="passwordStrength" class="progress-bar"
								role="progressbar" style="width: 0%"></div>
						</div>
						<small class="text-muted" id="strengthText">Password
							strength</small>
					</div>
				</div>

				<div class="mb-4">
					<label for="confirmPassword" class="form-label fw-semibold">Confirm
						New Password</label>
					<div class="input-group">
						<input type="password" class="form-control border-end-0"
							id="confirmPassword" placeholder="Confirm new password" required>
						<span class="input-group-text bg-white"> <i
							class="fas fa-eye password-toggle text-muted"
							onclick="togglePassword('confirmPassword')"></i>
						</span>
					</div>
					<div class="invalid-feedback" id="confirmPasswordFeedback">
						Passwords must match</div>
				</div>

				<div id="errorMessage" class="alert alert-danger d-none mb-4">
					<i class="fas fa-exclamation-circle me-2"></i> <span id="errorText"></span>
				</div>

				<button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">
					<i class="fas fa-save me-2"></i> Update Password
				</button>
			</form>
		</div>
	</div>
</div>

<style>
.card {
	border-radius: 10px;
	border: 1px solid rgba(0, 0, 0, 0.08);
}

.form-control:focus {
	border-color: #86b7fe;
	box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.15);
}

.input-group-text {
	border-left: 0;
	cursor: pointer;
}

.password-toggle:hover {
	color: #0d6efd !important;
}

.password-strength {
	margin-top: 0.5rem;
}

.progress {
	background-color: #e9ecef;
}

.invalid-feedback {
	font-size: 0.85rem;
}
</style>

<script>
    // Form validation
    (function() {
        'use strict';
        
        const forms = document.querySelectorAll('.needs-validation');
        
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', function(e) {
                if (!form.checkValidity()) {
                    e.preventDefault();
                    e.stopPropagation();
                }
                
                form.classList.add('was-validated');
                
                // Custom validation for password match
                const newPass = document.getElementById('newPassword').value;
                const confirmPass = document.getElementById('confirmPassword').value;
                
                if (newPass !== confirmPass) {
                    document.getElementById('confirmPassword').classList.add('is-invalid');
                    document.getElementById('confirmPasswordFeedback').style.display = 'block';
                    e.preventDefault();
                    e.stopPropagation();
                } else {
                    document.getElementById('confirmPassword').classList.remove('is-invalid');
                }
            }, false);
        });
    })();
    
    // Password strength checker
    function checkPasswordStrength(password) {
        const strengthBar = document.getElementById('passwordStrength');
        const strengthText = document.getElementById('strengthText');
        
        // Reset
        strengthBar.style.width = '0%';
        strengthBar.className = 'progress-bar';
        
        if (password.length === 0) {
            strengthText.textContent = 'Password strength';
            return;
        }
        
        // Simple strength calculation
        let strength = 0;
        if (password.length > 6) strength += 25;
        if (password.length > 10) strength += 25;
        if (/[A-Z]/.test(password)) strength += 25;
        if (/\d/.test(password)) strength += 25;
        
        // Update UI
        strengthBar.style.width = strength + '%';
        
        if (strength < 50) {
            strengthBar.classList.add('bg-danger');
            strengthText.textContent = 'Weak password';
        } else if (strength < 75) {
            strengthBar.classList.add('bg-warning');
            strengthText.textContent = 'Moderate password';
        } else {
            strengthBar.classList.add('bg-success');
            strengthText.textContent = 'Strong password';
        }
    }
    
    // Toggle password visibility
    function togglePassword(id) {
        const input = document.getElementById(id);
        const icon = input.parentNode.querySelector('.password-toggle');
        
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }
    
    // Form submission handler
   // Form submission handler
document.getElementById('changePasswordForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const form = this;
    const isValid = form.checkValidity();
    const newPass = document.getElementById('newPassword').value;
    const confirmPass = document.getElementById('confirmPassword').value;

    if (!isValid || newPass !== confirmPass) {
        // If form is invalid or passwords do not match, do nothing
        form.classList.add('was-validated');
        return;
    }

    // If valid, simulate successful password change
    setTimeout(() => {
        const successAlert = `
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle me-2"></i>
                Password changed successfully!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        `;
        
        form.insertAdjacentHTML('beforebegin', successAlert);
        form.reset();
        form.classList.remove('was-validated');
    }, 1000);
});

</script>