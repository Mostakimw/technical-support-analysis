-- Q5. Which topics or product groups have the highest ticket volume and SLA miss rates?

SELECT 
    Topic,
    COUNT(*) AS total_tickets,
    SUM(
        CASE
            WHEN resolution_time > expected_sla_to_resolve THEN 1
            ELSE 0
        END
    ) AS sla_missed_tickets,
    ROUND(
        SUM(
            CASE
                WHEN resolution_time > expected_sla_to_resolve THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS sla_miss_rate
FROM support_data
GROUP BY Topic
ORDER BY sla_miss_rate DESC;