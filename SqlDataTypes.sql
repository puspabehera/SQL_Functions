-- Create the datatypes table
IF OBJECT_ID('tempdb..#datatypes') IS NOT NULL
BEGIN    DROP TABLE #datatypes;
END

CREATE TABLE #datatypes (
    [Data Type] NVARCHAR(50),
    [Type of Data] NVARCHAR(50),
    [Definition] NVARCHAR(MAX),
    [Example] NVARCHAR(MAX),
    [Output] NVARCHAR(MAX)
);

-- Insert data into the table
INSERT INTO #datatypes ([Data Type], [Type of Data], [Definition], [Example], [Output])
VALUES 
    ('INT', 'Numeric', 'Stores whole numbers, typically used for counting or indexing.', 
     'DECLARE @number INT; SET @number = 123; SELECT @number AS ''Number'';', 
     'Number: 123'),
     
    ('FLOAT', 'Numeric', 'Stores approximate numeric values with floating-point precision.', 
     'DECLARE @value FLOAT; SET @value = 123.456; SELECT @value AS ''Value'';', 
     'Value: 123.456'),
     
    ('REAL', 'Numeric', 'Stores approximate numeric values with lower precision than FLOAT.', 
     'DECLARE @value REAL; SET @value = 123.456; SELECT @value AS ''Value'';', 
     'Value: 123.456'),
     
    ('DECIMAL(p,s)', 'Numeric', 'Stores fixed-point numbers with exact precision.', 
     'DECLARE @price DECIMAL(10, 2); SET @price = 12345.67; SELECT @price AS ''Price'';', 
     'Price: 12345.67'),
     
    ('NUMERIC(p,s)', 'Numeric', 'Synonym for DECIMAL, stores fixed-point numbers with exact precision.', 
     'DECLARE @price NUMERIC(10, 2); SET @price = 12345.67; SELECT @price AS ''Price'';', 
     'Price: 12345.67'),
     
    ('BIT', 'Boolean', 'Stores TRUE or FALSE values.', 
     'DECLARE @isAvailable BIT; SET @isAvailable = 1; SELECT @isAvailable AS ''IsAvailable'';', 
     'IsAvailable: 1'),
     
    ('CHAR(n)', 'Character String', 'Stores fixed-length non-Unicode character strings.', 
     'DECLARE @code CHAR(10); SET @code = ''A123''; SELECT @code AS ''Code'', DATALENGTH(@code) AS ''Datalength'';', 
     'Code: ''A123      '', Datalength: 10'),
     
    ('VARCHAR(n)', 'Character String', 'Stores variable-length non-Unicode character strings.', 
     'DECLARE @name VARCHAR(50); SET @name = ''John Doe''; SELECT @name AS ''Name'', DATALENGTH(@name) AS ''Datalength'';', 
     'Name: ''John Doe'', Datalength: 8'),
     
    ('NCHAR(n)', 'Unicode String', 'Stores fixed-length Unicode character strings.', 
     'DECLARE @string NCHAR(20); SET @string = N''Robin''; SELECT @string AS ''String'', DATALENGTH(@string) AS ''Datalength'', LEN(@string) AS ''Len'';', 
     'String: ''Robin              '', Datalength: 40, Len: 5'),
     
    ('NVARCHAR(n)', 'Unicode String', 'Stores variable-length Unicode character strings.', 
     'DECLARE @description NVARCHAR(100); SET @description = N''Hello World''; SELECT @description AS ''Description'', DATALENGTH(@description) AS ''Datalength'';', 
     'Description: ''Hello World'', Datalength: 22'),
     
    ('TEXT', 'Large String', 'Stores large non-Unicode character strings.', 
     'DECLARE @largeText TEXT; SET @largeText = ''This is a large text''; SELECT @largeText AS ''LargeText'';', 
     'LargeText: ''This is a large text'''),
     
    ('NTEXT', 'Large Unicode String', 'Stores large Unicode character strings.', 
     'DECLARE @largeText NTEXT; SET @largeText = N''यह एक बड़ा टेक्स्ट है''; SELECT @largeText AS ''LargeText'';', 
     'LargeText: ''यह एक बड़ा टेक्स्ट है'''),
     
    ('BINARY(n)', 'Binary Data', 'Stores fixed-length binary data.', 
     'DECLARE @binaryData BINARY(5); SET @binaryData = 0x12345; SELECT @binaryData AS ''BinaryData'';', 
     'BinaryData: 0x1234500000'),
     
    ('VARBINARY(n)', 'Binary Data', 'Stores variable-length binary data.', 
     'DECLARE @binaryData VARBINARY(10); SET @binaryData = 0x123456; SELECT @binaryData AS ''BinaryData'';', 
     'BinaryData: 0x123456'),
     
    ('IMAGE', 'Large Binary Data', 'Stores large binary data.', 
     'DECLARE @imageData IMAGE; SET @imageData = 0x1234567890; SELECT @imageData AS ''ImageData'';', 
     'ImageData: 0x1234567890'),
     
    ('DATE', 'Date', 'Stores date values in the format YYYY-MM-DD.', 
     'DECLARE @date DATE; SET @date = ''2023-06-15''; SELECT @date AS ''Date'';', 
     'Date: ''2023-06-15'''),
     
    ('TIME', 'Time', 'Stores time values in the format HH:MM:SS.', 
     'DECLARE @time TIME; SET @time = ''12:34:56''; SELECT @time AS ''Time'';', 
     'Time: ''12:34:56'''),
     
    ('DATETIME', 'Date and Time', 'Stores both date and time values in the format YYYY-MM-DD HH:MM:SS.', 
     'DECLARE @dateTime DATETIME; SET @dateTime = ''2023-06-15 12:34:56''; SELECT @dateTime AS ''DateTime'';', 
     'DateTime: ''2023-06-15 12:34:56'''),
     
    ('SMALLDATETIME', 'Date and Time', 'Stores date and time values with less precision than DATETIME.', 
     'DECLARE @smallDateTime SMALLDATETIME; SET @smallDateTime = ''2023-06-15 12:00''; SELECT @smallDateTime AS ''SmallDateTime'';', 
     'SmallDateTime: ''2023-06-15 12:00'''),
     
    ('DATETIME2', 'Date and Time', 'Stores date and time values with higher precision than DATETIME.', 
     'DECLARE @dateTime2 DATETIME2; SET @dateTime2 = ''2023-06-15 12:34:56.1234567''; SELECT @dateTime2 AS ''DateTime2'';', 
     'DateTime2: ''2023-06-15 12:34:56.1234567'''),
     
    ('DATETIMEOFFSET', 'Date and Time with Time Zone', 'Stores date and time values along with the time zone offset.', 
     'DECLARE @dateTimeOffset DATETIMEOFFSET; SET @dateTimeOffset = ''2023-06-15 12:34:56 +05:30''; SELECT @dateTimeOffset AS ''DateTimeOffset'';', 
     'DateTimeOffset: ''2023-06-15 12:34:56 +05:30'''),
     
    ('UNIQUEIDENTIFIER', 'Unique Identifier', 'Stores a globally unique identifier (GUID).', 
     'DECLARE @guid UNIQUEIDENTIFIER; SET @guid = NEWID(); SELECT @guid AS ''GUID'';', 
     'GUID: (newly generated GUID)'),
     
    ('XML', 'XML Data', 'Stores XML formatted data.', 
     'DECLARE @xmlData XML; SET @xmlData = ''<root><child>value</child></root>''; SELECT @xmlData AS ''XMLData'';', 
     'XMLData: ''<root><child>value</child></root>'''),
     
    ('SQL_VARIANT', 'Miscellaneous', 'Stores values of various SQL Server-supported data types.', 
     'DECLARE @sqlVariant SQL_VARIANT; SET @sqlVariant = 123; SELECT @sqlVariant AS ''SQLVariant'';', 
     'SQLVariant: 123'),
     
    ('TABLE', 'Table', 'Stores a result set for later processing.', 
     'DECLARE @table TABLE (ID INT, Name VARCHAR(50)); INSERT INTO @table VALUES (1, ''John Doe''); SELECT * FROM @table;', 
     'ID: 1, Name: ''John Doe'''),
     
    ('CURSOR', 'Cursor', 'Stores a pointer to a result set for row-by-row processing.', 
     'DECLARE @cursor CURSOR; SET @cursor = CURSOR FOR SELECT * FROM Products; OPEN @cursor; FETCH NEXT FROM @cursor;', 
     '(Points to a result set for row-by-row processing)');

-- Display the inserted data
SELECT * FROM #datatypes;
 