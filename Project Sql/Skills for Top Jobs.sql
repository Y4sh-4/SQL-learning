 
SELECT 

    Name AS company_name, 
    job_title_short,
    salary_year_avg,
   COUNT (skills_dim.skills) AS skill_count,
    job_schedule_type,
    job_location,
    job_country,
    job_posted_date,
   STRING_AGG ( skills_dim.skills, ',') AS job_skill
 

FROM 
    job_postings_fact 
LEFT JOIN  company_dim ON  job_postings_fact.company_id = company_dim.company_id
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON  skills_job_dim.skill_id = skills_dim.skill_id 

WHERE 
    job_title_short = 'Software Engineer'
AND salary_year_avg IS NOT NULL AND job_location = 'Anywhere'
   
GROUP BY 
     company_name, 
    job_title_short,
    salary_year_avg,
    job_schedule_type,
    job_location,
    job_country,
    job_posted_date
 
ORDER BY 
    salary_year_avg DESC
    
    LIMIT 10; 
-- This query further shows us what Skills
-- do we need for these High paying Jobs
-- the last column lists all the neccessary
-- skills that We require