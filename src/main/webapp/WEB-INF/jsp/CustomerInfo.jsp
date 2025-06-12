<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="main-content" style="overflow-y: auto;">
	<div class="top-bar mb-3">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/SearchCustomerInfo/1"
			method="get">
			<div
				class="search-container position-relative d-flex align-items-center">
				<i class="fas fa-search position-absolute search-icon ms-3"></i> <input
					type="search" class="form-control ps-5" placeholder="Search..."
					name="searchQuery" id="searchInput" value="${searchQuery}" />
				<div class="right-icons position-absolute end-0 pe-3">
					<i class="fas fa-bell fa-lg me-3" style="cursor: pointer;"></i> <i
						class="fas fa-user-circle fa-lg" style="cursor: pointer;"></i>
				</div>
			</div>
		</form>
	</div>

	<div class="d-flex mb-3">
		<div class="d-flex">
			<!-- Name Sorting Dropdown -->
			<div class="dropdown me-2">
				<button class="btn btn-sm btn-outline-secondary dropdown-toggle"
					type="button" id="nameSortDropdown" data-bs-toggle="dropdown"
					aria-expanded="false">
					<i class="fas fa-sort-alpha-down"></i> Name
				</button>
				<ul class="dropdown-menu" aria-labelledby="nameSortDropdown">
					<li><a class="dropdown-item" href="#"
						onclick="applySort('name', 'asc')">A to Z</a></li>
					<li><a class="dropdown-item" href="#"
						onclick="applySort('name', 'desc')">Z to A</a></li>
				</ul>
			</div>

			<!-- Address Sorting Dropdown -->
			<div class="dropdown me-2">
				<button class="btn btn-sm btn-outline-secondary dropdown-toggle"
					type="button" id="addressSortDropdown" data-bs-toggle="dropdown"
					aria-expanded="false">
					<i class="fas fa-sort-alpha-down"></i> Address
				</button>
				<ul class="dropdown-menu" aria-labelledby="addressSortDropdown">
					<li><a class="dropdown-item" href="#"
						onclick="applySort('address', 'asc')">A to Z</a></li>
					<li><a class="dropdown-item" href="#"
						onclick="applySort('address', 'desc')">Z to A</a></li>
				</ul>
			</div>
		</div>

		<div class="ms-auto">
			<a href="${pageContext.request.contextPath}/CustomerInsertpage"
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
							<th>NO</th>
							<th><a
								href="?sortField=name&sortDirection=${param.sortField == 'name' && param.sortDirection == 'asc' ? 'desc' : 'asc'}&searchQuery=${searchQuery}">
									Name <c:if test="${param.sortField == 'name'}">
										<i
											class="fas fa-sort-${param.sortDirection == 'asc' ? 'up' : 'down'} ms-1"></i>
									</c:if> <c:if test="${param.sortField != 'name'}">
										<i class="fas fa-sort ms-1 text-muted"></i>
									</c:if>
							</a></th>
							<th>Phone</th>
							<th><a
								href="?sortField=address&sortDirection=${param.sortField == 'address' && param.sortDirection == 'asc' ? 'desc' : 'asc'}&searchQuery=${searchQuery}">
									Address <c:if test="${param.sortField == 'address'}">
										<i
											class="fas fa-sort-${param.sortDirection == 'asc' ? 'up' : 'down'} ms-1"></i>
									</c:if> <c:if test="${param.sortField != 'address'}">
										<i class="fas fa-sort ms-1 text-muted"></i>
									</c:if>
							</a></th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty customers}">
								<tr>
									<td colspan="5" class="text-center py-4">
										<div class="d-flex flex-column align-items-center">
											<i class="fas fa-search fa-3x text-muted mb-3"></i>
											<h5 class="text-muted">No customers found</h5>
											<c:if test="${not empty searchQuery}">
												<p class="text-muted">No results found for
													"${searchQuery}"</p>
											</c:if>
											<a href="${pageContext.request.contextPath}/CustomerInfo"
												class="btn btn-sm btn-primary mt-2"> <i
												class="fas fa-arrow-left me-1"></i> Back to all customers
											</a>
										</div>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="customer" items="${customers}"
									varStatus="status">
									<tr>
										<td>CUS${(currentPage - 1) * 10 + status.index + 1}</td>
										<!-- 
                                          ========================================
                                          SEQUENTIAL ROW NUMBER LOGIC:
                                          - Formula: (currentPage - 1) * 10 + status.index + 1
                                          - Example for Page 2:
                                            - Row 1: (2-1)*10 + 0 + 1 = 11
                                            - Row 2: (2-1)*10 + 1 + 1 = 12
                                          - Ensures continuous numbering across pages.
                                          ========================================
                                        -->
										<td><strong>${customer.customerName}</strong></td>
										<td>${customer.customerPh}</td>
										<td>${customer.customerAddress}</td>
										<td><a
											href="${pageContext.request.contextPath}/CustomerEdit/${customer.customerID}"
											class="btn btn-sm btn-outline-primary me-1"> <i
												class="fas fa-edit"></i>
										</a> <a
											href="${pageContext.request.contextPath}/CustomerDelete/${customer.customerID}"
											class="btn btn-sm btn-outline-danger me-1"> <i
												class="fas fa-trash"></i>
										</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

			<c:if test="${not empty customers and totalPages > 1}">
				<div class="d-flex justify-content-center mt-3">
					<nav aria-label="Page navigation">
						<ul class="pagination pagination-sm">
							<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
								<c:choose>
									<c:when test="${not empty searchQuery}">
										<a class="page-link"
											href="${pageContext.request.contextPath}/SearchCustomerInfo/${currentPage - 1}?searchQuery=${searchQuery}"
											aria-label="Previous"> <span aria-hidden="true">«</span>
										</a>
									</c:when>
									<c:otherwise>
										<a class="page-link"
											href="${pageContext.request.contextPath}/CustomerInfo/${currentPage - 1}"
											aria-label="Previous"> <span aria-hidden="true">«</span>
										</a>
									</c:otherwise>
								</c:choose>
							</li>
							<c:forEach begin="1" end="${totalPages}" var="i">
								<li class="page-item ${currentPage == i ? 'active' : ''}">
									<c:choose>
										<c:when test="${not empty searchQuery}">
											<a class="page-link"
												href="${pageContext.request.contextPath}/SearchCustomerInfo/${i}?searchQuery=${searchQuery}&sortField=${param.sortField}&sortDirection=${param.sortDirection}">
												${i} </a>
										</c:when>
										<c:otherwise>
											<a class="page-link"
												href="${pageContext.request.contextPath}/CustomerInfo/${i}?sortField=${param.sortField}&sortDirection=${param.sortDirection}">
												${i} </a>
										</c:otherwise>
									</c:choose>
								</li>
							</c:forEach>
							<li
								class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
								<c:choose>
									<c:when test="${not empty searchQuery}">
										<a class="page-link"
											href="${pageContext.request.contextPath}/SearchCustomerInfo/${currentPage + 1}?searchQuery=${searchQuery}"
											aria-label="Next"> <span aria-hidden="true">»</span>
										</a>
									</c:when>
									<c:otherwise>
										<a class="page-link"
											href="${pageContext.request.contextPath}/CustomerInfo/${currentPage + 1}"
											aria-label="Next"> <span aria-hidden="true">»</span>
										</a>
									</c:otherwise>
								</c:choose>
							</li>
						</ul>
					</nav>
				</div>
			</c:if>
		</div>
	</div>
