WITH remote_job_count AS (
    SELECT
        skills_job_dim.skill_id AS id,
        COUNT(job_postings_fact.job_id) AS job_count
    FROM
        skills_job_dim
        INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_work_from_home IS TRUE
    GROUP BY
        id
)

SELECT
    remote_job_count.id,
    skills_dim.skills,
    remote_job_count.job_count
FROM
    remote_job_count
    INNER JOIN skills_dim ON remote_job_count.id = skills_dim.skill_id
ORDER BY
    remote_job_count.job_count DESC
LIMIT 5    

