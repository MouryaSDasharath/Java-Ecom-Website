<!doctype html>
<%@page import="java.sql.*"%>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Manage Categories</title>

  <!-- Bootstrap CSS -->
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
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    }

    .table {
      background-color: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
    }

    .table th, .table td {
      vertical-align: middle !important;
    }

    .modal-content {
      border-radius: 12px;
    }

    .btn-primary {
      background-color: #ff5722;
      border-color: #ff5722;
    }

    .btn-primary:hover {
      background-color: #e64a19;
      border-color: #e64a19;
    }

    .btn-warning {
      background-color: #ffc107;
      border-color: #ffc107;
    }

    .btn-warning:hover {
      background-color: #e0a800;
      border-color: #d39e00;
    }

    .btn-danger:hover {
      background-color: #c82333;
    }

    .card {
      border: none;
      background-color: white;
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.05);
      border-radius: 10px;
      padding: 30px;
    }

    .header-button {
      display: flex;
      justify-content: flex-end;
      margin-bottom: 20px;
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

<div class="container mt-5">
  <div class="card">
    <div class="header-button">
      <!-- Add Category Button -->
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCategoryModal">
        <i class="fas fa-plus-circle"></i> Add Category
      </button>
    </div>

    <!-- Add Modal -->
    <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="addCategoryModalLabel"
         aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <form action="sendcategory" method="get">
            <div class="modal-header">
              <h5 class="modal-title">Add New Category</h5>
              <button type="button" class="close" data-dismiss="modal"
                      aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
              <input type="text" name="categoryname" class="form-control" required
                     placeholder="Category name">
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <input type="submit" value="Save Changes" class="btn btn-primary">
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Table -->
    <table class="table table-hover text-center">
      <thead class="thead-light">
      <tr>
        <th>SN</th>
        <th>Category Name</th>
        <th>Delete</th>
        <th>Update</th>
      </tr>
      </thead>
      <tbody>
      <%
        try {
          String url = "jdbc:mysql://localhost:3306/springproject";
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection(url, "root", "root123");
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from categories");

          while (rs.next()) {
      %>
      <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td>
          <form action="categories/delete" method="get">
            <input type="hidden" name="id" value="<%= rs.getInt(1) %>">
            <input type="submit" value="Delete" class="btn btn-danger">
          </form>
        </td>
        <td>
          <form action="categories/update" method="get">
            <button type="button" class="btn btn-warning" data-toggle="modal"
                    data-target="#updateModal<%= rs.getInt(1) %>">Update</button>

            <!-- Update Modal -->
            <div class="modal fade" id="updateModal<%= rs.getInt(1) %>" tabindex="-1" role="dialog"
                 aria-labelledby="updateModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Update Category</h5>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  </div>
                  <div class="modal-body">
                    <div class="form-group">
                      <input type="text" readonly name="categoryid" value="<%= rs.getInt(1) %>" class="form-control">
                    </div>
                    <div class="form-group">
                      <input type="text" name="categoryname" value="<%= rs.getString(2) %>" class="form-control">
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Update</button>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </td>
      </tr>
      <%
          }
        } catch (Exception ex) {
          out.println("Exception Occurred: " + ex.getMessage());
        }
      %>
      </tbody>
    </table>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
</body>
</html>