</div>

<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						const searchInput = document
								.getElementById('searchInput');
						const searchForm = document
								.getElementById('searchForm');

						searchInput
								.addEventListener(
										'keypress',
										function(event) {
											if (event.key === 'Enter') {
												event.preventDefault();
												searchForm.action = `${pageContext.request.contextPath}/SearchCustomerInfo/1`;
												searchForm.submit();
											}
										});
					});

	// Apply sorting parameters and submit form
	function applySort(field, direction) {
		const searchQuery = "${searchQuery}";
		const isSearch = searchQuery && searchQuery.trim() !== "";

		const basePath = "${pageContext.request.contextPath}";

		// Build the URL correctly
		let actionUrl;
		if (isSearch) {
			actionUrl = basePath + "/SearchCustomerInfo/1?searchQuery="
					+ encodeURIComponent(searchQuery) + "&sortField=" + field
					+ "&sortDirection=" + direction;
		} else {
			actionUrl = basePath + "/CustomerInfo/1?sortField=" + field
					+ "&sortDirection=" + direction;
		}

		window.location.href = actionUrl;
	}

	// Update the existing search form to include sorting parameters
	document.addEventListener('DOMContentLoaded', function() {
		const searchForm = document.getElementById('searchForm');
		const sortField = "${param.sortField}";
		const sortDirection = "${param.sortDirection}";

		// Add hidden fields for sorting parameters
		if (sortField && sortDirection) {
			const sortFieldInput = document.createElement('input');
			sortFieldInput.type = 'hidden';
			sortFieldInput.name = 'sortField';
			sortFieldInput.value = sortField;
			searchForm.appendChild(sortFieldInput);

			const sortDirectionInput = document.createElement('input');
			sortDirectionInput.type = 'hidden';
			sortDirectionInput.name = 'sortDirection';
			sortDirectionInput.value = sortDirection;
			searchForm.appendChild(sortDirectionInput);
		}
	});
</script>
<style>
.text-muted {
	color: #6c757d !important;
}

.table tbody tr td.text-center {
	vertical-align: middle;
}
</style>