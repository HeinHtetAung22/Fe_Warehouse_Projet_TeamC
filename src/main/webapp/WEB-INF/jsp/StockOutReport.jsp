<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="main-content">
    <div class="top-bar mb-3">
        <form id="searchForm" action="${pageContext.request.contextPath}/SearchStockOutInfo/1" method="get">
            <div class="search-container position-relative d-flex align-items-center">
                <i class="fas fa-search position-absolute search-icon ms-3"></i>
                <input type="search" id="searchInput" class="form-control ps-5" placeholder="Search..." name="searchQuery" value="${searchQuery}" />
                <div class="right-icons position-absolute end-0 pe-3">
                    <i class="fas fa-bell fa-lg me-3" style="cursor: pointer;"></i>
                    <i class="fas fa-user-circle fa-lg" style="cursor: pointer;"></i>
                </div>
            </div>
        </form>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Out ID</th>
                            <th>Stock ID</th>
                            <th>Quantity</th>
                            <th>Date Out</th>
                            <th>Customer</th>
                            <th>Warehouse</th>
                            <th>Remarks</th>
                            <!-- <th>Actions</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty stockOuts}">
                                <tr>
                                    <td colspan="8" class="text-center py-4">
                                        <div class="d-flex flex-column align-items-center">
                                            <i class="fas fa-search fa-3x text-muted mb-3"></i>
                                            <h5 class="text-muted">No stock-out records found</h5>
                                            <c:if test="${not empty searchQuery}">
                                                <p class="text-muted">No results found for "${searchQuery}"</p>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/StockOutReport/1" class="btn btn-sm btn-primary mt-2">
                                                <i class="fas fa-arrow-left me-1"></i> Back to all stock-outs
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="stockOut" items="${stockOuts}">
                                    <tr>
                                        <td>${stockOut.outID}</td>
                                        <td>${stockOut.stockID}</td>
                                        <td>${stockOut.quantity}</td>
                                        <td><fmt:formatDate value="${stockOut.dateOut}" pattern="yyyy-MM-dd" /></td>
                                        <td>${stockOut.customerID}</td>
                                        <td>${stockOut.wareHouseID}</td>
                                        <td>${stockOut.remarks}</td>
                                        <!-- <td>
                                            <a href="${pageContext.request.contextPath}/editStockOut?id=${stockOut.outID}"
                                                class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/deleteStockOut?id=${stockOut.outID}"
                                                class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </td> -->
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <c:if test="${not empty stockOuts and totalPages > 1}">
                <div class="d-flex justify-content-center mt-3">
                    <nav aria-label="Page navigation">
                        <ul class="pagination pagination-sm">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <c:choose>
                                    <c:when test="${not empty searchQuery}">
                                        <a class="page-link" href="${pageContext.request.contextPath}/SearchStockOutInfo/${currentPage - 1}?searchQuery=${searchQuery}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="page-link" href="${pageContext.request.contextPath}/StockOutReport/${currentPage - 1}"
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
                                            <a class="page-link" href="${pageContext.request.contextPath}/SearchStockOutInfo/${i}?searchQuery=${searchQuery}">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="page-link" href="${pageContext.request.contextPath}/StockOutReport/${i}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>

                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <c:choose>
                                    <c:when test="${not empty searchQuery}">
                                        <a class="page-link" href="${pageContext.request.contextPath}/SearchStockOutInfo/${currentPage + 1}?searchQuery=${searchQuery}"
                                           aria-label="Next">
                                            <span aria-hidden="true">»</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="page-link" href="${pageContext.request.contextPath}/StockOutReport/${currentPage + 1}"
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
            event.preventDefault(); // Prevent the default form submission
            searchForm.action = `${pageContext.request.contextPath}/SearchStockOutInfo/1`; // Set the action to the first page of search results
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