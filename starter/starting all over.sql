

WITH remote_job_skills AS ( 
SELECT  
     skill_id,
     COUNT (*)  AS skills_count 
FROM 
      skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id =skills_to_job.job_id 
WHERE 
     job_postings.job_work_from_home = True AND job_postings.job_title_short = 'Data Analyst'
 
GROUP BY 
     skill_id 
      ) 
SELECT skills.skill_id,
     skills as skill_name,
     skills_count 
FROM remote_job_skills 
INNER JOIN skills_dim AS  skills  ON skills.skill_id= remote_job_skills.skill_id
order by 
     skills_count DESC 
     LIMIT  10; 
   


   -- UNION OPERATERS 
-- Months table first 

SELECT 
job_title_short, 
job_location, 
company_id,
job_posted_date

FROM (
    SELECT * 
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs

UNION 


SELECT 
job_title_short, 
job_location, 
company_id,
job_posted_date

FROM (
    SELECT * 
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2
) AS February_jobs

UNION

SELECT 
job_title_short, 
job_location, 
company_id,
job_posted_date

FROM (
    SELECT * 
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3
) AS March_jobs;

-- practice problem 


SELECT 
job_title_short, 
job_via, 
salary_year_avg, 
company_id

  
FROM (
    SELECT * 
    FROM job_postings_fact 
    WHERE EXTRACT(QUARTER FROM job_posted_date) = 1 AND salary_year_avg >70000 AND job_title_short = 'Data Analyst'
) AS Q1_jobs 

ORDER BY job_title_short;
 






 

 

 




 