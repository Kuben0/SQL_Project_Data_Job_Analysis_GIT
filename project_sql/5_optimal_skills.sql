/*
The query identifies the most in-demand and highest-paying skills in Data Analyst job postings in Poland, 
filtering for skills that appear in at least 10 postings to ensure statistical relevance.
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short ILIKE '%Data Analyst%'
    AND salary_year_avg IS NOT NULL
    AND job_location ILIKE '%Poland%'
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25

/*
The ranking emphasizes that SQL and Python are the most valuable skills, 
combining both high demand and competitive salaries. The remaining skills, 
such as Tableau, Excel, and GCP, are also significant; 
however, only five results appear due to the filtering conditions, despite the query allowing up to 25 rows.
[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "31",
    "avg_salary": "93895.53"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "18",
    "avg_salary": "95669.72"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "17",
    "avg_salary": "107248.65"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "17",
    "avg_salary": "75998.26"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "11",
    "avg_salary": "91649.59"
  }
]
*/