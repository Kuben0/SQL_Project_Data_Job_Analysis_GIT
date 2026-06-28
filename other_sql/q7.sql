SELECT 
    job_id, job_title, salary_year_avg,
    CASE
        WHEN salary_year_avg >= 100000 THEN 'high salary'
        WHEN salary_year_avg BETWEEN 60000 AND 100000 THEN 'standard salary'
        ELSE 'low salary'
    END
FROM 
    job_postings_fact
WHERE 
    job_title_short LIKE 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
    