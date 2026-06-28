(
SELECT
    job_id, job_title, 'With Salary Info' AS salary_info
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL OR salary_year_avg IS NOT NULL
)
UNION ALL
(
SELECT
    job_id, job_title, 'Without Salary Info' AS salary_info
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NULL AND salary_hour_avg IS NULL
)
ORDER BY
    salary_info DESC,
    job_id;