SELECT
    skills_dim.skills,
    EXTRACT(MONTH FROM first_quarter.job_posted_date) AS month_m,
    EXTRACT(YEAR FROM first_quarter.job_posted_date) AS year_y,
    COUNT(first_quarter.job_id) AS job_count
FROM
    (SELECT job_id, job_title_short, job_posted_date
    FROM january_jobs
    UNION ALL
    SELECT job_id, job_title_short, job_posted_date
    FROM february_jobs
    UNION ALL
    SELECT job_id, job_title_short, job_posted_date
    FROM march_jobs) AS first_quarter
    INNER JOIN skills_job_dim ON first_quarter.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY
    skills_dim.skills,
    month_m,
    year_y
ORDER BY
    skills_dim.skills,
    month_m,
    year_y