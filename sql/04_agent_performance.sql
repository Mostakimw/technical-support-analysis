-- Q4. How many tickets does each support agent handle, and what is their average resolution time?

SELECT 
    agent_name,
    COUNT(*) AS ticket_count,
    AVG(TIMESTAMPDIFF(MINUTE, created_time, resolution_time)) AS avg_resolution_minutes
FROM support_data
GROUP BY agent_name;