DECLARE @PriorityQueue TABLE (ID INT IDENTITY(1,1), Priority INT, Data VARCHAR(255));

-- Enqueue
INSERT INTO @PriorityQueue (Priority, Data) VALUES (1, 'Data1');

-- Dequeue
DECLARE @DequeuedData VARCHAR(255);
SELECT TOP 1 @DequeuedData = Data FROM @PriorityQueue ORDER BY Priority;
DELETE FROM @PriorityQueue WHERE Data = @DequeuedData;

SELECT @DequeuedData AS DequeuedData;
