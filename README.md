# College Fee Management System

**Subject Name**: Advanced Java    
**Name**: Roshan S  
**USN**: 4AL22CS121


## 🛠️ Technologies Used

- Java (JSP/Servlet)
- HTML, CSS
- JDBC
- Apache Tomcat (recommended)
- Eclipse IDE (configured with project settings)

## ✅ Features

- Add student fee payment records.
- Update Student fee payment records.
- Delete payments by ID.
- Display list of all payments.
- Generate fee reports:
  - Students with overdue payments
  - Payments made within a custom date range
- Generate a report format.

## 📂 Project Structure

```
CollegeFeeWebApp/
├── WebContent/
│   ├── index.jsp
│   ├── feepaymentadd.jsp
│   ├── feepaymentupdate.jsp
│   ├── feepaymentdelete.jsp
│   ├── feepaymentdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
├── src/
│   └── com/
│       ├── dao/
│       │   └── FeePaymentDAO.java
│       ├── model/
│       │   └── FeePayment.java
│       └── servlet/
│           ├── AddFeePaymentServlet.java
│           ├── UpdateFeePaymentServlet.java
│           ├── DeleteFeePaymentServlet.java
│           ├── DisplayFeePaymentsServlet.java
│           ├── ReportServlet.java
│           └── ReportCriteriaServlet.java
└── WEB-INF/
    └── web.xml

```

## 🗄️ Database Setup :

### 1. Create Database :
``` -> sql :-

CREATE DATABASE IF NOT EXISTS collegefeedb;
USE collegefeedb;
```

### 2. Create Table :
``` -> sql :-
CREATE TABLE FeePayments (
PaymentID INT PRIMARY KEY AUTO_INCREMENT,
StudentID INT,
StudentName VARCHAR(100),
PaymentDate DATE,
Amount DECIMAL(10,2),
Status VARCHAR(20) -- e.g., Paid, Overdue
);
```
## 📸 Screenshots

The `Output/` folder contains screenshots of the application UI including:
- Add Fee Payment
- View Payments
- Update/Delete Functionality
- Report Generation

## 🚀 Getting Started

### Prerequisites

- Java JDK 8 or higher
- Apache Tomcat 9+
- MySQL or other JDBC-compatible database
- Eclipse IDE for Enterprise Java Developers

### Setup Instructions

1. Clone or download the repository.
2. Import the project into Eclipse as an existing Java project.
3. Configure the project build path and server runtime (Tomcat).
4. Create the database and table as required.
5. Update your DB connection settings in `DBConnection.java`.
6. Deploy the project on Tomcat and run.

## 🧠 Author

- Developed by [Your Name Here]
- Contributions are welcome!

## 📝 License

This project is for educational use. Modify or enhance it as per your academic needs.

