<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Main Content (scrollable) -->
<div class="main-content" >
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

	<div class="card mb-5 mx-auto" style="max-width: 400px; width: 100%;">
		<div class="card-body">
			<h5 class="card-title text-center mb-3">Login</h5>
			<form>
				<div class="mb-3">
					<input type="text" class="form-control" placeholder="Username"
						required />
				</div>
				<div class="mb-3">
					<input type="email" class="form-control" placeholder="Email"
						required />
				</div>
				<div class="mb-3">
					<input type="password" class="form-control" placeholder="Password"
						required />
				</div>
				<button type="submit" class="btn btn-primary w-100">Login</button>
			</form>
		</div>
	</div>




	<!-- Additional content to demonstrate scrolling -->
	<div style="height: 1000px;"></div>
</div>