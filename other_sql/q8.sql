SELECT
    COUNT(DISTINCT CASE WHEN job_work_from_home IS TRUE THEN company_id END) AS WH,
    COUNT(DISTINCT CASE WHEN job_work_from_home IS FALSE THEN company_id END) AS OS
FROM
    job_postings_fact