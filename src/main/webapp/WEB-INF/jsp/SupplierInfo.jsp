<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="main-content">
	<div class="top-bar mb-3">
		<%-- Removed the action from the form for search, it's better handled via JavaScript --%>
		<form id="searchForm"
			action="${pageContext.request.contextPath}/SearchSupplierInfo"
			method="get">
			<div
				class="search-container position-relative d-flex align-items-center">
				<i class="fas fa-search position-absolute search-icon ms-3"></i> <input
					type="search" class="form-control ps-5" placeholder="Search..."
					name="searchQuery" id="searchInput" />
				<div class="right-icons position-absolute end-0 pe-3">
					<i class="fas fa-bell fa-lg me-3" style="cursor: pointer;"></i> <i
						class="fas fa-user-circle fa-lg" style="cursor: pointer;"></i>
				</div>
			</div>
		</form>
	</div>

	<div class="d-flex mb-3">
		<div class="ms-auto">
			<a href="${pageContext.request.contextPath}/SupplierInsertpage"
				style="text-decoration: none;">
				<button class="btn btn-sm btn-primary">
					<i class="fas fa-plus me-1"></i> Add New
				</button>
			</a>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Address</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="supplier" items="${suppliers}">
							<tr>
								<td>${supplier.formattedId}</td>
								<td><strong>${supplier.supplierName}</strong></td>
								<td>${supplier.supplierPh}</td>
								<td>${supplier.supplierAddress}</td>
								<td><a
									href="${pageContext.request.contextPath}/SupplierEdit/${supplier.supplierID}"
									class="btn btn-sm btn-outline-primary me-1"> <i
										class="fas fa-edit"></i>
								</a> <a
									href="${pageContext.request.contextPath}/SupplierDelete/${supplier.supplierID}"
									class="btn btn-sm btn-outline-danger me-1"> <i
										class="fas fa-trash"></i>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<c:if test="${totalPages > 1}">
				<div class="d-flex justify-content-center mt-3">
					<nav aria-label="Page navigation">
						<ul class="pagination pagination-sm">
							<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
								<a class="page-link"
								href="${pageContext.request.contextPath}/SupplierInfo/${currentPage - 1}"
								aria-label="Previous"> <span aria-hidden="true">«</span>
							</a>
							</li>



							<c:forEach begin="1" end="${totalPages}" var="i">
								<li class="page-item ${currentPage == i ? 'active' : ''}">
									<a class="page-link"
									href="${pageContext.request.contextPath}/SearchSupplierInfo/${i}?searchQuery=${searchQuery}">
										${i} </a>
								</li>
							</c:forEach>

							

							<li
								class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
								<a class="page-link"
								href="${pageContext.request.contextPath}/SearchSupplierInfo/${currentPage + 1}?searchQuery=${searchQuery}"
								aria-label="Next"> <span aria-hidden="true">»</span>
							</a>
							</li>


							<!-- <c:forEach begin="1" end="${totalPages}" var="i">
								<li class="page-item ${currentPage == i ? 'active' : ''}">
									<a class="page-link"
									href="${pageContext.request.contextPath}/SupplierInfo/${i}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
								<a class="page-link"
								href="${pageContext.request.contextPath}/SupplierInfo/${currentPage + 1}"
								aria-label="Next"> <span aria-hidden="true">»</span>
							</a>
							</li>-->
						</ul>
					</nav>
				</div>
			</c:if>
		</div>
	</div>
</div>


<script>
	document.addEventListener('DOMContentLoaded', function() {
		const searchInput = document.getElementById('searchInput');
		const searchForm = document.getElementById('searchForm');

		searchInput.addEventListener('keypress', function(event) {
			// Check if the pressed key is 'Enter' (key code 13)
			if (event.key === 'Enter') {
				event.preventDefault(); // Prevent the default form submission (e.g., if there's only one input field)
				searchForm.submit(); // Submit the form
			}
		});
	});
</script>