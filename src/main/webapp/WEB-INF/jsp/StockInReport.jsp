<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Main Content -->
<div class="main-content">
	<div class="top-bar mb-3">

		<div
			class="search-container position-relative d-flex align-items-center">
			<!-- Search icon -->
			<i class="fas fa-search position-absolute search-icon ms-3"></i>

			<!-- Search input -->
			<input type="search" class="form-control ps-5"
				placeholder="Search..." />

			<!-- Right-side icons -->
			<div class="right-icons position-absolute end-0 pe-3">
				<i class="fas fa-bell fa-lg me-3" style="cursor: pointer;"></i> <i
					class="fas fa-user-circle fa-lg" style="cursor: pointer;"></i>
			</div>
		</div>
	</div>

	<div class="d-flex mb-3">
		<div class="ms-auto">
			<button class="btn btn-sm btn-primary">
				<i class="fas fa-plus me-1"></i> Add New
			</button>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Item ID</th>
							<th>Item Name</th>
							<th>Category</th>
							<th>Quantity</th>
							<th>Purchase Price</th>
							<th>Stock Value</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>001</td>
							<td><strong>USB Cable</strong></td>
							<td>Electronics</td>
							<td>120</td>
							<td>$2.00</td>
							<td>$240.00</td>
						</tr>
						<tr>
							<td>002</td>
							<td><strong>T shrit-l</strong></td>
							<td>Apparel</td>
							<td>75</td>
							<td>$5.00</td>
							<td>$375.00</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>