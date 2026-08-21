-- Q9. How do monthly ticket volume and average resolution time change over time?

SELECT
    YEAR(created_time) AS ticket_year,
    MONTH(created_time) AS ticket_month,
    COUNT(*) AS total_tickets,
    ROUND(
        AVG(TIMESTAMPDIFF(MINUTE, created_time, resolution_time)),
        2
    ) AS avg_resolution_minutes
FROM support_data
GROUP BY YEAR(created_time), MONTH(created_time)
ORDER BY ticket_year, ticket_month;