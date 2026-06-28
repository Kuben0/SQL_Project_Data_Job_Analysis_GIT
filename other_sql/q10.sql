SELECT
    skills_dim.skills,
    sarkon.job_count
FROM
    skills_dim INNER JOIN
    (SELECT
        sjd.skill_id AS sk,
        COUNT(jpf.job_id) AS job_count
    FROM
        job_postings_fact AS jpf
        INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.skill_id
    GROUP BY
        sjd.skill_id
    ORDER BY
        job_count DESC
    LIMIT 5) AS sarkon ON skills_dim.skill_id = sarkon.sk

