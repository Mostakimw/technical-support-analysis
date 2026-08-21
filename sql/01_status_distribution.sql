-- Q1. What is the distribution of support tickets by their current status?

SELECT Status, COUNT(*) AS total_count
FROM support_data
GROUP BY Status;