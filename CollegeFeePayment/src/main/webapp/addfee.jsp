<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Fee Payment</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to right, #cfd9df, #e2ebf0);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 40px 50px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            max-width: 480px;
            width: 100%;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-size: 26px;
        }

        label {
            font-weight: 600;
            margin-top: 20px;
            display: block;
            color: #34495e;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background: #fdfdfd;
            transition: border 0.3s ease;
        }

        input:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"] {
            margin-top: 30px;
            width: 100%;
            padding: 14px;
            font-size: 16px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background: #0056b3;
            transform: translateY(-2px);
        }

        @media screen and (max-width: 500px) {
            .form-container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Fee Payment</h2>
        <form action="AddFeePaymentServlet" method="post">
            <label for="studentID">Student ID:</label>
            <input type="number" id="studentID" name="studentID" required>

            <label for="studentName">Student Name:</label>
            <input type="text" id="studentName" name="studentName" required>

            <label for="paymentDate">Payment Date:</label>
            <input type="date" id="paymentDate" name="paymentDate" required>

            <label for="amount">Amount:</label>
            <input type="number" step="0.01" id="amount" name="amount" required>

            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="Paid">Paid</option>
                <option value="Pending">Pending</option>
                <option value="Overdue">Overdue</option>
            </select>

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
