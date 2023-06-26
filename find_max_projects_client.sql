WITH project_duration AS (
    SELECT project.ID, (DATE_PART('year', project.FINISH_DATE) - DATE_PART('year', project.START_DATE)) * 12
           + DATE_PART('month', project.FINISH_DATE) - DATE_PART('month', project.START_DATE) AS MONTH_COUNT
    FROM project
)
SELECT project.ID, project_duration.MONTH_COUNT
FROM project
JOIN project_duration ON project.ID = project_duration.ID
WHERE project_duration.MONTH_COUNT = (
    SELECT MAX(project_duration.MONTH_COUNT)
    FROM project_duration
);