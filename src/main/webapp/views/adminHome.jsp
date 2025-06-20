<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin Dashboard</title>

  <!-- Bootstrap & Icons -->
  <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        crossorigin="anonymous">
  <link rel="stylesheet"
        href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
        crossorigin="anonymous">

  <style>
    body {
      background-color: #f8f9fa;
    }

    .navbar {
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .jumbotron {
      background-color: white;
      border-radius: 12px;
      padding: 40px;
      margin: 40px auto;
      box-shadow: 0 8px 24px rgba(0,0,0,0.05);
    }

    .card {
      border: none;
      border-radius: 10px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.06);
      transition: all 0.3s ease-in-out;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 12px 24px rgba(0,0,0,0.1);
    }

    .card-title {
      font-weight: 600;
      margin-bottom: 10px;
    }

    .btn-primary {
      background-color: #ff5722;
      border-color: #ff5722;
      border-radius: 20px;
    }

    .btn-primary:hover {
      background-color: #e64a19;
      border-color: #e64a19;
    }

  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/adminhome">Home</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/logout">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center">
  <h1 class="display-4">Welcome Back, Admin</h1>
  <hr>
  <p class="lead">Manage your data from this Admin Panel</p>
</div>

<div class="container pb-5">
  <div class="row justify-content-center">
    <!-- Categories Card -->
    <div class="col-md-4 mb-4">
      <div class="card text-center p-3">
        <div class="card-body">
          <h4 class="card-title">Categories</h4>
          <p class="card-text">Manage the categories section here.</p>
          <a href="/admin/categories" class="btn btn-primary">Manage</a>
        </div>
      </div>
    </div>

    <!-- Products Card -->
    <div class="col-md-4 mb-4">
      <div class="card text-center p-3">
        <div class="card-body">
          <h4 class="card-title">Products</h4>
          <p class="card-text">Manage all the products here.</p>
          <a href="/admin/products" class="btn btn-primary">Manage</a>
        </div>
      </div>
    </div>

    <!-- Customers Card -->
    <div class="col-md-4 mb-4">
      <div class="card text-center p-3">
        <div class="card-body">
          <h4 class="card-title">Customers</h4>
          <p class="card-text">Manage all the customers here.</p>
          <a href="/admin/customers" class="btn btn-primary">Manage</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap Scripts -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
</body>
</html>
