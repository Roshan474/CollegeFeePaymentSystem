# College Fee Management System

**Subject Name**: Advanced Java    
**Name**: Roshan S  
**USN**: 4AL22CS121

<br>
<br>
## 🛠️ Technologies Used

- Java (JSP/Servlet)
- HTML, CSS
- JDBC
- Apache Tomcat (recommended)
- Eclipse IDE (configured with project settings)
<br>
<br>
## ✅ Features

- Add student fee payment records.
- Update Student fee payment records.
- Delete payments by ID.
- Display list of all payments.
- Generate fee reports:
  - Students with overdue payments
  - Payments made within a custom date range
- Generate a report format.
<br>
<br>

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
<br>
<br>

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
<br>
<br>

## ⚙️ Installation & Setup :

### Step 1: Clone/Download the Project;
Download all the project files and organize them based on the MVC project structure (Model, View, Controller, WEB-INF, etc.).

### Step 2: Database Configuration :
1. Start your MySQL or XAMPP server.
2. Run the SQL script provided above to create the database and table:
3. Update the DB connection in `ReservationDAO.java`:
   ```java
   connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hotel_management", 
    "your_username", 
    "your_password");
   ```

### Step 3: Add MySQL JDBC Driver :
1. [Download MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/) from the official MySQL website.
2. Add the downloaded JAR file to your project’s `WEB-INF/lib` directory.
3. If using an IDE like Eclipse or IntelliJ, add it to your build path.

### Step 4: Deploy to Tomcat :
1. Create a Dynamic Web Project in your IDE (Eclipse recommended).
2. Import all your Java source files, JSPs, and web resources.
3. Deploy the project on Tomcat (version 9.0 or higher).
4. Start the Tomcat server.

### Step 5: Access the Application :
Open your browser and go to:
```
http://localhost:8080/CollegeFeePayment/
```
This will open your homepage with modules like Add Fee payment, Update payment, delete payment, 
display payment, and Generate Reports — as seen in the UI.

<br>
<br>

## 📸 Screenshots

The `Output/` folder contains screenshots of the application UI including:

### 🔹 Front Page -
![Front Page](https://github.com/Roshan474/CollegeFeePaymentSystem/blob/main/CollegeFeePayment/Output/frontpage.png)

## Add Fee Payment
![Add payment](https://github.com/Roshan474/CollegeFeePaymentSystem/blob/main/CollegeFeePayment/Output/collegefeepayment.png)

## display Payment
![display payment](https://github.com/Roshan474/CollegeFeePaymentSystem/blob/main/CollegeFeePayment/Output/displaypayment.png)

## Update Payment
![update payment](https://github.com/Roshan474/CollegeFeePaymentSystem/blob/main/CollegeFeePayment/Output/update_id.png)

## Delete Payment
![delete payment](https://github.com/Roshan474/CollegeFeePaymentSystem/blob/main/CollegeFeePayment/Output/feepaymentdelete.png)

## Report Generation
![report_generation_date_range](https://github.com/Roshan474/CollegeFeePaymentSystem/blob/main/CollegeFeePayment/Output/report/date_range_report.png)
![report_generation_overdue](https://github.com/Roshan474/CollegeFeePaymentSystem/blob/main/CollegeFeePayment/Output/report/report_overdue.png)
<br>
<br>

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


## ----------------> THANK_YOU <---------------- ##
