<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="main-content" style="overflow-y: auto;">
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
            <!-- Hidden fields for sorting parameters -->
            <input type="hidden" name="sortField" id="sortField" value="${param.sortField}">
            <input type="hidden" name="sortDirection" id="sortDirection" value="${param.sortDirection}">
            <input type="hidden" name="yearFilter" id="yearFilter" value="${param.yearFilter}">
        </form>
    </div>

    <!-- Sorting Controls -->
    <div class="d-flex mb-3">
        <div class="d-flex">
            <!-- Stock Name Sorting -->
            <div class="dropdown me-2">
                <button class="btn btn-sm btn-outline-secondary dropdown-toggle"
                    type="button" id="nameSortDropdown" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <i class="fas fa-sort-alpha-down"></i> Stock Name
                </button>
                <ul class="dropdown-menu" aria-labelledby="nameSortDropdown">
                    <li><a class="dropdown-item" href="#" onclick="applySort('stockName', 'asc')">A to Z</a></li>
                    <li><a class="dropdown-item" href="#" onclick="applySort('stockName', 'desc')">Z to A</a></li>
                </ul>
            </div>

            <!-- Date Out Sorting -->
            <div class="dropdown me-2">
                <button class="btn btn-sm btn-outline-secondary dropdown-toggle"
                    type="button" id="dateSortDropdown" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <i class="fas fa-sort-numeric-down"></i> Date Out
                </button>
                <ul class="dropdown-menu" aria-labelledby="dateSortDropdown">
                    <li><a class="dropdown-item" href="#" onclick="applySort('dateOut', 'desc')">Newest First</a></li>
                    <li><a class="dropdown-item" href="#" onclick="applySort('dateOut', 'asc')">Oldest First</a></li>
                </ul>
            </div>

            <!-- Quantity Sorting -->
            <div class="dropdown me-2">
                <button class="btn btn-sm btn-outline-secondary dropdown-toggle"
                    type="button" id="quantitySortDropdown" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <i class="fas fa-sort-amount-down"></i> Quantity
                </button>
                <ul class="dropdown-menu" aria-labelledby="quantitySortDropdown">
                    <li><a class="dropdown-item" href="#" onclick="applySort('quantity', 'desc')">High to Low</a></li>
                    <li><a class="dropdown-item" href="#" onclick="applySort('quantity', 'asc')">Low to High</a></li>
                </ul>
            </div>

            <!-- Year Filter Dropdown -->
            <div class="dropdown me-2">
                <button class="btn btn-sm btn-outline-secondary dropdown-toggle"
                    type="button" id="yearFilterDropdown" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <i class="fas fa-calendar-alt"></i> Year
                </button>
                <ul class="dropdown-menu" aria-labelledby="yearFilterDropdown">
                    <li><a class="dropdown-item ${param.yearFilter == 'all' or empty param.yearFilter ? 'active' : ''}"
                        href="?yearFilter=all&sortField=${param.sortField}&sortDirection=${param.sortDirection}&searchQuery=${searchQuery}">All Years</a></li>
                    <c:forEach var="year" items="${availableYears}">
                        <li><a class="dropdown-item ${param.yearFilter == year ? 'active' : ''}"
                            href="?yearFilter=${year}&sortField=${param.sortField}&sortDirection=${param.sortDirection}&searchQuery=${searchQuery}">${year}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>Out ID</th>
                            <th><a href="?sortField=stockName&sortDirection=${param.sortField == 'stockName' && param.sortDirection == 'asc' ? 'desc' : 'asc'}&searchQuery=${searchQuery}&yearFilter=${param.yearFilter}">
                                Stock Name
                                <c:if test="${param.sortField == 'stockName'}">
                                    <i class="fas fa-sort-${param.sortDirection == 'asc' ? 'up' : 'down'} ms-1"></i>
                                </c:if>
                                <c:if test="${param.sortField != 'stockName'}">
                                    <i class="fas fa-sort ms-1 text-muted"></i>
                                </c:if>
                            </a></th>
                            <th><a href="?sortField=quantity&sortDirection=${param.sortField == 'quantity' && param.sortDirection == 'asc' ? 'desc' : 'asc'}&searchQuery=${searchQuery}&yearFilter=${param.yearFilter}">
                                Quantity
                                <c:if test="${param.sortField == 'quantity'}">
                                    <i class="fas fa-sort-${param.sortDirection == 'asc' ? 'up' : 'down'} ms-1"></i>
                                </c:if>
                                <c:if test="${param.sortField != 'quantity'}">
                                    <i class="fas fa-sort ms-1 text-muted"></i>
                                </c:if>
                            </a></th>
                            <th><a href="?sortField=dateOut&sortDirection=${param.sortField == 'dateOut' && param.sortDirection == 'asc' ? 'desc' : 'asc'}&searchQuery=${searchQuery}&yearFilter=${param.yearFilter}">
                                Date Out
                                <c:if test="${param.sortField == 'dateOut'}">
                                    <i class="fas fa-sort-${param.sortDirection == 'asc' ? 'up' : 'down'} ms-1"></i>
                                </c:if>
                                <c:if test="${param.sortField != 'dateOut'}">
                                    <i class="fas fa-sort ms-1 text-muted"></i>
                                </c:if>
                            </a></th>
                            <th>Customer Name</th>
                            <th>Warehouse</th>
                            <th>Remarks</th>
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
                                <c:forEach var="stockOut" items="${stockOuts}" varStatus="status">
                                    <tr>
                                        <td>${(currentPage - 1) * 10 + status.index + 1}</td>
                                        <td>${stockOut.outID}</td>
                                        <td>${stockOut.stockName}</td>
                                        <td>${stockOut.quantity}</td>
                                        <td><fmt:formatDate value="${stockOut.dateOut}" pattern="MM-dd-yyyy" /></td>
                                        <td>${stockOut.customerName}</td>
                                        <td>${stockOut.wareHouseID}</td>
                                        <td>${stockOut.remarks}</td>
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
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/SearchStockOutInfo/${currentPage - 1}?searchQuery=${searchQuery}&sortField=${param.sortField}&sortDirection=${param.sortDirection}&yearFilter=${param.yearFilter}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/StockOutReport/${currentPage - 1}?sortField=${param.sortField}&sortDirection=${param.sortDirection}&yearFilter=${param.yearFilter}"
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
                                               href="${pageContext.request.contextPath}/SearchStockOutInfo/${i}?searchQuery=${searchQuery}&sortField=${param.sortField}&sortDirection=${param.sortDirection}&yearFilter=${param.yearFilter}">
                                                ${i}
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="page-link"
                                               href="${pageContext.request.contextPath}/StockOutReport/${i}?sortField=${param.sortField}&sortDirection=${param.sortDirection}&yearFilter=${param.yearFilter}">
                                                ${i}
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>

                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <c:choose>
                                    <c:when test="${not empty searchQuery}">
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/SearchStockOutInfo/${currentPage + 1}?searchQuery=${searchQuery}&sortField=${param.sortField}&sortDirection=${param.sortDirection}&yearFilter=${param.yearFilter}"
                                           aria-label="Next">
                                            <span aria-hidden="true">»</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/StockOutReport/${currentPage + 1}?sortField=${param.sortField}&sortDirection=${param.sortDirection}&yearFilter=${param.yearFilter}"
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
            searchForm.action = `${pageContext.request.contextPath}/SearchStockOutInfo/1`;
            searchForm.submit();
        }
    });
});

// Apply sorting parameters and submit form
function applySort(field, direction) {
    document.getElementById('sortField').value = field;
    document.getElementById('sortDirection').value = direction;

    // Preserve search query if it exists
    const searchQuery = "${searchQuery}";
    if (searchQuery) {
        document.getElementById('searchInput').value = searchQuery;
    }

    document.getElementById('searchForm').submit();
}

// Apply year filter and submit form
function applyYearFilter(year) {
    document.getElementById('yearFilter').value = year;
    document.getElementById('searchForm').submit();
}
</script>

<style>
.text-muted {
    color: #6c757d !important;
}

.table tbody tr td.text-center {
    vertical-align: middle;
}

/* Style for active sorting indicator */
.fa-sort-up, .fa-sort-down {
    color: #0d6efd;
}
</style>