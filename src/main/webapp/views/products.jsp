<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.ObjectOutputStream"%>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Product Management</title>

  <!-- Bootstrap -->
  <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        crossorigin="anonymous">
  <link rel="stylesheet"
        href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
        crossorigin="anonymous">

  <!-- Custom Style -->
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

    .btn-primary {
      background-color: #1976d2;
      border: none;
      font-weight: 500;
    }

    .btn-primary:hover {
      background-color: #125ea4;
    }

    .btn-warning {
      font-weight: 500;
      color: white;
    }

    .btn-danger {
      font-weight: 500;
    }

    .table-wrapper {
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
      padding: 20px;
    }

    .table {
      margin-bottom: 0;
    }

    thead {
      background-color: #1565c0;
      color: white;
    }

    .table th,
    .table td {
      vertical-align: middle !important;
      text-align: center;
    }

    .table tbody tr:hover {
      background-color: #f5f5f5;
    }

    .product-img {
      height: 80px;
      width: 80px;
      object-fit: cover;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    .btn {
      border-radius: 8px;
      padding: 6px 14px;
      font-size: 14px;
    }

    .action-btns form {
      display: inline-block;
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
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h4 class="mb-0">Product List</h4>
      <a class="btn btn-primary" href="/admin/products/add">Add Product</a>
    </div>

    <table class="table table-hover table-bordered">
      <thead>
        <tr>
          <th>SN</th>
          <th>Name</th>
          <th>Category</th>
          <th>Image</th>
          <th>Qty</th>
          <th>Price</th>
          <th>Weight</th>
          <th>Description</th>
          <th colspan="2">Actions</th>
        </tr>
      </thead>
      <tbody>
      <%
        try {
          String url = "jdbc:mysql://localhost:3306/springproject";
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection(url, "root", "root123");
          Statement stmt = con.createStatement();
          Statement stmt2 = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from products");

          while (rs.next()) {
      %>
        <tr>
          <td><%= rs.getInt(1) %></td>
          <td><%= rs.getString(2) %></td>
          <td>
            <%
              int categoryid = rs.getInt(4);
              ResultSet rs2 = stmt2.executeQuery("select * from categories where categoryid = " + categoryid);
              if (rs2.next()) {
                out.print(rs2.getString(2));
              }
            %>
          </td>
          <td>
            <img src="product-images/<%= rs.getInt(1) %>.jpg" class="product-img" alt="Product Image"/>
          </td>
          <td><%= rs.getInt(5) %></td>
          <td>₹<%= rs.getInt(6) %></td>
          <td><%= rs.getInt(7) %> g</td>
          <td><%= rs.getString(8) %></td>
          <td class="action-btns">
            <form action="products/delete" method="get">
              <input type="hidden" name="id" value="<%= rs.getInt(1) %>">
              <input type="submit" value="Delete" class="btn btn-danger">
            </form>
          </td>
          <td class="action-btns">
            <form action="products/update" method="get">
              <input type="hidden" name="pid" value="<%= rs.getInt(1) %>">
              <input type="submit" value="Update" class="btn btn-warning">
            </form>
          </td>
        </tr>
      <%
          }
        } catch (Exception ex) {
          out.println("<tr><td colspan='10' class='text-danger'>Exception Occurred: " + ex.getMessage() + "</td></tr>");
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
