<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main-content" style="overflow-y: auto;">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title mb-4">Add New Customer</h4>
            <form action="${pageContext.request.contextPath}/CustomerInsert" method="post">
                <div class="mb-3">
                    <label for="customerName" class="form-label">Customer Name</label>
                    <input type="text" class="form-control" id="customerName" 
                        name="customerName" required>
                </div>
                
                <div class="mb-3">
                    <label for="customerPh" class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="customerPh" 
                        name="customerPh" 
                        pattern="[0-9]{7,15}" 
                        title="Phone number must be 7 to 15 digits long and contain only numbers." required>
                    <div class="form-text">Enter phone number without dashes or spaces</div>
                </div>
                
                <div class="mb-4">
                    <label for="customerAddress" class="form-label">Address</label>
                    <input type="text" class="form-control" id="customerAddress" 
                        name="customerAddress" required>
                </div>
                
                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary me-2">
                        <i class="fas fa-save me-2"></i>Save
                    </button>
                    <a href="${pageContext.request.contextPath}/CustomerInfo" class="btn btn-outline-secondary">
                        <i class="fas fa-times me-2"></i>Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>