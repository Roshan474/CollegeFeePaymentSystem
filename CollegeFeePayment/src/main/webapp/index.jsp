<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>College Fee Payment System</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(120deg, #8EC5FC, #E0C3FC);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            padding: 40px 50px;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 500px;
            width: 100%;
            color: #2c3e50;
        }

        h1 {
            font-size: 26px;
            font-weight: 700;
            margin-bottom: 30px;
            color: #2c3e50;
        }

        ul {
            list-style: none;
        }

        ul li {
            margin: 20px 0;
        }

        ul li a {
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
            color: #ffffff;
            background-color: #5D5FEF;
            padding: 12px 30px;
            border-radius: 10px;
            display: inline-block;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
        }

        ul li a:hover {
            background-color: #4c4edd;
            transform: translateY(-2px);
        }

        @media screen and (max-width: 480px) {
            .container {
                padding: 30px 20px;
            }

            h1 {
                font-size: 22px;
            }

            ul li a {
                font-size: 14px;
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Student Dashboard</h1>
        <ul>
            <li><a href="feepaymentadd.jsp">➕ Add Fee Payment</a></li>
            <li><a href="feepaymentdisplay.jsp">📋 View All Payments</a></li>
            <li><a href="report_form.jsp">📊 Generate Reports</a></li>
        </ul>
    </div>
</body>
</html>
