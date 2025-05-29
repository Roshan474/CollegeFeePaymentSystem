<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.FeePaymentDAO, model.FeePayment, java.text.SimpleDateFormat" %>

<%
    String paymentIDStr = request.getParameter("paymentID");
    FeePayment payment = null;
    if (paymentIDStr != null) {
        try {
            int paymentID = Integer.parseInt(paymentIDStr);
            FeePaymentDAO dao = new FeePaymentDAO();
            payment = dao.selectPayment(paymentID);
        } catch (Exception e) {
            out.println("Error fetching payment details: " + e.getMessage());
        }
    }
    if (payment == null) {
%>
    <p style="color: red; font-weight: bold;">Invalid or missing payment ID.</p>
    <a href="feepaymentdisplay.jsp">Back to Payment List</a>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Fee Payment</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #f0f4ff, #dbe9ff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 30px;
        }

        .container {
            background-color: #ffffff;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 26px;
            font-weight: 700;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #34495e;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 12px 14px;
            margin-bottom: 20px;
            border: 1.5px solid #ccd6e0;
            border-radius: 6px;
            font-size: 15px;
            background-color: #fdfdfd;
            transition: border-color 0.3s;
        }

        input:focus,
        select:focus {
            border-color: #3498db;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            background: #3498db;
            color: white;
            font-weight: 600;
            font-size: 17px;
            padding: 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #2980b9;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #2d8be7;
            font-weight: 600;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .container {
                padding: 25px 20px;
            }

            h2 {
                font-size: 22px;
            }

            input,
            select {
                font-size: 14px;
            }

            input[type="submit"] {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Fee Payment</h2>
        <form action="UpdateFeePaymentServlet" method="post">
            <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>">

            <label for="studentID">Student ID:</label>
            <input type="number" id="studentID" name="studentID" value="<%= payment.getStudentID() %>" required>

            <label for="studentName">Student Name:</label>
            <input type="text" id="studentName" name="studentName" value="<%= payment.getStudentName() %>" required>

            <label for="paymentDate">Payment Date:</label>
            <input type="date" id="paymentDate" name="paymentDate" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(payment.getPaymentDate()) %>" required>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" step="0.01" name="amount" value="<%= payment.getAmount() %>" required>

            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="Paid" <%= "Paid".equals(payment.getStatus()) ? "selected" : "" %>>Paid</option>
                <option value="Overdue" <%= "Overdue".equals(payment.getStatus()) ? "selected" : "" %>>Overdue</option>
            </select>

            <input type="submit" value="Update Payment">
        </form>
        <a href="feepaymentdisplay.jsp">← Back to Payment List</a>
    </div>
</body>
</html>
