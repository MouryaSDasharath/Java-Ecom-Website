<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Customer Management</title>

  <!-- Bootstrap -->
  <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        crossorigin="anonymous">

  <!-- Styles -->
  <style>
    body {
      background: linear-gradient(to right, #e3f2fd, #bbdefb);
      font-family: 'Segoe UI', sans-serif;
    }

    .navbar {
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    }

    .container-fluid {
      padding: 2rem;
    }

    .table-wrapper {
      background-color: #ffffff;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
    }

    .table th {
      background-color: #1565c0;
      color: white;
      text-align: center;
    }

    .table td {
      text-align: center;
      vertical-align: middle;
    }

    .table tbody tr:hover {
      background-color: #f9f9f9;
    }

    .navbar-brand img {
      height: 40px;
    }

  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
      <ul class="navbar-nav">
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

<!-- Main Content -->
<div class="container-fluid mt-4">
  <div class="table-wrapper">
    <h4 class="mb-4 text-center">Registered Customers</h4>

    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <th>User ID</th>
          <th>Customer Name</th>
          <th>Email</th>
          <th>Address</th>
        </tr>
      </thead>
      <tbody>
        <%
          try {
            String url = "jdbc:mysql://localhost:3306/springproject";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "root123");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from users");

            while (rs.next()) {
        %>
        <tr>
          <td><%= rs.getInt(1) %></td>
          <td><%= rs.getString(2) %></td>
          <td><%= rs.getString(6) %></td>
          <td><%= rs.getString(5) %></td>
        </tr>
        <%
            }
          } catch (Exception ex) {
            out.println("<tr><td colspan='4' class='text-danger'>Exception Occurred: " + ex.getMessage() + "</td></tr>");
          }
        %>
      </tbody>
    </table>
  </div>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        crossorigin="anonymous"></script>

</body>
</html>
