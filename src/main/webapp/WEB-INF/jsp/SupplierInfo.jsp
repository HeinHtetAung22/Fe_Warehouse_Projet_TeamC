<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="main-content">
    <div class="top-bar mb-3">
        <form id="searchForm" action="${pageContext.request.contextPath}/SearchSupplierInfo/1" method="get">
            <div class="search-container position-relative d-flex align-items-center">
                <i class="fas fa-search position-absolute search-icon ms-3"></i> 
                <input type="search" class="form-control ps-5" placeholder="Search..."
                    name="searchQuery" id="searchInput" value="${searchQuery}" />
                <div class="right-icons position-absolute end-0 pe-3">
                    <i class="fas fa-bell fa-lg me-3" style="cursor: pointer;"></i> 
                    <i class="fas fa-user-circle fa-lg" style="cursor: pointer;"></i>
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
                        <c:choose>
                            <c:when test="${empty suppliers}">
                                <tr>
                                    <td colspan="5" class="text-center py-4">
                                        <div class="d-flex flex-column align-items-center">
                                            <i class="fas fa-search fa-3x text-muted mb-3"></i>
                                            <h5 class="text-muted">No suppliers found</h5>
                                            <c:if test="${not empty searchQuery}">
                                                <p class="text-muted">No results found for "${searchQuery}"</p>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/SupplierInfo" class="btn btn-sm btn-primary mt-2">
                                                <i class="fas fa-arrow-left me-1"></i> Back to all suppliers
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="supplier" items="${suppliers}">
                                    <tr>
                                        <td>${supplier.formattedId}</td>
                                        <td><strong>${supplier.supplierName}</strong></td>
                                        <td>${supplier.supplierPh}</td>
                                        <td>${supplier.supplierAddress}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/SupplierEdit/${supplier.supplierID}"
                                                class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/SupplierDelete/${supplier.supplierID}"
                                                class="btn btn-sm btn-outline-danger me-1">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <c:if test="${not empty suppliers and totalPages > 1}">
                <div class="d-flex justify-content-center mt-3">
                    <nav aria-label="Page navigation">
                        <ul class="pagination pagination-sm">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <c:choose>
                                    <c:when test="${not empty searchQuery}">
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/SearchSupplierInfo/${currentPage - 1}?searchQuery=${searchQuery}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/SupplierInfo/${currentPage - 1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <c:choose>
                                        <c:when test="${not empty searchQuery}">
                                            <a class="page-link"
                                               href="${pageContext.request.contextPath}/SearchSupplierInfo/${i}?searchQuery=${searchQuery}">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="page-link"
                                               href="${pageContext.request.contextPath}/SupplierInfo/${i}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <c:choose>
                                    <c:when test="${not empty searchQuery}">
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/SearchSupplierInfo/${currentPage + 1}?searchQuery=${searchQuery}"
                                           aria-label="Next">
                                            <span aria-hidden="true">»</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/SupplierInfo/${currentPage + 1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">»</span>
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
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('searchInput');
    const searchForm = document.getElementById('searchForm');

    searchInput.addEventListener('keypress', function(event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            searchForm.action = `${pageContext.request.contextPath}/SearchSupplierInfo/1`;
            searchForm.submit();
        }
    });
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