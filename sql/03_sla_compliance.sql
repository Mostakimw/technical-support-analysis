-- Q3. What percentage of support tickets meet the SLA resolution target, and what percentage miss it?

SELECT
    sla_status,
    COUNT(*) AS total_count,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM support_data), 2) AS percentage
FROM (
    SELECT
        expected_sla_to_resolve,
        resolution_time,
        CASE
            WHEN resolution_time IS NULL THEN 'Unresolved'
            WHEN resolution_time <= expected_sla_to_resolve THEN 'Met'
            ELSE 'Missed'
        END AS sla_status
    FROM support_data
) AS sla_data
GROUP BY sla_status;