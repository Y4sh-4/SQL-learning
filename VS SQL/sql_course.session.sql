SELECT 
    job_schedule_type,
    AVG(salary_year_avg) AS salary_year_avg,
    AVG(salary_hour_avg) AS salary_hour_avg
FROM 
    job_postings_fact
WHERE 
    job_posted_date > '2023-06-01'
GROUP BY 
    job_schedule_type;









SELECT 
    job_schedule_type,
     job_title_short AS Job,
     AVG(salary_year_avg) AS avg_yearly_salary,
     AVG(salary_hour_avg) AS avg_hourly_salary

    FROM job_postings_fact
WHERE 
     job_posted_date > '2023-06-01'
     AND Job_title_short = 'Data Analyst'
GROUP BY job_schedule_type,
        job_title_short;

SELECT 
    job_schedule_type, 
    job_title_short AS Job,
    AVG(salary_year_avg) AS avg_yearly_salary,
    AVG(salary_hour_avg) AS avg_hourly_salary
FROM 
    job_postings_fact
WHERE 
    job_posted_date > '2023-06-01'
    AND job_title_short = 'Data Analyst'
GROUP BY 
    job_schedule_type,
    job_title_short;

SELECT  
     job_title_short AS title, 
     job_location  AS location,
     job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'
FROM 
     job_postings_fact
LIMIT  10;  

SELECT
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC'
            AT TIME ZONE 'America/New_York') AS month,
            job_title_short,
    COUNT(*) AS job_postings
FROM job_postings_fact
WHERE job_posted_date >= '2023-01-01'
  AND job_posted_date < '2024-01-01'
GROUP BY month,job_title_short
ORDER BY month, job_title_short;




-- Q 1 prctice 8 
SELECT
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 100000 THEN 'High Income'
        WHEN salary_year_avg >= 50000 THEN 'Medium Income'
        ELSE 'Low Income'
    END AS income_category
FROM job_postings_fact;


SELECT  
    job_id,
    skill_id
FROM 
    skills

