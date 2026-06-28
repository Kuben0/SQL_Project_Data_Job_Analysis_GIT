SELECT
    company_dim.name
FROM
    company_dim INNER JOIN
        (SELECT
            company_id,
            AVG(salary_year_avg) AS per_com
        FROM
            job_postings_fact
        GROUP BY
            company_id) AS avg_per_company 
    ON company_dim.company_id = avg_per_company.company_id
WHERE
    (SELECT 
        AVG(salary_year_avg)
    FROM
        job_postings_fact) < avg_per_company.per_com
