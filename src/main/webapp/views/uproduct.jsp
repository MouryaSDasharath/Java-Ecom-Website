<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Buy Products</title>

  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        crossorigin="anonymous">

  <!-- Styles -->
  <style>
    body {
      background: linear-gradient(to right, #e3f2fd, #bbdefb);
      font-family: 'Segoe UI', sans-serif;
    }

    .navbar {
      background-color: #1565c0;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    }

    .navbar .nav-link {
      color: white !important;
      font-weight: 500;
    }

    .navbar-brand img {
      height: 40px;
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

    .btn-buy {
      border-radius: 8px;
      font-weight: 500;
    }

    .product-img {
      border-radius: 6px;
      border: 1px solid #ddd;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
      <ul class="navbar-nav">
        <li class="nav-item active"><a class="nav-link" href="/index">Home Page</a></li>
        <li class="nav-item active"><a class="nav-link" href="/logout">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Content -->
<div class="container-fluid">
  <div class="table-wrapper">
    <h4 class="mb-4 text-center">Available Products</h4>
    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <th>Serial No.</th>
          <th>Product Name</th>
          <th>Category</th>
          <th>Preview</th>
          <th>Quantity</th>
          <th>Price</th>
          <th>Weight</th>
          <th>Description</th>
          <th>Buy</th>
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
            <img src="https://th.bing.com/th/id/R.fd048601910e87d09c670b696ed153a0?rik=MCuRFnBGgWZPjA&riu=http%3a%2f%2fimages2.fanpop.com%2fimages%2fphotos%2f7300000%2fSlice-of-Pizza-pizza-7383219-1600-1200.jpg&ehk=Nr%2f8Tpc4Z3p5bgSOdOEWHlN1XJS1y7jol5%2bkS6qXCpE%3d&risl=&pid=ImgRaw&r=0"
                 height="80" width="80" class="product-img" />
          </td>
          <td><%= rs.getInt(5) %></td>
          <td>₹<%= rs.getInt(6) %></td>
          <td><%= rs.getInt(7) %>g</td>
          <td><%= rs.getString(8) %></td>
          <td>
            <form action="/buy" method="get">
              <input type="hidden" name="id" value="<%= rs.getInt(1) %>">
              <button type="submit" class="btn btn-info btn-buy">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-cart" viewBox="0 0 16 16">
                  <path
                    d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </svg> Buy
              </button>
            </form>
          </td>
        </tr>
        <%
          }
        } catch (Exception ex) {
          out.println("<tr><td colspan='9' class='text-danger'>Exception Occurred: " + ex.getMessage() + "</td></tr>");
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
