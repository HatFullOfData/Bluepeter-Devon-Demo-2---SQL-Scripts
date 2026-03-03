-- Create Calendar Table for Microsoft Fabric Warehouse
CREATE TABLE Calendar (
    DateKey INT NOT NULL,
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    Month INT NOT NULL,
    MonthName VARCHAR(20) NOT NULL,
    Week INT NOT NULL,
    DayOfYear INT NOT NULL,
    DayOfMonth INT NOT NULL,
    DayOfWeek INT NOT NULL,
    DayName VARCHAR(20) NOT NULL,
    IsWeekend BIT NOT NULL,
    IsHoliday BIT NOT NULL,
    CreatedDate DATETIME2(6)
);

-- Populate Calendar with dates from 2024-01-01 to 2026-12-31
DECLARE @StartDate DATE = '2024-01-01';
DECLARE @EndDate DATE = '2026-12-31';
DECLARE @CurrentDate DATE = @StartDate;

WHILE @CurrentDate <= @EndDate
BEGIN
    INSERT INTO Calendar (
        DateKey,
        FullDate,
        Year,
        Quarter,
        Month,
        MonthName,
        Week,
        DayOfYear,
        DayOfMonth,
        DayOfWeek,
        DayName,
        IsWeekend,
        IsHoliday,
        CreatedDate
    )
    VALUES (
        CAST(FORMAT(@CurrentDate, 'yyyyMMdd') AS INT),
        @CurrentDate,
        YEAR(@CurrentDate),
        DATEPART(QUARTER, @CurrentDate),
        MONTH(@CurrentDate),
        DATENAME(MONTH, @CurrentDate),
        DATEPART(WEEK, @CurrentDate),
        DATEPART(DAYOFYEAR, @CurrentDate),
        DAY(@CurrentDate),
        DATEPART(WEEKDAY, @CurrentDate),
        DATENAME(WEEKDAY, @CurrentDate),
        CASE WHEN DATEPART(WEEKDAY, @CurrentDate) IN (1, 7) THEN 1 ELSE 0 END,
        0,
        GETDATE()
    );
    
    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
END;