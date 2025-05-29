<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.FeePaymentDAO, model.FeePayment" %>
<%
    String paymentIDStr = request.getParameter("paymentID");
    FeePayment payment = null;
    if (paymentIDStr != null && !paymentIDStr.trim().isEmpty()) {
        try {
            int paymentID = Integer.parseInt(paymentIDStr);
            FeePaymentDAO dao = new FeePaymentDAO();
            payment = dao.selectPayment(paymentID);
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error fetching payment details: " + e.getMessage() + "</p>");
        }
    }

    if (payment == null) {
%>
        <p style="color:red;">Invalid or missing payment ID.</p>
        <a href="feepaymentdisplay.jsp">Back to Payment List</a>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Fee Payment</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #fceabb, #f8b500);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .card {
            background-color: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            max-width: 480px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #d63031;
            font-size: 24px;
            margin-bottom: 20px;
        }

        p {
            font-size: 17px;
            margin-bottom: 30px;
            color: #2d3436;
        }

        strong {
            color: #d63031;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="submit"] {
            background-color: #d63031;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #b71c1c;
            transform: scale(1.05);
        }

        a {
            display: inline-block;
            color: #0984e3;
            text-decoration: none;
            font-weight: 600;
            margin-top: 10px;
            font-size: 16px;
        }

        a:hover {
            text-decoration: underline;
        }

        @media screen and (max-width: 500px) {
            .card {
                padding: 25px 20px;
            }

            h2 {
                font-size: 20px;
            }

            p {
                font-size: 15px;
            }

            input[type="submit"] {
                padding: 10px 20px;
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Delete Fee Payment</h2>
        <p>Are you sure you want to delete the payment record of 
            <strong><%= payment.getStudentName() %></strong> 
            with Payment ID 
            <strong><%= payment.getPaymentID() %></strong>?
        </p>
        
        <form action="DeleteFeePaymentServlet" method="get">
            <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>">
            <input type="submit" value="Confirm Delete">
        </form>

        <a href="feepaymentdisplay.jsp">Cancel and Back to Payment List</a>
    </div>
</body>
</html>
