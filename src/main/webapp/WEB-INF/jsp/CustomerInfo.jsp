<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
                                <th>Address</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td><strong>John Doe</strong></td>
                                <td>123 Main St</td>
                                <td>john@example.com</td>
                                <td>123-456-7890</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary me-1"><i
                                            class="fas fa-edit"></i></button>
                                    <button class="btn btn-sm btn-outline-danger"><i class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><strong>Jane Smith</strong></td>
                                <td>456 Oak Ave</td>
                                <td>jane@example.com</td>
                                <td>222-333-4444</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary me-1"><i
                                            class="fas fa-edit"></i></button>
                                    <button class="btn btn-sm btn-outline-danger"><i class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>