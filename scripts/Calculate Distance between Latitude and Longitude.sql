DECLARE @lat1 FLOAT = YourLat1;
DECLARE @lon1 FLOAT = YourLon1;
DECLARE @lat2 FLOAT = YourLat2;
DECLARE @lon2 FLOAT = YourLon2;

DECLARE @R FLOAT = 6371; -- Earth radius in kilometers

SELECT
    @R * ACOS(SIN(RADIANS(@lat1)) * SIN(RADIANS(@lat2)) +
             COS(RADIANS(@lat1)) * COS(RADIANS(@lat2)) *
             COS(RADIANS(@lon2 - @lon1))) AS DistanceInKm;
