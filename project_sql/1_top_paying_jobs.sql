/*
This query retrieves the 10 newest job postings for positions containing 
the word "Analyst" that are located in Kraków. 
The results include only postings that have information about the average yearly salary. 
Additionally, each posting includes the company name.
*/

SELECT
    name AS comapny_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::date AS date,
    job_posted_date::time AS time,
    job_id
FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short ILIKE '%Analyst%'
    AND job_location ILIKE '%Kraków%'
    AND salary_year_avg IS NOT NULL
ORDER BY
    date DESC
LIMIT 10

/*
[
  {
    "comapny_name": "KION Group",
    "job_title": "Master Data Management Junior Administrator with German",
    "job_location": "Kraków, Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "56700.0",
    "date": "2023-11-08",
    "time": "18:36:47",
    "job_id": 899967
  },
  {
    "comapny_name": "Verisk",
    "job_title": "Junior Data Analyst",
    "job_location": "Kraków, Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "57500.0",
    "date": "2023-07-25",
    "time": "17:26:07",
    "job_id": 498619
  },
  {
    "comapny_name": "Averna",
    "job_title": "Vision Engineer",
    "job_location": "Kraków, Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89100.0",
    "date": "2023-05-10",
    "time": "01:50:24",
    "job_id": 1444621
  },
  {
    "comapny_name": "Verisk",
    "job_title": "Senior Data Analyst",
    "job_location": "Kraków, Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "date": "2023-04-12",
    "time": "19:48:55",
    "job_id": 1812424
  },
  {
    "comapny_name": "OANDA",
    "job_title": "Data Analyst with Python",
    "job_location": "Kraków, Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "98500.0",
    "date": "2023-03-15",
    "time": "06:24:09",
    "job_id": 1513681
  },
  {
    "comapny_name": "Verisk",
    "job_title": "Data Analyst/Custom Insights",
    "job_location": "Kraków, Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "45000.0",
    "date": "2023-01-11",
    "time": "00:35:05",
    "job_id": 458109
  }
]
*/