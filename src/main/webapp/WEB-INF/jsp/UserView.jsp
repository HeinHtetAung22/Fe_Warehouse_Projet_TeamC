<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Main Content -->
<div class="main-content">
    <div class="top-bar mb-3">
        <div class="search-container position-relative d-flex align-items-center">
            <!-- Search icon -->
            <i class="fas fa-search position-absolute search-icon ms-3"></i>
            <!-- Search input -->
            <input type="search" class="form-control ps-5" placeholder="Search..." />
            <!-- Right-side icons -->
            <div class="right-icons position-absolute end-0 pe-3">
                <i class="fas fa-bell fa-lg me-3" style="cursor: pointer;"></i> 
                <i class="fas fa-user-circle fa-lg" style="cursor: pointer;"></i>
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
                            <th>ID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="customer" items="${customers}">
                            <tr>
                                <td>${customer.customerID}</td>
                                <td><strong>${customer.customerName}</strong></td>
                                <td>${customer.customerPh}</td>
                                <td>${customer.customerAddress}</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary me-1">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger">
                                        <i class="fas fa-trash"></i>
                                    </button>
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
                <%-- Previous button --%>
                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="/UserView/${currentPage - 1}" 
                       aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </a>
                </li>
                
                <%-- Page numbers --%>
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/UserView/${i}">${i}</a>
                    </li>
                </c:forEach>
                
                <%-- Next button --%>
                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/UserView/${currentPage + 1}" 
                       aria-label="Next">
                        <span aria-hidden="true">»</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</c:if>
        </div>
    </div>
</div>