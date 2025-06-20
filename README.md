﻿# Java-Ecom-Website
# Java E-commerce Website 🛒

This is a simple E-commerce website project built using **Java**, **Spring Boot**, **JSP**, and **MySQL**. It provides basic functionalities like admin and user login, category and product management, and product purchasing.

## 🚀 Features

### 👤 Admin Panel
- Admin login
- View and manage users
- Add/Edit/Delete product categories
- Add/Edit/Delete products
- View all products

### 🙋 User Panel
- User registration and login
- View products by category
- View product details
- Add products to cart (basic simulation)
- Purchase products (simulation)

## 🛠️ Tech Stack

| Layer        | Technology                      |
|--------------|----------------------------------|
| Backend      | Java, Spring Boot               |
| Frontend     | JSP, HTML, CSS                  |
| Database     | MySQL                           |
| Build Tool   | Maven                           |
| Server       | Embedded Tomcat (via Spring Boot) |

## 🗃️ Database

The project uses **MySQL**. You can import the database using the provided `springproject.sql` file.

```sql
-- Example tables:
CREATE TABLE admin (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50),
  password VARCHAR(50)
);
-- Similarly, users, categories, products tables exist
