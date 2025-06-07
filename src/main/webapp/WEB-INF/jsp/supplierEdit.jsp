<div class="main-content" style="overflow-y: auto;">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title mb-4">Edit Supplier</h4>
            
           <!--  <c:if test="${not empty successMessage and not empty successMessage.trim()}">
                <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
                    ${successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            
            <c:if test="${not empty errorMessage and not empty errorMessage.trim()}">
                <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                    ${errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if> -->
            
            <form action="${pageContext.request.contextPath}/SupplierUpdate" method="post">
                <input type="hidden" name="supplierID" value="${supplier.supplierID}">
                
                <div class="mb-3">
                    <label for="supplierName" class="form-label">Supplier Name</label>
                    <input type="text" class="form-control" id="supplierName" 
                        name="supplierName" value="${supplier.supplierName}" required>
                </div>
                
                <div class="mb-3">
                    <label for="supplierPh" class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="supplierPh" 
                        name="supplierPh" value="${supplier.supplierPh}"
                        pattern="[0-9]{7,15}" 
                        title="Phone number must be 7 to 15 digits long and contain only numbers." required>
                    <div class="form-text">Enter phone number without dashes or spaces</div>
                </div>
                
                <div class="mb-4">
                    <label for="supplierAddress" class="form-label">Address</label>
                    <input type="text" class="form-control" id="supplierAddress" 
                        name="supplierAddress" value="${supplier.supplierAddress}" required>
                </div>
                
                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary me-2">
                        <i class="fas fa-save me-2"></i>Update
                    </button>
                    <a href="${pageContext.request.contextPath}/SupplierInfo" class="btn btn-outline-secondary">
                        <i class="fas fa-times me-2"></i>Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>