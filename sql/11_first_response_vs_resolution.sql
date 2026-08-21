-- Q11. Where is the gap between first response and final resolution the largest, 
-- and which agents or topics show fast initial responses but slow overall resolution?

WITH response_analysis AS (
    SELECT
        agent_name,
        Topic,
        TIMESTAMPDIFF(MINUTE, created_time, first_response_time) AS first_response_minutes,
        TIMESTAMPDIFF(MINUTE, created_time, resolution_time) AS resolution_minutes,
        TIMESTAMPDIFF(
            MINUTE,
            first_response_time,
            resolution_time
        ) AS response_to_resolution_gap
    FROM support_data
    WHERE first_response_time IS NOT NULL
      AND resolution_time IS NOT NULL
)

SELECT
    agent_name,
    Topic,
    ROUND(AVG(first_response_minutes), 2) AS avg_first_response_minutes,
    ROUND(AVG(resolution_minutes), 2) AS avg_resolution_minutes,
    ROUND(AVG(response_to_resolution_gap), 2) AS avg_response_to_resolution_gap
FROM response_analysis
GROUP BY agent_name, Topic
ORDER BY avg_response_to_resolution_gap DESC;