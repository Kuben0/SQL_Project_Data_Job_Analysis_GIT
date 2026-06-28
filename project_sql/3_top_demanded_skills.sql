/*
This query retrieves the five most in-demand skills in job postings for Data Analysts in Poland.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short ILIKE '%Data Analyst%'
    AND job_location ILIKE '%Poland%'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

/*
The analysis indicates that SQL is the most frequently required skill in Data Analyst job postings in Poland, 
appearing in 1,765 listings, significantly ahead of all other tools. Excel follows in second place with 1,261 listings, 
confirming its continued importance as a foundational analytical tool in the profession.

The remaining top skills include Python (1,080 listings), Tableau (809 listings), and Power BI (721 listings). 
This distribution highlights that modern Data Analyst roles extend beyond traditional spreadsheet and database work, 
increasingly incorporating programming capabilities and data visualization expertise.

Overall, the findings suggest that candidates proficient in SQL, Excel, Python, 
and modern BI tools such as Tableau and Power BI are best positioned to meet 
current employer expectations in the Polish job market for Data Analysts.

[
  {
    "skills": "sql",
    "demand_count": "1765"
  },
  {
    "skills": "excel",
    "demand_count": "1261"
  },
  {
    "skills": "python",
    "demand_count": "1080"
  },
  {
    "skills": "tableau",
    "demand_count": "809"
  },
  {
    "skills": "power bi",
    "demand_count": "721"
  }
]
*/