<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Admin Login</title>

    <!-- Bootstrap + Icons -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          crossorigin="anonymous">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .form-card {
            background-color: white;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            margin-top: 80px;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-custom {
            background-color: #ff5722;
            color: white;
            border-radius: 25px;
            padding: 10px;
            font-weight: 500;
        }

        .btn-custom:hover {
            background-color: #e64a19;
        }

        h2 {
            font-weight: 600;
            margin-bottom: 25px;
        }

        .text-danger {
            font-size: 18px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="form-card">
                <h2 class="text-center">Admin Login</h2>
                <form action="loginvalidate" method="post">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" name="username" id="username" placeholder="Admin username"
                               required class="form-control form-control-lg">
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control form-control-lg" placeholder="Admin password"
                               required name="password" id="password">
                    </div>

                    <button type="submit" class="btn btn-custom btn-block mt-3">Login</button>

                    <h5 class="mt-4 text-danger text-center">${message}</h5>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Scripts -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
</body>
</html>
