<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Main Content -->
<div class="main-content">
	<div class="top-bar mb-3">
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

	<!-- <div class="d-flex mb-3">
		<div class="ms-auto">
			<button class="btn btn-sm btn-primary">
				<i class="fas fa-plus me-1"></i> Add New
			</button>
		</div>
	</div>-->

	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>In ID</th>
							<th>Stock ID</th>
							<th>Quantity</th>
							<th>Date In</th>
							<th>Supplier</th>
							<th>Warehouse</th>
							<th>Remarks</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="stockIn" items="${stockIns}">
							<tr>
								<td>${stockIn.inID}</td>
								<td>${stockIn.stockID}</td>
								<td>${stockIn.quantity}</td>
								<td><fmt:formatDate value="${stockIn.dateIn}"
										pattern="yyyy-MM-dd" /></td>
								<td>${stockIn.supplierID}</td>
								<td>${stockIn.wareHouseID}</td>
								<td>${stockIn.remarks}</td>
								<td>
								<a href="/editStockIn?id=${stockIn.inID}"
									class="btn btn-sm btn-outline-primary me-1"> <i
										class="fas fa-edit"></i>
									</a>
									 <a href="/deleteStockIn?id=${stockIn.inID}"
									class="btn btn-sm btn-outline-danger"> <i
										class="fas fa-trash"></i>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- Pagination -->
			<c:if test="${totalPages > 1}">
				<div class="d-flex justify-content-center mt-3">
					<nav aria-label="Page navigation">
						<ul class="pagination pagination-sm">
							<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
								<a class="page-link" href="${pageContext.request.contextPath}/StockInReport/${currentPage - 1}"
								aria-label="Previous"> <span aria-hidden="true">«</span>
							</a>
							</li>

							<c:forEach begin="1" end="${totalPages}" var="i">
								<li class="page-item ${currentPage == i ? 'active' : ''}">
									<a class="page-link"
									href="${pageContext.request.contextPath}/StockInReport/${i}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
								<a class="page-link"
								href="${pageContext.request.contextPath}/StockInReport/${currentPage + 1}"
								aria-label="Next"> <span aria-hidden="true">»</span>
							</a>
							</li>
						</ul>
					</nav>
				</div>
			</c:if>
		</div>
	</div>
</div>