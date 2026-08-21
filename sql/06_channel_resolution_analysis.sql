-- Q6. How does average ticket resolution time vary across different support channels?

SELECT
    Source AS support_channel,
    COUNT(*) AS total_tickets,
    ROUND(
        AVG(TIMESTAMPDIFF(MINUTE, created_time, resolution_time)),
        2
    ) AS avg_resolution_minutes
FROM support_data
GROUP BY Source
ORDER BY avg_resolution_minutes DESC;