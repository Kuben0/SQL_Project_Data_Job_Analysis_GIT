SELECT
    company_dim.name,
    CASE
        WHEN postings.postings_count < 10 THEN 'Small'
        WHEN postings.postings_count BETWEEN 10 AND 50 THEN 'Medium'
        WHEN postings.postings_count > 50 THEN 'Large'
    END AS category
FROM
    company_dim
    INNER JOIN
    (SELECT
        company_id,
        COUNT(*) AS postings_count
    FROM
        job_postings_fact
    GROUP BY
        company_id) AS postings ON company_dim.company_id = postings.company_id
ORDER BY
    company_dim.company_id