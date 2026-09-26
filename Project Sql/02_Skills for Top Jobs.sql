 
SELECT 

    Name AS company_name, 
    job_title_short,
    salary_year_avg,
   COUNT (skills_dim.skills) AS skill_count,
    job_schedule_type,
   STRING_AGG ( skills_dim.skills, ',') AS job_skill
 

FROM 
    job_postings_fact 
LEFT JOIN  company_dim ON  job_postings_fact.company_id = company_dim.company_id
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON  skills_job_dim.skill_id = skills_dim.skill_id 

WHERE 
    job_title_short = 'Software Engineer'
AND salary_year_avg IS NOT NULL AND job_location = 'Anywhere'
   
GROUP BY 
    company_name, 
    job_title_short,
    salary_year_avg,
    job_schedule_type
 
ORDER BY 
    salary_year_avg DESC
    
    LIMIT 10; 
-- This query further shows us what Skills
-- do we need for these High paying Jobs
-- the last column lists all the neccessary
-- skills that We require




-- jSON results-- ********** 

[
  {
    "company_name": "Datavant",
    "job_title_short": "Software Engineer",
    "salary_year_avg": "225000.0",
    "skill_count": "8",
    "job_schedule_type": "Full-time",
    "job_skill": "azure,snowflake,spark,react,javascript,typescript,python,aws"
  },
  {
    "company_name": "Huckleberry Labs",
    "job_title_short": "Software Engineer",
    "salary_year_avg": "205000.0",
    "skill_count": "3",
    "job_schedule_type": "Full-time",
    "job_skill": "aws,gcp,python"
  },
  {
    "company_name": "SmarterDx",
    "job_title_short": "Software Engineer",
    "salary_year_avg": "205000.0",
    "skill_count": "10",
    "job_schedule_type": "Full-time",
    "job_skill": "node.js,python,elasticsearch,dynamodb,aws,snowflake,pandas,airflow,react,graphql"
  },
  {
    "company_name": "MongoDB",
    "job_title_short": "Software Engineer",
    "salary_year_avg": "200000.0",
    "skill_count": "4",
    "job_schedule_type": "Full-time",
    "job_skill": "mongodb,mongodb,mongodb,mongodb"
  },
  {
    "company_name": "Orbis",
    "job_title_short": "Software Engineer",
    "salary_year_avg": "200000.0",
    "skill_count": "3",
    "job_schedule_type": "Full-time",
    "job_skill": "typescript,ruby,ruby"
  },
  {
    "company_name": "Webflow",
    "job_title_short": "Software Engineer",
    "salary_year_avg": "191000.0",
    "skill_count": "6",
    "job_schedule_type": "Full-time",
    "job_skill": "javascript,css,react,graphql,node.js,react.js"
  },
  {
    "company_name": "Pulley",
    "job_title_short": "Software Engineer",
    "salary_year_avg": "185000.0",
    "skill_count": "4",
    "job_schedule_type": "Full-time",
    "job_skill": "python,javascript,typescript,golang"
  },
  {
    "company_name": "ConsenSys",
    "job_title_short": "Software Engineer",
    "salary_year_avg": "184500.0",
    "skill_count": "3",
    "job_schedule_type": "Full-time",
    "job_skill": "javascript,typescript,react"
  },
  {
    "company_name": "Robert Half",
    "job_title_short": "Software Engineer",
    "salary_year_avg": "182500.0",
    "skill_count": "15",
    "job_schedule_type": "Full-time",
    "job_skill": "python,javascript,html,css,c#,mongodb,redis,mysql,elasticsearch,mongodb,dynamodb,couchbase,azure,aws,asp.net"
  },
  {
    "company_name": "MongoDB",
    "job_title_short": "Software Engineer",
    "salary_year_avg": "174500.0",
    "skill_count": "5",
    "job_schedule_type": "Full-time",
    "job_skill": "c++,mongodb,c,rust,mongodb"
  }
