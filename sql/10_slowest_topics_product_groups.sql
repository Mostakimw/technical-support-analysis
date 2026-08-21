-- Q10. Which five topics or product groups have the longest average resolution times compared with the overall average?

SELECT
    Topic,
    ROUND(
        AVG(TIMESTAMPDIFF(MINUTE, created_time, resolution_time)),
        2
    ) AS avg_resolution_minutes,
    ROUND(
        AVG(TIMESTAMPDIFF(MINUTE, created_time, resolution_time))
        - (SELECT AVG(TIMESTAMPDIFF(MINUTE, created_time, resolution_time))
           FROM support_data
           WHERE resolution_time IS NOT NULL),
        2
    ) AS difference_from_overall_avg
FROM support_data
WHERE resolution_time IS NOT NULL
GROUP BY Topic
ORDER BY avg_resolution_minutes DESC
LIMIT 5;