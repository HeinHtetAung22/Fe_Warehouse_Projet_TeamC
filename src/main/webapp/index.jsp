<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Customer Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
            color: #212529;
        }

        .custom-navbar {
            background-color: rgb(252, 123, 71);
        }

        .sidebar {
            background-color: white;
            height: 100vh;
            position: fixed;
            width: 250px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.05);
            padding: 20px 0;
        }

        .main-content {
            margin-left: 250px;
            padding: 30px;
        }

        .nav-menu .nav-item {
            padding: 10px 20px;
        }

        .nav-item:hover,
        .nav-item.active {
            background-color: #f0f4ff;
        }

        .nav-link {
            color: #212529;
            text-decoration: none;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .search-container {
            position: relative;
            flex-grow: 1;
            margin-right: 15px;
        }

        .search-container input {
            padding-left: 35px;
        }

        .search-container i {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: gray;
        }

        .icon-group i {
            margin-left: 15px;
            cursor: pointer;
            color: #333;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        }

        .card-header {
            background-color: white;
            padding: 15px 20px;
            font-weight: 600;
            display: flex;
            justify-content: flex-end;
        }
    </style>
</head>

<body>
 <!--  <a href="viewemp/1">Click here for pagination form</a> -->
    <!-- Top Navbar -->
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="/Project/src/main/webapp/npg.png" alt="Logo" width="90" height="50" />
            </a>
            <div class="mx-auto text-white fw-bold fs-4">Ngwe Pone Gyi</div>
        </div>
    </nav>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="nav-menu">
            <div class="nav-item  active"><a href="CustomerInfo" class="nav-link text-danger">Customer Info</a></div>
            <div class="nav-item "><a href="SupplierInfo.html" class="nav-link ">Supplier Info</a>
            </div>
            <div class="nav-item"><a href="StockInReport.html" class="nav-link">Stock In Report</a></div>
            <div class="nav-item"><a href="StockOutReport.html" class="nav-link">Stock Out Report</a></div>
            <div class="nav-item"><a href="StockBalance.html" class="nav-link">Stock Balance Report</a></div>
            <div class="nav-item"><a href="UserInsert.html" class="nav-link">User Insert</a></div>
            <div class="nav-item"><a href="UserView.html" class="nav-link">User View</a></div>
            <div class="nav-item"><a href="Update.html" class="nav-link">Update</a></div>
            <div class="nav-item"><a href="Login.html" class="nav-link">Login</a></div>
            <div class="nav-item"><a href="ChangePassword.html" class="nav-link">Change Password</a></div>
            <div class="nav-item"><a href="ForgetPassword.html" class="nav-link">Forget Password</a></div>
        </div>
    </div>


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

    <!-- Bootstrap and FontAwesome JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
</body>

</html>