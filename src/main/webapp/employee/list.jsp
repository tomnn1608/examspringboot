<%@ page import="com.entities.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2/24/2024
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1 class="mb-3 mt-3">List</h1>
    <a href="create-employee" class="btn btn-secondary">Add Employee</a>
    <form class="row g-3" method="post" action="searchEmployee">
        <div class="col-auto">
            <label for="inputPassword2" class="visually-hidden">Search: </label>
            <input type="text" name="searchKeyword" class="form-control" id="inputPassword2" placeholder="search">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-secondary">Search</button>
        </div>
    </form>
    <table class="table">

        <thead>
                <tr>
                    <th scope="col">Employee Id</th>
                    <th scope="col">Employee Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Birthday</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Action</th>
                </tr>
        </thead>

        <tbody>
        <% for (Employee s: (List<Employee>) request.getAttribute("employees")) { %>
        <tr>
            <th scope="row"><%= s.getEmployeeId() %></th>
            <td><%= s.getEmployeeName() %></td>
            <td><%= s.getEmail() %></td>
            <td><%= s.getBirthday() %></td>
            <td><%= s.getPhoneNumber() %></td>
            <td><a href="edit-employee?id=<%= s.getEmployeeId() %>">Edit</a></td>
            <td><a class="text-danger" onclick="deleteEmployee('<%= s.getEmployeeId() %>')" href="javascript:void(0);">Delete</a></td>
        </tr>
        <% } %>

        </tbody>
    </table>
</div>
<script>
    function deleteEmployee(id) {
        if (confirm("Are you sure?")){
            var url = `list-employee?id=` + id;
            fetch(url, {
                method: 'DELETE'
            }).then(response => {
                if (response.ok) {
                    // Handle success, e.g., reload the page
                    if (confirm("Reload page?")) {
                        window.location.reload();
                    }
                } else {
                    throw new Error('Failed to delete employee');
                }
            }).catch(error => {
                alert(error.message);
            });
        }
    }
</script>
</body>
</html>
