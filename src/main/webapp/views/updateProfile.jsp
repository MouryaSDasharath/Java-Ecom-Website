<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>User Profile</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <style>
        body {
            background: linear-gradient(135deg, #e3f2fd, #bbdefb);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 2rem;
            background-color: #fff;
            width: 100%;
            max-width: 550px;
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .form-control-lg {
            border-radius: 10px;
        }

        .btn-primary {
            border-radius: 10px;
            font-weight: bold;
            background-color: #007bff;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .show-password {
            margin-top: 5px;
            font-size: 0.95rem;
        }
    </style>
</head>
<body>

<div class="card">
    <h3 class="text-center mb-4">User Profile</h3>
    <form action="updateuser" method="post">
        <input type="hidden" name="userid" value="${userid}">
        
        <div class="form-group">
            <label for="firstName">Username</label>
            <input type="text" name="username" id="firstName" placeholder="Your Username*" required
                   value="${username}" class="form-control form-control-lg">
        </div>

        <div class="form-group">
            <label for="email">Email address</label>
            <input type="email" class="form-control form-control-lg" placeholder="Email*" required minlength="6"
                   value="${email}" name="email" id="email" aria-describedby="emailHelp">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control form-control-lg" placeholder="Password*" required
                   value="${password}" name="password" id="password"
                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*?[~`!@#$%\^&*()\-_=+\[\]{};:'\""
                   title="Must contain: at least one number, one uppercase letter, one lowercase letter, one special character, and 8 or more characters">
            <div class="form-check show-password">
                <input type="checkbox" class="form-check-input" onclick="showPassword()" id="showPass">
                <label class="form-check-label" for="showPass">Show Password</label>
            </div>
        </div>

        <div class="form-group">
            <label for="Address">Address</label>
            <textarea class="form-control form-control-lg" rows="3"
                      placeholder="Enter Your Address" name="address">${address}</textarea>
        </div>

        <input type="submit" value="Update Profile" class="btn btn-primary btn-block">
    </form>
</div>

<!-- Show Password Script -->
<script>
    function showPassword() {
        var x = document.getElementById("password");
        x.type = (x.type === "password") ? "text" : "password";
    }
</script>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>
</html>
