<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Reports</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #f0f4f8, #e4ecff);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #ffffff;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: 700;
        }

        label {
            font-weight: 600;
            color: #333;
            display: block;
            margin-bottom: 6px;
        }

        select, input[type="date"], input[type="submit"] {
            width: 100%;
            padding: 12px 14px;
            margin-bottom: 20px;
            border: 1.5px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        select:focus,
        input[type="date"]:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            font-weight: 600;
            font-size: 16px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
            font-weight: 600;
        }

        a:hover {
            text-decoration: underline;
        }

        .error {
            color: #e74c3c;
            background: #ffeaea;
            padding: 10px 15px;
            border-radius: 6px;
            text-align: center;
            margin-bottom: 20px;
            font-weight: 500;
        }

        @media (max-width: 500px) {
            .container {
                padding: 25px 20px;
            }

            h2 {
                font-size: 20px;
            }

            input, select {
                font-size: 14px;
            }

            input[type="submit"] {
                font-size: 15px;
            }
        }
    </style>

    <script>
        function toggleDateRange() {
            var reportType = document.getElementById("reportType").value;
            var dateRangeDiv = document.getElementById("dateRange");

            if (reportType === "dateRange") {
                dateRangeDiv.style.display = "block";
            } else {
                dateRangeDiv.style.display = "none";
                document.getElementById("fromDate").value = "";
                document.getElementById("toDate").value = "";
            }
        }

        window.onload = function () {
            toggleDateRange(); // Run on page load
        };
    </script>
</head>
<body>
    <div class="container">
        <h2>Generate Reports</h2>

        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p class="error"><%= errorMessage %></p>
        <%
            }
        %>

        <form action="ReportServlet" method="get">
            <label for="reportType">Select Report Type:</label>
            <select name="reportType" id="reportType" onchange="toggleDateRange()" required>
                <option value="">-- Select --</option>
                <option value="overdue" <%= "overdue".equals(request.getParameter("reportType")) ? "selected" : "" %>>Students with Overdue Payments</option>
                <option value="dateRange" <%= "dateRange".equals(request.getParameter("reportType")) ? "selected" : "" %>>Payments within Date Range</option>
            </select>

            <div id="dateRange" style="display: none;">
                <label for="fromDate">From Date:</label>
                <input type="date" id="fromDate" name="fromDate"
                    value="<%= request.getParameter("fromDate") != null ? request.getParameter("fromDate") : "" %>">

                <label for="toDate">To Date:</label>
                <input type="date" id="toDate" name="toDate"
                    value="<%= request.getParameter("toDate") != null ? request.getParameter("toDate") : "" %>">
            </div>

            <input type="submit" value="Generate Report">
        </form>

        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
