<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.FeePayment, dao.FeePaymentDAO, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Fee Payment</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #e6f0ff, #f9fbff);
            margin: 0;
            padding: 40px 20px;
            color: #333;
        }

        h2 {
            color: #2d3e50;
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
        }

        form {
            background: #ffffff;
            max-width: 600px;
            margin: auto;
            padding: 35px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
        }

        label {
            display: block;
            margin-top: 18px;
            margin-bottom: 6px;
            font-weight: 600;
            font-size: 15px;
        }

        input[type="text"],
        input[type="date"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccd6e0;
            border-radius: 6px;
            font-size: 15px;
            background-color: #fdfefe;
        }

        input[type="submit"] {
            margin-top: 30px;
            width: 100%;
            background-color: #0056b3;
            color: #fff;
            font-size: 17px;
            padding: 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #003f87;
        }

        .error-msg {
            color: #d9534f;
            text-align: center;
            font-weight: 600;
            margin: 20px;
        }

        .back-link {
            display: block;
            text-align: center;
            margin: 25px auto;
            font-weight: 600;
            color: #007bff;
            text-decoration: none;
            font-size: 15px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            form {
                padding: 25px 20px;
            }

            h2 {
                font-size: 24px;
            }

            input[type="submit"] {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <h2>Update Fee Payment</h2>
    <%
        String paymentIDStr = request.getParameter("paymentID");
        if (paymentIDStr == null || paymentIDStr.trim().isEmpty()) {
    %>
        <p class="error-msg">Invalid or missing payment ID.</p>
        <a href="feepaymentdisplay.jsp" class="back-link">← Back to Payment List</a>
    <%
        } else {
            int paymentID = 0;
            try {
                paymentID = Integer.parseInt(paymentIDStr);
            } catch (NumberFormatException e) {
    %>
                <p class="error-msg">Payment ID must be a number.</p>
                <a href="feepaymentdisplay.jsp" class="back-link">← Back to Payment List</a>
    <%
                return;
            }
            FeePaymentDAO dao = new FeePaymentDAO();
            FeePayment fee = dao.selectPayment(paymentID);
            if (fee == null) {
    %>
                <p class="error-msg">No payment found for ID <%= paymentID %>.</p>
                <a href="feepaymentdisplay.jsp" class="back-link">← Back to Payment List</a>
    <%
            } else {
    %>
        <form action="UpdateFeePaymentServlet" method="post">
            <input type="hidden" name="paymentID" value="<%= fee.getPaymentID() %>">

            <label for="studentID">Student ID:</label>
            <input type="text" id="studentID" name="studentID" value="<%= fee.getStudentID() %>" required>

            <label for="studentName">Student Name:</label>
            <input type="text" id="studentName" name="studentName" value="<%= fee.getStudentName() %>" required>

            <label for="paymentDate">Payment Date:</label>
            <input type="date" id="paymentDate" name="paymentDate" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(fee.getPaymentDate()) %>" required>

            <label for="amount">Amount:</label>
            <input type="number" step="0.01" id="amount" name="amount" value="<%= fee.getAmount() %>" required>

            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="Paid" <%= "Paid".equals(fee.getStatus()) ? "selected" : "" %>>Paid</option>
                <option value="Pending" <%= "Pending".equals(fee.getStatus()) ? "selected" : "" %>>Pending</option>
                <option value="Overdue" <%= "Overdue".equals(fee.getStatus()) ? "selected" : "" %>>Overdue</option>
            </select>

            <input type="submit" value="Update Payment">
        </form>
        <a href="feepaymentdisplay.jsp" class="back-link">← Back to Payment List</a>
    <%
            }
        }
    %>
</body>
</html>
