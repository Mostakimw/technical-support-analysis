-- Q2. How are support tickets distributed across different priority levels?

SELECT Priority, COUNT(*) AS total_count
FROM support_data
GROUP BY Priority;