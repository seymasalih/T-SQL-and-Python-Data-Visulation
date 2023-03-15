
USE earthquake
GO

select * from eq_data

-- For update getting only city name in Location column
UPDATE eq_data
SET Location = SUBSTRING(Location, CHARINDEX('(', Location) + 1, CHARINDEX(')', Location) - CHARINDEX('(', Location) - 1)
WHERE CHARINDEX('(', Location) > 0 AND CHARINDEX(')', Location) > 0;


-- List
SELECT Date , Magnitude, Location
FROM eq_data where Magnitude > 40;

-- Pie chart
SELECT COUNT(Location) as Adet, Location
FROM eq_data where Magnitude > 40
GROUP BY Location Order by Adet desc;

-- LINE GRAPH
select Count(CONVERT(DATE, Date)) as Adet , CONVERT(DATE, Date) as Date from eq_data Group by CONVERT(DATE, Date) order by CONVERT(DATE, Date)
--Bar chart
SELECT COUNT(Location) as Adet, CAST(Date AS DATE) as Date
FROM eq_data where Location= 'Kahramanmaraþ'
GROUP BY CAST(Date AS DATE) Order by CAST(Date AS DATE)

--Bar chart
SELECT COUNT(Location) as Adet, CAST(Date AS DATE) as Date ,Location
FROM eq_data where Location= 'Malatya' or Location='Kahramanmaraþ'
GROUP BY CAST(Date AS DATE), Location Order by CAST(Date AS DATE)

select Count(CONVERT(DATE, Date)) as Adet , CONVERT(DATE, Date) as Date , Location from eq_data Group by CONVERT(DATE, Date), Location





