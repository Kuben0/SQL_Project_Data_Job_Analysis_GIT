WITH avg_by_country AS (
    SELECT
        job_country,
        AVG(salary_year_avg) AS abc
    FROM
        job_postings_fact
    GROUP BY
        job_country)

SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    company_dim.name,
    job_postings_fact.salary_year_avg,
    CASE
        WHEN avg_by_country.abc < job_postings_fact.salary_year_avg THEN 'Above Average'
        ELSE 'Below Average'
    END AS country_avg,
    EXTRACT(MONTH FROM job_posted_date) AS posting_month
FROM
    job_postings_fact
    INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    INNER JOIN avg_by_country ON job_postings_fact.job_country = avg_by_country.job_country
ORDER BY
    posting_month DESC