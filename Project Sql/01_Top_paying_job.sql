
SELECT 
    job_id,
    Name AS company_name, 
    job_title_short,
    salary_year_avg,
    job_schedule_type,
    job_location,
    job_country,
    job_posted_date
 

FROM 
    job_postings_fact 
LEFT JOIN  company_dim ON  job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Software Engineer'
AND salary_year_avg IS NOT NULL AND job_location = 'Anywhere'
    
ORDER BY salary_year_avg DESC
    
    LIMIT 10; 


-- This Query pulls a specific set of Results
-- showing us Top 10 highest paying remote jobs
--  For Job Title "Software Engineer "