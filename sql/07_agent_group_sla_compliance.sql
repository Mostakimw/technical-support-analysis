-- Q7. Which agent groups have an SLA resolution compliance rate below the target threshold of 80%?

SELECT
    agent_group,
    COUNT(*) AS total_tickets,
    SUM(
        CASE
            WHEN resolution_time <= expected_sla_to_resolve THEN 1
            ELSE 0
        END
    ) AS sla_met_tickets,
    ROUND(
        SUM(
            CASE
                WHEN resolution_time <= expected_sla_to_resolve THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS sla_compliance_rate
FROM support_data
GROUP BY agent_group
HAVING sla_compliance_rate < 80
ORDER BY sla_compliance_rate;