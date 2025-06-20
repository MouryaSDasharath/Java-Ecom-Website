<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>Supplier Form</title>

    <!-- Bootstrap CSS and Icons -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          crossorigin="anonymous">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        header {
            background: url('http://www.autodatz.com/wp-content/uploads/2017/05/Old-Car-Wallpapers-Hd-36-with-Old-Car-Wallpapers-Hd.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
            border-radius: 0 0 50px 50px;
            overflow: hidden;
        }

        .overlay {
            background: rgba(0, 0, 0, 0.6);
            padding: 60px 20px;
            color: white;
            text-align: center;
        }

        .overlay h2 {
            font-size: 48px;
            margin-bottom: 40px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .form-card {
            background-color: white;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            margin-top: -50px;
        }

        .form-group label {
            font-weight: 500;
        }

        .btn-custom {
            background-color: #ff5722;
            border: none;
            color: white;
            padding: 10px 30px;
            font-size: 18px;
            border-radius: 30px;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background-color: #e64a19;
        }

        .navbar {
            margin-bottom: 0;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <h4 class="ml-auto mr-4">Welcome ${username}</h4>
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                <li class="nav-item"><span class="nav-link" th:text="${cartCount}">0</span></li>
                <li class="nav-item"><a class="nav-link" href="profileDisplay">Profile</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Header Section -->
<header>
    <div class="overlay">
        <h2>Fill This Form for Supplier</h2>
    </div>
</header>

<!-- Form Section -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="form-card mt-5">
                <form action="https://formcarry.com/s/Pq3xf4Lbabh" method="POST">
                    <div class="form-group">
                        <label>Product Name</label>
                        <input type="text" class="form-control" name="product Name" required>
                    </div>
                    <div class="form-group">
                        <label>Contact No.</label>
                        <input type="text" class="form-control" name="Number" maxlength="10" required>
                    </div>
                    <div class="form-group">
                        <label>Email ID</label>
                        <input type="email" class="form-control" name="Email" required>
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <input type="text" class="form-control" name="category" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea class="form-control" rows="4" name="Message" required></textarea>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-custom">Send Message</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" crossorigin="anonymous"></script>

</body>
</html>
