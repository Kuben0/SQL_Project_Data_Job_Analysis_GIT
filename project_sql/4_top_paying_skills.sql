/*
This query ranks the top 25 skills based on average yearly salary in Data Analyst job postings in Poland, 
identifying the skills most strongly linked to higher-paying roles.
*/

SELECT 
    skills,
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
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
The analysis highlights that technologies such as Linux, MongoDB, 
and AWS are associated with significantly higher average salaries. 
This indicates that cloud and infrastructure-related skills are among the most profitable in the market.

Hadoop and NoSQL follow in the ranking, suggesting that big data processing technologies 
also command relatively high salaries.

The list concludes with programming languages such as Python and C++, which remain relevant but tend 
to have a lower impact on salary compared to cloud and data engineering technologies.

[
  {
    "skills": "linux",
    "avg_salary": "165000.00"
  },
  {
    "skills": "mongo",
    "avg_salary": "165000.00"
  },
  {
    "skills": "aws",
    "avg_salary": "165000.00"
  },
  {
    "skills": "hadoop",
    "avg_salary": "133750.00"
  },
  {
    "skills": "nosql",
    "avg_salary": "131750.00"
  },
  {
    "skills": "sheets",
    "avg_salary": "111175.00"
  },
  {
    "skills": "bigquery",
    "avg_salary": "111175.00"
  },
  {
    "skills": "snowflake",
    "avg_salary": "111175.00"
  },
  {
    "skills": "sas",
    "avg_salary": "111175.00"
  },
  {
    "skills": "jira",
    "avg_salary": "111175.00"
  },
  {
    "skills": "airflow",
    "avg_salary": "109729.17"
  },
  {
    "skills": "windows",
    "avg_salary": "109729.17"
  },
  {
    "skills": "spark",
    "avg_salary": "107250.00"
  },
  {
    "skills": "tableau",
    "avg_salary": "107248.65"
  },
  {
    "skills": "flow",
    "avg_salary": "106837.50"
  },
  {
    "skills": "looker",
    "avg_salary": "104777.50"
  },
  {
    "skills": "azure",
    "avg_salary": "103800.00"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "102500.00"
  },
  {
    "skills": "git",
    "avg_salary": "100590.00"
  },
  {
    "skills": "qlik",
    "avg_salary": "100137.50"
  },
  {
    "skills": "rust",
    "avg_salary": "98500.00"
  },
  {
    "skills": "c++",
    "avg_salary": "98500.00"
  },
  {
    "skills": "matplotlib",
    "avg_salary": "98500.00"
  },
  {
    "skills": "unix",
    "avg_salary": "98500.00"
  },
  {
    "skills": "python",
    "avg_salary": "95669.72"
  }
]
*/