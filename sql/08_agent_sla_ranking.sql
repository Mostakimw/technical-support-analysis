-- Q8. Which support agents have the highest SLA miss rates, after considering only agents who handled a minimum number of tickets?

WITH agent_sla AS (
    SELECT
        agent_name,
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
    WHERE resolution_time IS NOT NULL
    GROUP BY agent_name
    HAVING COUNT(*) >= 10
)

SELECT
    agent_name,
    total_tickets,
    sla_missed_tickets,
    sla_miss_rate,
    RANK() OVER (ORDER BY sla_miss_rate DESC) AS miss_rate_rank
FROM agent_sla
ORDER BY miss_rate_rank;