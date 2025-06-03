<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Main Content (scrollable) -->
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

	<div class="card" >
		<div class="card-body">
			<div class="form-section" >
				<h4 class="mb-4">Update User</h4>
				<form>
					<div class="row mb-3">
						<div class="col-md-6 form-floating mb-3">
							<input type="text" class="form-control" id="firstName"
								placeholder="First Name" value="John" required> <label
								style="margin-left: 10px;" for="firstName">First Name</label>
						</div>
						<div class="col-md-6 form-floating mb-3">
							<input type="text" class="form-control" id="lastName"
								placeholder="Last Name" value="Doe" required> <label
								style="margin-left: 10px;" for="lastName">Last Name</label>
						</div>
					</div>

					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="address"
							placeholder="Address" value="123 Main St" required> <label
							for="address">Address</label>
					</div>

					<div class="form-floating mb-3">
						<input type="tel" class="form-control" id="phone"
							placeholder="Phone Number" value="123-456-7890" required>
						<label for="phone">Phone Number</label>
					</div>

					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="email"
							placeholder="Email" value="john@example.com" required> <label
							for="email">Email</label>
					</div>

					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="password"
							placeholder="Password" required> <label for="password">Password</label>
					</div>

					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="confirmpassword"
							placeholder="Confirm Password" required> <label
							for="confirmpassword">Confirm Password</label>
					</div>

					<div class="d-flex justify-content-end mt-4">
						<button type="submit" class="btn btn-primary me-2">Update</button>
						<button type="button" class="btn btn-outline-secondary">Cancel</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Extra content to enable scrolling -->
	<div style="height: 1000px;"></div>
</div>
