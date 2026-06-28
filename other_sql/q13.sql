WITH dist_titles AS (
    SELECT
        company_id,
        COUNT (DISTINCT job_title) AS diverse_titles
    FROM
        job_postings_fact
    GROUP BY
        company_id)

SELECT
    company_dim.name,
    dist_titles.diverse_titles
FROM
    dist_titles LEFT JOIN
    company_dim ON dist_titles.company_id = company_dim.company_id
ORDER BY
    diverse_titles DESC
LIMIT 10