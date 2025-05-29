<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.FeePayment, dao.FeePaymentDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fee Payments List</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f2f6f9, #d6e0f5);
            padding: 30px;
            color: #2f3542;
        }

        h2 {
            text-align: center;
            color: #2f3542;
            margin-bottom: 30px;
            font-size: 28px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
        }

        th, td {
            padding: 14px 18px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
            font-size: 15px;
        }

        th {
            background-color: #4a69bd;
            color: white;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f1f5ff;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 6px;
        }

        a, input[type="submit"] {
            cursor: pointer;
            text-decoration: none;
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
            transition: all 0.25s ease;
        }

        a {
            background-color: #00b894;
            color: white;
        }

        a:hover {
            background-color: #019875;
        }

        input[type="submit"] {
            background-color: #0984e3;
            color: white;
        }

        input[type="submit"]:hover {
            background-color: #0652dd;
        }

        form {
            display: inline;
        }

        .action-buttons input[type="submit"] {
            padding: 6px 12px;
            font-size: 13px;
        }

        .no-records {
            text-align: center;
            font-style: italic;
            padding: 20px 0;
            color: #999;
        }

        .add-new {
            display: block;
            text-align: center;
            margin: 30px auto 0;
            padding: 10px 20px;
            background-color: #6c5ce7;
            color: white;
            border-radius: 8px;
            max-width: 200px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .add-new:hover {
            background-color: #4834d4;
        }

        @media (max-width: 768px) {
            table {
                font-size: 13px;
            }

            th, td {
                padding: 10px;
            }

            .action-buttons {
                flex-direction: column;
                gap: 4px;
            }
        }
    </style>
</head>
<body>
    <h2>Fee Payments</h2>
    <table>
        <thead>
            <tr>
                <th>Payment ID</th>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Payment Date</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            FeePaymentDAO dao = new FeePaymentDAO();
            List<FeePayment> payments = dao.selectAllPayments();
            if (payments != null && !payments.isEmpty()) {
                for (FeePayment payment : payments) {
        %>
            <tr>
                <td><%= payment.getPaymentID() %></td>
                <td><%= payment.getStudentID() %></td>
                <td><%= payment.getStudentName() %></td>
                <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(payment.getPaymentDate()) %></td>
                <td><%= payment.getAmount() %></td>
                <td><%= payment.getStatus() %></td>
                <td class="action-buttons">
                    <form action="updatefee.jsp" method="get">
                        <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>">
                        <input type="submit" value="Edit">
                    </form>
                    <form action="feepaymentdelete.jsp" method="get" onsubmit="return confirm('Are you sure you want to delete this payment?');">
                        <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="7" class="no-records">No payments found.</td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <a class="add-new" href="addfee.jsp">+ Add New Payment</a>
</body>
</html>
