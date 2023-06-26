WITH project_duration AS (
    SELECT (DATE_PART('year', FINISH_DATE) - DATE_PART('year', START_DATE)) * 12
           + DATE_PART('month', FINISH_DATE) - DATE_PART('month', START_DATE) AS MONTH_COUNT
    FROM project
)
SELECT project.ID, project_duration.MONTH_COUNT
FROM project
JOIN project_duration ON true
WHERE project_duration.MONTH_COUNT = (
    SELECT MAX(project_duration.MONTH_COUNT)
    FROM project_duration
);