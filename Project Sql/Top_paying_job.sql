
SELECT 
    job_id,
    job_title_short,
    job_schedule_type,
    salary_year_avg,
    job_country,
    job_location,
    job_posted_date
 

FROM 
    job_postings_fact 
WHERE job_title_short = 'Software Engineer'
AND salary_year_avg IS NOT NULL AND job_location = 'Anywhere'
    
ORDER BY salary_year_avg DESC
    
    LIMIT 10; 


-- This Query pulls a specific set of Results
-- showing us Top 10 highest paying remote jobs
--  For Job Title "Software Engineer "