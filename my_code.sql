
select *
from financial_loan;


select count(id) as total_loan_applications
from financial_loan;


select count(id) as MTD_total_applications
from financial_loan 
where month(issue_date) = 12 and year(issue_date) =2021;


select count(id) as PMTD_total_applications
from financial_loan 
where month(issue_date) = 11 and year(issue_date) =2021;


select sum(loan_amount) as MTD_Total_funded_amount
from financial_loan
where month(issue_date) = 12 and year(issue_date) =2021;


select sum(loan_amount) as PMTD_Total_funded_amount
from financial_loan
where month(issue_date) = 11 and year(issue_date) =2021;


select sum(total_payment) as total_amount_recieved
from financial_loan;




select sum(total_payment) as PMTD_total_amount_recieved
from financial_loan
where month(issue_date) = 11 and year(issue_date) =2021;


select round(avg(int_rate)*100, 2) as average_interest_rate
from financial_loan;



select round(avg(int_rate)*100, 2) as MTD_average_interest_rate
from financial_loan
where month(issue_date) = 12 and year(issue_date) = 2021;


select round(avg(int_rate)*100, 2) as PMTD_average_interest_rate
from financial_loan
where month(issue_date) = 11 and year(issue_date) = 2021;


select round(avg(dti), 4) * 100 as avg_dti
from financial_loan ;



select round(avg(dti)*100, 2)  as avg_dti
from financial_loan 
where month(issue_date) = 12 and year(issue_date) = 2021;


select round(avg(dti)*100, 2)  as avg_dti
from financial_loan 
where month(issue_date) = 11 and year(issue_date) = 2021;



select 
	( (count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end) )
    / count(id) ) * 100 as good_loan_perc 
from financial_loan ;


    
    



select  count(id) as Good_loan_applications
from financial_loan
where loan_status = 'Fully paid' or loan_status = 'Current';
    
    
    
    
select sum(loan_amount) as good_loan_funded_amount
from financial_loan
where loan_status = 'Fully paid' or loan_status = 'Current';


select sum(total_payment) as good_loan_recieved_amount
from financial_loan
where loan_status = 'Fully paid' or loan_status = 'Current';



SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan ;


SELECT COUNT(id) AS Bad_Loan_Applications 
FROM financial_loan
WHERE loan_status = 'Charged Off';

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount 
FROM financial_loan
WHERE loan_status = 'Charged Off';


SELECT SUM(total_payment) AS Bad_Loan_amount_received 
FROM financial_loan
WHERE loan_status = 'Charged Off';



SELECT
	loan_status,
    COUNT(id) AS total_loan_applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
	AVG(dti * 100) AS DTI
FROM financial_loan
GROUP BY loan_status ;



SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status ;





SELECT 
    MONTH(issue_date) AS Month_Munber,
    MONTHNAME(issue_date) AS Month_name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);










SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state ;



SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term ;





SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length ;


SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose ;



SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership ;