SELECT 
    first_quarter.job_id, first_quarter.job_title_short, first_quarter.job_location, first_quarter.job_via,
    skills_dim.skills, skills_dim.type
FROM
    (SELECT job_id, job_title_short, job_location, job_via, salary_year_avg
    FROM january_jobs
    UNION ALL
    SELECT job_id, job_title_short, job_location, job_via, salary_year_avg
    FROM february_jobs
    UNION ALL
    SELECT job_id, job_title_short, job_location, job_via, salary_year_avg
    FROM march_jobs) AS first_quarter
    LEFT JOIN skills_job_dim ON first_quarter.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    first_quarter.salary_year_avg > 70000
ORDER BY
    first_quarter.job_id