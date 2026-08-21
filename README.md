# Technical Support Analysis

SQL-based analysis of technical support ticket data to identify operational patterns, SLA performance, agent performance, and resolution trends.

## Project Objective

Analyze technical support data using SQL to answer real-world business questions and generate actionable operational insights.

**Flow:**
`Support Data → SQL Analysis → Business Findings → Operational Insights`

## Dataset

Technical support ticket dataset containing information about:

- Ticket status, priority, topic, and source
- Agent and agent group
- Ticket creation, response, SLA, and resolution times
- Product group, support level, country
- Customer survey results and agent interactions

## Business Questions

1. What is the distribution of support tickets by their current status?
2. How are support tickets distributed across different priority levels?
3. What percentage of support tickets meet the SLA resolution target, and what percentage miss it?
4. How many tickets does each support agent handle, and what is their average resolution time?
5. Which topics or product groups have the highest ticket volume and SLA miss rates?
6. How does average ticket resolution time vary across different support channels?
7. Which agent groups have an SLA resolution compliance rate below the target threshold of 80%?
8. Which support agents have the highest SLA miss rates, after considering only agents who handled a minimum number of tickets?
9. How do monthly ticket volume and average resolution time change over time?
10. Which five topics or product groups have the longest average resolution times compared with the overall average?
11. Where is the gap between first response and final resolution the largest, and which agents or topics show fast initial responses but slow overall resolution?

## SQL Techniques Used

- `SELECT`, `WHERE`
- `GROUP BY`, `HAVING`
- Aggregate functions: `COUNT`, `SUM`, `AVG`
- `CASE WHEN`
- Subqueries
- CTEs
- Window functions
- Date/time analysis with `TIMESTAMPDIFF`
- Ranking
- Conditional aggregation

## Project Structure

```text
technical-support-analysis/
│
├── README.md
├── data/
│   └── support_data.csv
│
├── sql/
│   ├── 01_status_distribution.sql
│   ├── 02_priority_distribution.sql
│   ├── 03_sla_compliance.sql
│   ├── 04_agent_performance.sql
│   ├── 05_topic_sla_analysis.sql
│   ├── 06_channel_resolution_analysis.sql
│   ├── 07_agent_group_sla_compliance.sql
│   ├── 08_agent_sla_ranking.sql
│   ├── 09_monthly_support_trends.sql
│   ├── 10_slowest_topics_product_groups.sql
│   └── 11_first_response_vs_resolution.sql
│
└── results/
    └── 01......
```

## Key Findings

- Only 66.87% of tickets met the SLA resolution target, while 15.83% missed the SLA and 17.30% remained unresolved.
- Both agent groups were below the 80% SLA compliance target, with 1st Line Support at 65.95% and 2nd Line Support at 69.78%.
- Pricing and Licensing had the highest SLA miss rate at 18.62% across 521 tickets, while Product Setup had the highest ticket volume at 623.
- Average resolution time increased from 1,565.73 minutes in January to 2,277.86 minutes in December, indicating a significant increase in resolution duration over the year.
