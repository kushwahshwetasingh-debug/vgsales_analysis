create database vgames;

use vgames;

select * from vgsales;

CREATE VIEW v_PlatformGenreSales AS
SELECT 
    Platform,
    Genre, 
    SUM(Global_Sales) AS Total_Global_Sales,
    COUNT(Name) AS Total_Games_Released
FROM vgsales
WHERE Genre IS NOT NULL AND Platform IS NOT NULL
GROUP BY Platform, Genre;

create view v_regionyearsales as
select
year,
round(sum(NA_Sales),2) as North_america_sales,
round(sum(EU_Sales),2) as europe_sales,
round(sum(jp_sales),2) as japan_sales,
round(sum(other_sales),2) as other_sales,
round(sum(Global_sales),2) as total_sales,
count(name) as count 
from vgsales
where year is not null
group by year;

CREATE VIEW v_PublisherYearlySales AS
SELECT 
    Publisher,
    Year,
    ROUND(SUM(Global_Sales), 2) AS Total_Global_Sales,
    COUNT(Name) AS Total_Games_Released
FROM vgsales
WHERE Publisher IS NOT NULL AND Year IS NOT NULL
GROUP BY Publisher, Year;

CREATE VIEW genreSalesYearWise AS
SELECT 
    Year,
    Genre,
    ROUND(SUM(Global_Sales), 2) AS total_sales_genre
FROM vgsales -- Make sure this matches your exact table name!
WHERE Year IS NOT NULL AND Genre IS NOT NULL
GROUP BY Year, Genre;

CREATE VIEW v_FinalFranchiseDashboard AS
WITH FranchiseMap AS (
    SELECT 'Pokemon%' AS Keyword, 'Pokemon Franchise' AS FranchiseName UNION ALL
    SELECT '%Mario%'  AS Keyword, 'Super Mario Franchise' AS FranchiseName UNION ALL
    SELECT 'Call of Duty%' AS Keyword, 'Call of Duty Series' AS FranchiseName UNION ALL
    SELECT 'Grand Theft Auto%' AS Keyword, 'GTA Series' AS FranchiseName UNION ALL
    SELECT 'FIFA%'     AS Keyword, 'FIFA Sports' AS FranchiseName
)
SELECT 
    v.Name,
    v.Platform,
    v.Year,
    v.Genre,
    v.Global_Sales,
    v.NA_Sales,
    v.EU_Sales,
    v.JP_Sales,
    ISNULL(m.FranchiseName, 'Other / Independent') AS Franchise_Group
FROM vgsales v
LEFT JOIN FranchiseMap m 
    ON v.Name LIKE m.Keyword;


select count (*) from v_FinalFranchiseDashboard;


DROP VIEW v_FinalFranchiseDashboard;

