SELECT
    company_dim.name AS company_name,
    COUNT(job_id) AS job_count
FROM
    job_postings_fact
    INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_health_insurance IS TRUE AND EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2
GROUP BY
    company_name
HAVING
    COUNT(job_id) > 1
ORDER BY
    job_count DESC