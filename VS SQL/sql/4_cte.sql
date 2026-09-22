SELECT * 
FROM (
    SELECT * 
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;


WITH january_jobs AS (SELECT*

FROM job_postings_fact
WHERE EXTRACT (MONTH FROM job_posted_date)=1)

SELECT *
FROM january_jobs;








WITH remote_job_skills AS (
     SELECT 
          skill_id,
     COUNT (*) AS count_skills 

     FROM skills_job_dim 
     INNER JOIN job_postings_fact ON skills_job_dim.job_id= job_postings_fact.job_id
     WHERE job_work_from_home = True
     GROUP BY skill_id 
)

SELECT skills.skill_id,
     skills as skill_name,
     skill_count 

FROM   remote_job_skills
INNER JOIN skills_dim AS skill ON skill_dim.skill_id=remote_job_skills.skill_id