<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${pageTitle != null ? pageTitle : 'Customer Management System'}</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<style>
body {
	font-family: 'Inter', sans-serif;
	background-color: #f8f9fa;
	color: #212529;
	margin: 0;
	padding: 0;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

.custom-navbar {
	background-color: rgb(252, 123, 71);
	position: sticky;
	top: 0;
	z-index: 1020;
}

.content-wrapper {
	display: flex;
	flex: 1;
}

.sidebar {
	background-color: white;
	width: 250px;
	box-shadow: 2px 0 10px rgba(0, 0, 0, 0.05);
	padding: 20px 0;
	position: sticky;
	top: 60px;
	height: calc(100vh - 60px);
	overflow-y: auto;
	margin-bottom: 50px;
}

/*  .main-content {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
            /*height: calc(100vh - 20px);
            height:1500px;
        }*/
.main-content {
	flex: 1;
	padding: 30px;
	/*overflow-y: auto;*/
	height: calc(100vh - 60px);
	/* Or a height that allows full scroll inside your layout */
}

.nav-menu .nav-item {
	padding: 10px 20px;
}

.nav-item:hover, .nav-item.active {
	background-color: #f0f4ff;
}

.nav-link {
	color: #212529;
	text-decoration: none;
}

.nav-link.text-danger {
	color: #dc3545 !important;
}
</style>
</head>
<body>
	<!-- Top Navbar -->
	<nav class="navbar navbar-expand-lg custom-navbar">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				src="/jsp/npg.png"
				alt="Logo" width="90" height="50" />
			</a>
			<div class="mx-auto text-white fw-bold fs-4">Ngwe Pone Gyi</div>
		</div>
	</nav>

	<!-- Content Wrapper with Sidebar -->
	<div class="content-wrapper">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="nav-menu">
				<div class="nav-item ${activePage == 'customer' ? 'active' : ''}">
					<a href="${pageContext.request.contextPath}/CustomerInfo"
						class="nav-link ${activePage == 'customer' ? 'text-danger' : ''}">Customer
						Info</a>
				</div>
				<div class="nav-item ${activePage == 'supplier' ? 'active' : ''}">
					<a href="${pageContext.request.contextPath}/SupplierInfo"
						class="nav-link ${activePage == 'supplierinfo' ? 'text-danger' : ''}">Supplier
						Info</a>
				</div>
				<div class="nav-item ${activePage == 'stockIn' ? 'active' : ''}">
					<a href="${pageContext.request.contextPath}/StockInReport"
						class="nav-link ${activePage == 'stockinreport' ? 'text-danger' : ''}">Stock
						In Report</a>
				</div>
				<div class="nav-item ${activePage == 'stockOut' ? 'active' : ''}">
					<a href="${pageContext.request.contextPath}/StockOutReport"
						class="nav-link ${activePage == 'stockoutreport' ? 'text-danger' : ''}">Stock
						Out Report</a>
				</div>
				<div
					class="nav-item ${activePage == 'StockBalanceReport' ? 'active' : ''}">
					<a href="${pageContext.request.contextPath}/StockBalanceReport"
						class="nav-link ${activePage == 'stockbalancereport' ? 'text-danger' : ''}">Stock
						Balance Report</a>
				</div>
				<div class="nav-item ${activePage == 'userInsert' ? 'active' : ''}">
					<a href="${pageContext.request.contextPath}/UserInsert"
						class="nav-link ${activePage == 'userinsert' ? 'text-danger' : ''}">User
						Insert</a>
				</div>
				<div class="nav-item ${activePage == 'userView' ? 'active' : ''}">
					<a href="${pageContext.request.contextPath}/UserView"
						class="nav-link ${activePage == 'userview' ? 'text-danger' : ''}">User
						View</a>
				</div>
				<div class="nav-item ${activePage == 'Update' ? 'active' : ''}">
					<a href="${pageContext.request.contextPath}/Update"
						class="nav-link ${activePage == 'update' ? 'text-danger' : ''}">Update</a>
				</div>
				<div class="nav-item ${activePage == 'Login' ? 'active' : ''}">
					<a href="${pageContext.request.contextPath}/Login"
						class="nav-link ${activePage == 'login' ? 'text-danger' : ''}">Login</a>
				</div>
				<div
					class="nav-item ${activePage == 'ChangePassword' ? 'active' : ''}">
					<a href="${pageContext.request.contextPath}/ChangePassword"
						class="nav-link ${activePage == 'changepassword' ? 'text-danger' : ''}">ChangePassword</a>
				</div>
				<div
					class="nav-item ${activePage == 'ForgetPassword' ? 'active' : ''}">
					<a href="${pageContext.request.contextPath}/ForgetPassword"
						class="nav-link ${activePage == 'forgetpassword' ? 'text-danger' : ''}">ForgetPassword</a>
				</div>
			</div>
		</div>

		<!-- Main Content Area -->
		<div class="main-content">
			<jsp:include page='${contentPage}' />
		</div>
	</div>

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
		
</body>
</html>