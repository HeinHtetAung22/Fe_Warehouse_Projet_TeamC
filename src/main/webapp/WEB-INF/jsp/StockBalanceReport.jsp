<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Main Content -->
<div class="main-content" style="overflow-y: auto;">
    <div class="top-bar mb-3">
        <form id="searchForm" action="${pageContext.request.contextPath}/SearchStockBalanceInfo/1" method="get">
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
                        	<th>NO</th>
                            <th>Balance ID</th>
                            <th>Stock Name</th>
                            <th>Available Quantity</th>
                            <th>Last Updated</th>
                            <!-- <th>Actions</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty stockBalances}">
                                <tr>
                                    <td colspan="5" class="text-center py-4">
                                        <div class="d-flex flex-column align-items-center">
                                            <i class="fas fa-search fa-3x text-muted mb-3"></i>
                                            <h5 class="text-muted">No stock balance records found</h5>
                                            <c:if test="${not empty searchQuery}">
                                                <p class="text-muted">No results found for "${searchQuery}"</p>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/StockBalanceReport/1" class="btn btn-sm btn-primary mt-2">
                                                <i class="fas fa-arrow-left me-1"></i> Back to all stock balances
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="balance" items="${stockBalances}" varStatus="status">
                                    <tr>
                                    <td>${(currentPage - 1) * 10 + status.index + 1}</td>
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
                                        <td>${balance.balanceID}</td>
                                        <td>${balance.stockName}</td>
                                        <td>${balance.availableQty}</td>
                                        <td><fmt:formatDate value="${balance.lastUpdated}" pattern="MM-dd-yyyy" /></td>
                                        <!-- <td>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td> -->
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            
            <!-- Pagination -->
            <c:if test="${not empty stockBalances and totalPages > 1}">
                <div class="d-flex justify-content-center mt-3">
                    <nav aria-label="Page navigation">
                        <ul class="pagination pagination-sm">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <c:choose>
                                    <c:when test="${not empty searchQuery}">
                                        <a class="page-link" href="${pageContext.request.contextPath}/SearchStockBalanceInfo/${currentPage - 1}?searchQuery=${searchQuery}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="page-link" href="${pageContext.request.contextPath}/StockBalanceReport/${currentPage - 1}"
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
                                            <a class="page-link" href="${pageContext.request.contextPath}/SearchStockBalanceInfo/${i}?searchQuery=${searchQuery}">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="page-link" href="${pageContext.request.contextPath}/StockBalanceReport/${i}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>

                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <c:choose>
                                    <c:when test="${not empty searchQuery}">
                                        <a class="page-link" href="${pageContext.request.contextPath}/SearchStockBalanceInfo/${currentPage + 1}?searchQuery=${searchQuery}"
                                           aria-label="Next">
                                            <span aria-hidden="true">»</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="page-link" href="${pageContext.request.contextPath}/StockBalanceReport/${currentPage + 1}"
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
            searchForm.action = `${pageContext.request.contextPath}/SearchStockBalanceInfo/1`; // Set the action to the first page of search results
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