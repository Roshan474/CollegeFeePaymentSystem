<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
         import="java.util.List, java.util.ArrayList, java.text.SimpleDateFormat, model.FeePayment" %>

<%
    // Get the report results list from request attribute
    List<FeePayment> reportResults = (List<FeePayment>) request.getAttribute("reportResults");

    // If null, initialize an empty list to avoid errors
    if (reportResults == null) {
        reportResults = new ArrayList<FeePayment>();
    }

    // Date formatter to display dates properly
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Report Results</title>
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
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            width: 95%;
            max-width: 1000px;
            overflow-x: auto;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: 700;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            font-size: 15px;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f9fbfd;
        }

        tr:hover {
            background-color: #eef4ff;
        }

        .links {
            text-align: center;
            margin-top: 25px;
        }

        .links a {
            margin: 0 12px;
            text-decoration: none;
            color: #007bff;
            font-weight: 600;
            transition: color 0.3s;
        }

        .links a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        .no-records {
            text-align: center;
            font-style: italic;
            color: #888;
            padding: 20px;
        }

        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }

            th, td {
                padding: 10px;
            }

            h2 {
                font-size: 22px;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 25px 20px;
            }

            table {
                font-size: 13px;
            }

            th, td {
                padding: 8px;
            }

            h2 {
                font-size: 20px;
            }

            .links a {
                display: block;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Report Results</h2>

        <table>
            <thead>
                <tr>
                    <th>Payment ID</th>
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th>Payment Date</th>
                    <th>Amount</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (reportResults.isEmpty()) {
                %>
                    <tr>
                        <td colspan="6" class="no-records">No records found for the selected criteria.</td>
                    </tr>
                <%
                    } else {
                        for (FeePayment fee : reportResults) {
                %>
                    <tr>
                        <td><%= fee.getPaymentID() %></td>
                        <td><%= fee.getStudentID() %></td>
                        <td><%= fee.getStudentName() %></td>
                        <td><%= sdf.format(fee.getPaymentDate()) %></td>
                        <td>₹<%= fee.getAmount() %></td>
                        <td><%= fee.getStatus() %></td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <div class="links">
            <a href="report_form.jsp">← Back to Report Criteria</a>
            <a href="index.jsp">🏠 Home</a>
        </div>
    </div>
</body>
</html>
