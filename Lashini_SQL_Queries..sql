--Create the data base
CREATE DATABASE [Young_Lives ];
----Preview the data
-- Preview the first 10 rows of the dataset
SELECT TOP 10 *
FROM [dbo].[ethiopia_constructed];

SELECT TOP 10 *
FROM [dbo].[india_constructed];
-- Get the column names and data types of the table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME ='ethiopia_constructed';
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'india_constructed';
--Extract seleted colomns to a new dataset
--Country India
SELECT 
    childid,
    chsex,
    chweight,
    chheight,
    bmi,
    underweight,
    stunting,
    thinness,
    agemon,
    foodsec,
    zwfa,
    zhfa,
    zbfa,
    dadedu,
    momedu,
    caredu,
    headedu,
    enrol,
    engrade,
    hschool,
    timesch,
    levlread,
    levlwrit,
    literate,
    hhsize,
    typesite,
    region,
    ownhouse,
    ownlandhse,
    drwaterq,
    toiletq,
    elecq,
    cookingq,
    hwork,
    hchore,
    htask,
    credit,
    hcare,
    chhealth,
    chmightdie,
    chillness,
    chinjury,
    chdisability,
    carehead,
    shhouse1,
    shhouse2,
    shhouse3,
    shenv1,
    shenv2,
    shenv3,
    numante,
    delivery,
    tetanus,
    bcg,
    measles,
    polio,
    dpt,
    hib,
	wi,
	hq,
	sv
INTO 
    India -- This will be the new table name
FROM 
    dbo.india_constructed; --  main dataset
SELECT TOP 10 *
FROM [dbo].[India];
--Country Ethiopia

SELECT 
    childid,
    chsex,
    agemon,
	foodsec,
    chweight,
    chheight,
    bmi,
    zwfa,
    zhfa,
    zbfa,
    underweight,
    stunting,
    thinness,
    dadedu,
    momedu,
    caredu,
    headedu,
    enrol,
    engrade,
    hschool,
    timesch,
    levlread,
    levlwrit,
    literate,
    hhsize,
    typesite,
    region,
    ownhouse,
    ownlandhse,
    drwaterq,
    toiletq,
    elecq,
    cookingq,
    hwork,
    hchore,
    htask,
    credit,
    hcare,
    chhealth,
    chmightdie,
    chillness,
    chinjury,
    chdisability,
    carehead,
    shhouse1,
    shhouse2,
    shhouse3,
    shenv1,
    shenv2,
    shenv3,
    numante,
    delivery,
    tetanus,
    bcg,
    measles,
    polio,
    dpt,
    hib,
	hq,
	wi,
	sv
INTO [dbo].[Ethiopia] --name of the new table
FROM [dbo].[ethiopia_constructed]; -- Specify the source table

SELECT TOP 10 *
FROM [dbo].[India];
SELECT TOP 10 *
FROM [dbo].[Ethiopia];

----Add Country Column
 
alter table[dbo].[Ethiopia]
add country Varchar(50);

UPDATE [dbo].[Ethiopia]  -- Update Country_Name as Ethiopia
SET country  = 'Ethiopia'

alter table [dbo].[India]
add country Varchar(50);

.,8
-- Replace Null Values
--India
UPDATE [dbo].[India]
SET 
    childid = COALESCE(NULLIF(childid, ''), 'NA'),
    chsex = COALESCE(NULLIF(chsex, ''), 'NA'),
    agemon = COALESCE(NULLIF(agemon, ''), 'NA'),
    chweight = COALESCE(NULLIF(chweight, ''), 'NA'),
    chheight = COALESCE(NULLIF(chheight, ''), 'NA'),
    bmi = COALESCE(NULLIF(bmi, ''), 'NA'),
    zwfa = COALESCE(NULLIF(zwfa, ''), 'NA'),
    zhfa = COALESCE(NULLIF(zhfa, ''), 'NA'),
    zbfa = COALESCE(NULLIF(zbfa, ''), 'NA'),
    underweight = COALESCE(NULLIF(underweight, ''), 'NA'),
    stunting = COALESCE(NULLIF(stunting, ''), 'NA'),
    thinness = COALESCE(NULLIF(thinness, ''), 'NA'),
    dadedu = COALESCE(NULLIF(dadedu, ''), 'NA'),
    momedu = COALESCE(NULLIF(momedu, ''), 'NA'),
    caredu = COALESCE(NULLIF(caredu, ''), 'NA'),
    headedu = COALESCE(NULLIF(headedu, ''), 'NA'),
    enrol = COALESCE(NULLIF(enrol, ''), 'NA'),
    engrade = COALESCE(NULLIF(engrade, ''), 'NA'),
    hschool = COALESCE(NULLIF(hschool, ''), 'NA'),
    timesch = COALESCE(NULLIF(timesch, ''), 'NA'),
    levlread = COALESCE(NULLIF(levlread, ''), 'NA'),
    levlwrit = COALESCE(NULLIF(levlwrit, ''), 'NA'),
    literate = COALESCE(NULLIF(literate, ''), 'NA'),
    hhsize = COALESCE(NULLIF(hhsize, ''), 'NA'),
    typesite = COALESCE(NULLIF(typesite, ''), 'NA'),
    region = COALESCE(NULLIF(region, ''), 'NA'),
    ownhouse = COALESCE(NULLIF(ownhouse, ''), 'NA'),
    ownlandhse = COALESCE(NULLIF(ownlandhse, ''), 'NA'),
    drwaterq = COALESCE(NULLIF(drwaterq, ''), 'NA'),
    toiletq = COALESCE(NULLIF(toiletq, ''), 'NA'),
    elecq = COALESCE(NULLIF(elecq, ''), 'NA'),
    cookingq = COALESCE(NULLIF(cookingq, ''), 'NA'),
    hwork = COALESCE(NULLIF(hwork, ''), 'NA'),
    hchore = COALESCE(NULLIF(hchore, ''), 'NA'),
    htask = COALESCE(NULLIF(htask, ''), 'NA'),
    credit = COALESCE(NULLIF(credit, ''), 'NA'),
    hcare = COALESCE(NULLIF(hcare, ''), 'NA'),
    chhealth = COALESCE(NULLIF(chhealth, ''), 'NA'),
    chmightdie = COALESCE(NULLIF(chmightdie, ''), 'NA'),
    chillness = COALESCE(NULLIF(chillness, ''), 'NA'),
    chinjury = COALESCE(NULLIF(chinjury, ''), 'NA'),
    chdisability = COALESCE(NULLIF(chdisability, ''), 'NA'),
    carehead = COALESCE(NULLIF(carehead, ''), 'NA'),
    shhouse1 = COALESCE(NULLIF(shhouse1, ''), 'NA'),
    shhouse2 = COALESCE(NULLIF(shhouse2, ''), 'NA'),
    shhouse3 = COALESCE(NULLIF(shhouse3, ''), 'NA'),
    shenv1 = COALESCE(NULLIF(shenv1, ''), 'NA'),
    shenv2 = COALESCE(NULLIF(shenv2, ''), 'NA'),
    shenv3 = COALESCE(NULLIF(shenv3, ''), 'NA'),
    numante = COALESCE(NULLIF(numante, ''), 'NA'),
    delivery = COALESCE(NULLIF(delivery, ''), 'NA'),
    tetanus = COALESCE(NULLIF(tetanus, ''), 'NA'),
    bcg = COALESCE(NULLIF(bcg, ''), 'NA'),
    measles = COALESCE(NULLIF(measles, ''), 'NA'),
    polio = COALESCE(NULLIF(polio, ''), 'NA'),
    dpt = COALESCE(NULLIF(dpt, ''), 'NA'),
    hib = COALESCE(NULLIF(hib, ''), 'NA'),
    wi = COALESCE(NULLIF(wi, ''), 'NA'),
    hq = COALESCE(NULLIF(hq, ''), 'NA'),
    sv = COALESCE(NULLIF(sv, ''), 'NA'),
	foodsec = COALESCE(NULLIF(foodsec, ''), 'NA')   
	
	WHERE 
    childid IS NULL OR childid = '' 
    OR chsex IS NULL OR chsex = '' 
    OR chweight IS NULL OR chweight = '' 
    OR chheight IS NULL OR chheight = '' 
    OR bmi IS NULL OR bmi = '' 
    OR underweight IS NULL OR underweight = '' 
    OR stunting IS NULL OR stunting = '' 
    OR thinness IS NULL OR thinness = '' 
    OR agemon IS NULL OR agemon = '' 
    OR foodsec IS NULL OR foodsec = '' 
    OR zwfa IS NULL OR zwfa = '' 
    OR zhfa IS NULL OR zhfa = '' 
    OR zbfa IS NULL OR zbfa = '' 
    OR dadedu IS NULL OR dadedu = '' 
    OR momedu IS NULL OR momedu = '' 
    OR caredu IS NULL OR caredu = '' 
    OR headedu IS NULL OR headedu = '' 
    OR enrol IS NULL OR enrol = '' 
    OR engrade IS NULL OR engrade = '' 
    OR hschool IS NULL OR hschool = '' 
    OR timesch IS NULL OR timesch = '' 
    OR levlread IS NULL OR levlread = '' 
    OR levlwrit IS NULL OR levlwrit = '' 
    OR literate IS NULL OR literate = '' 
    OR hhsize IS NULL OR hhsize = '' 
    OR typesite IS NULL OR typesite = '' 
    OR region IS NULL OR region = '' 
    OR ownhouse IS NULL OR ownhouse = '' 
    OR ownlandhse IS NULL OR ownlandhse = '' 
    OR drwaterq IS NULL OR drwaterq = '' 
    OR toiletq IS NULL OR toiletq = '' 
    OR elecq IS NULL OR elecq = '' 
    OR cookingq IS NULL OR cookingq = '' 
    OR hwork IS NULL OR hwork = '' 
    OR hchore IS NULL OR hchore = '' 
    OR htask IS NULL OR htask = '' 
    OR credit IS NULL OR credit = '' 
    OR hcare IS NULL OR hcare = '' 
    OR chhealth IS NULL OR chhealth = '' 
    OR chmightdie IS NULL OR chmightdie = '' 
    OR chillness IS NULL OR chillness = '' 
    OR chinjury IS NULL OR chinjury = '' 
    OR chdisability IS NULL OR chdisability = '' 
    OR carehead IS NULL OR carehead = '' 
    OR shhouse1 IS NULL OR shhouse1 = '' 
    OR shhouse2 IS NULL OR shhouse2 = '' 
    OR shhouse3 IS NULL OR shhouse3 = '' 
    OR shenv1 IS NULL OR shenv1 = '' 
    OR shenv2 IS NULL OR shenv2 = '' 
    OR shenv3 IS NULL OR shenv3 = '' 
    OR numante IS NULL OR numante = '' 
    OR delivery IS NULL OR delivery = '' 
    OR tetanus IS NULL OR tetanus = '' 
    OR bcg IS NULL OR bcg = '' 
    OR measles IS NULL OR measles = '' 
    OR polio IS NULL OR polio = '' 
    OR dpt IS NULL OR dpt = '' 
    OR hib IS NULL OR hib = '' 
    OR wi IS NULL OR wi = '' 
    OR hq IS NULL OR hq = '' 
    OR sv IS NULL OR sv = ''
	OR foodsec IS NULL OR foodsec= '';

	select*
	from [dbo].[india]



--Ethiopia
UPDATE [dbo].[Ethiopia]
SET 
    childid = COALESCE(NULLIF(childid, ''), 'NA'),
    chsex = COALESCE(NULLIF(chsex, ''), 'NA'),
    agemon = COALESCE(NULLIF(agemon, ''), 'NA'),
    chweight = COALESCE(NULLIF(chweight, ''), 'NA'),
    chheight = COALESCE(NULLIF(chheight, ''), 'NA'),
    bmi = COALESCE(NULLIF(bmi, ''), 'NA'),
    zwfa = COALESCE(NULLIF(zwfa, ''), 'NA'),
    zhfa = COALESCE(NULLIF(zhfa, ''), 'NA'),
    zbfa = COALESCE(NULLIF(zbfa, ''), 'NA'),
    underweight = COALESCE(NULLIF(underweight, ''), 'NA'),
    stunting = COALESCE(NULLIF(stunting, ''), 'NA'),
    thinness = COALESCE(NULLIF(thinness, ''), 'NA'),
    dadedu = COALESCE(NULLIF(dadedu, ''), 'NA'),
    momedu = COALESCE(NULLIF(momedu, ''), 'NA'),
    caredu = COALESCE(NULLIF(caredu, ''), 'NA'),
    headedu = COALESCE(NULLIF(headedu, ''), 'NA'),
    enrol = COALESCE(NULLIF(enrol, ''), 'NA'),
    engrade = COALESCE(NULLIF(engrade, ''), 'NA'),
    hschool = COALESCE(NULLIF(hschool, ''), 'NA'),
    timesch = COALESCE(NULLIF(timesch, ''), 'NA'),
    levlread = COALESCE(NULLIF(levlread, ''), 'NA'),
    levlwrit = COALESCE(NULLIF(levlwrit, ''), 'NA'),
    literate = COALESCE(NULLIF(literate, ''), 'NA'),
    hhsize = COALESCE(NULLIF(hhsize, ''), 'NA'),
    typesite = COALESCE(NULLIF(typesite, ''), 'NA'),
    region = COALESCE(NULLIF(region, ''), 'NA'),
    ownhouse = COALESCE(NULLIF(ownhouse, ''), 'NA'),
    ownlandhse = COALESCE(NULLIF(ownlandhse, ''), 'NA'),
    drwaterq = COALESCE(NULLIF(drwaterq, ''), 'NA'),
    toiletq = COALESCE(NULLIF(toiletq, ''), 'NA'),
    elecq = COALESCE(NULLIF(elecq, ''), 'NA'),
    cookingq = COALESCE(NULLIF(cookingq, ''), 'NA'),
    hwork = COALESCE(NULLIF(hwork, ''), 'NA'),
    hchore = COALESCE(NULLIF(hchore, ''), 'NA'),
    htask = COALESCE(NULLIF(htask, ''), 'NA'),
    credit = COALESCE(NULLIF(credit, ''), 'NA'),
    hcare = COALESCE(NULLIF(hcare, ''), 'NA'),
    chhealth = COALESCE(NULLIF(chhealth, ''), 'NA'),
    chmightdie = COALESCE(NULLIF(chmightdie, ''), 'NA'),
    chillness = COALESCE(NULLIF(chillness, ''), 'NA'),
    chinjury = COALESCE(NULLIF(chinjury, ''), 'NA'),
    chdisability = COALESCE(NULLIF(chdisability, ''), 'NA'),
    carehead = COALESCE(NULLIF(carehead, ''), 'NA'),
    shhouse1 = COALESCE(NULLIF(shhouse1, ''), 'NA'),
    shhouse2 = COALESCE(NULLIF(shhouse2, ''), 'NA'),
    shhouse3 = COALESCE(NULLIF(shhouse3, ''), 'NA'),
    shenv1 = COALESCE(NULLIF(shenv1, ''), 'NA'),
    shenv2 = COALESCE(NULLIF(shenv2, ''), 'NA'),
    shenv3 = COALESCE(NULLIF(shenv3, ''), 'NA'),
    numante = COALESCE(NULLIF(numante, ''), 'NA'),
    delivery = COALESCE(NULLIF(delivery, ''), 'NA'),
    tetanus = COALESCE(NULLIF(tetanus, ''), 'NA'),
    bcg = COALESCE(NULLIF(bcg, ''), 'NA'),
    measles = COALESCE(NULLIF(measles, ''), 'NA'),
    polio = COALESCE(NULLIF(polio, ''), 'NA'),
    dpt = COALESCE(NULLIF(dpt, ''), 'NA'),
    hib = COALESCE(NULLIF(hib, ''), 'NA'),
    wi = COALESCE(NULLIF(wi, ''), 'NA'),
    hq = COALESCE(NULLIF(hq, ''), 'NA'),
    sv = COALESCE(NULLIF(sv, ''), 'NA'),
	foodsec = COALESCE(NULLIF(foodsec, ''), 'NA')

   
	
	WHERE 
    childid IS NULL OR childid = '' 
    OR chsex IS NULL OR chsex = '' 
    OR chweight IS NULL OR chweight = '' 
    OR chheight IS NULL OR chheight = '' 
    OR bmi IS NULL OR bmi = '' 
    OR underweight IS NULL OR underweight = '' 
    OR stunting IS NULL OR stunting = '' 
    OR thinness IS NULL OR thinness = '' 
    OR agemon IS NULL OR agemon = '' 
    OR foodsec IS NULL OR foodsec = '' 
    OR zwfa IS NULL OR zwfa = '' 
    OR zhfa IS NULL OR zhfa = '' 
    OR zbfa IS NULL OR zbfa = '' 
    OR dadedu IS NULL OR dadedu = '' 
    OR momedu IS NULL OR momedu = '' 
    OR caredu IS NULL OR caredu = '' 
    OR headedu IS NULL OR headedu = '' 
    OR enrol IS NULL OR enrol = '' 
    OR engrade IS NULL OR engrade = '' 
    OR hschool IS NULL OR hschool = '' 
    OR timesch IS NULL OR timesch = '' 
    OR levlread IS NULL OR levlread = '' 
    OR levlwrit IS NULL OR levlwrit = '' 
    OR literate IS NULL OR literate = '' 
    OR hhsize IS NULL OR hhsize = '' 
    OR typesite IS NULL OR typesite = '' 
    OR region IS NULL OR region = '' 
    OR ownhouse IS NULL OR ownhouse = '' 
    OR ownlandhse IS NULL OR ownlandhse = '' 
    OR drwaterq IS NULL OR drwaterq = '' 
    OR toiletq IS NULL OR toiletq = '' 
    OR elecq IS NULL OR elecq = '' 
    OR cookingq IS NULL OR cookingq = '' 
    OR hwork IS NULL OR hwork = '' 
    OR hchore IS NULL OR hchore = '' 
    OR htask IS NULL OR htask = '' 
    OR credit IS NULL OR credit = '' 
    OR hcare IS NULL OR hcare = '' 
    OR chhealth IS NULL OR chhealth = '' 
    OR chmightdie IS NULL OR chmightdie = '' 
    OR chillness IS NULL OR chillness = '' 
    OR chinjury IS NULL OR chinjury = '' 
    OR chdisability IS NULL OR chdisability = '' 
    OR carehead IS NULL OR carehead = '' 
    OR shhouse1 IS NULL OR shhouse1 = '' 
    OR shhouse2 IS NULL OR shhouse2 = '' 
    OR shhouse3 IS NULL OR shhouse3 = '' 
    OR shenv1 IS NULL OR shenv1 = '' 
    OR shenv2 IS NULL OR shenv2 = '' 
    OR shenv3 IS NULL OR shenv3 = '' 
    OR numante IS NULL OR numante = '' 
    OR delivery IS NULL OR delivery = '' 
    OR tetanus IS NULL OR tetanus = '' 
    OR bcg IS NULL OR bcg = '' 
    OR measles IS NULL OR measles = '' 
    OR polio IS NULL OR polio = '' 
    OR dpt IS NULL OR dpt = '' 
    OR hib IS NULL OR hib = '' 
    OR wi IS NULL OR wi = '' 
    OR hq IS NULL OR hq = '' 
    OR sv IS NULL OR sv = ''
	OR foodsec IS NULL OR foodsec = '';

	select*
	from [dbo].[Ethiopia]


--Change Values
--update neccessary columns names 

--chsex
UPDATE [dbo].[India]
SET chsex = CASE 
    WHEN chsex = '1' THEN 'Male' 
    WHEN chsex = '2' THEN 'Female'
    ELSE chsex
END;
--chsex
UPDATE [dbo].[Ethiopia]
SET chsex = CASE 
    WHEN chsex = '1' THEN 'Male' 
    WHEN chsex = '2' THEN 'Female'
    ELSE chsex
END;
--underweight
UPDATE [dbo].[India]
SET underweight = 
    CASE 
        WHEN underweight = '0' THEN 'not underweight'
        WHEN underweight = '1' THEN 'moderately underweight'
        WHEN underweight = '2' THEN 'severely underweight'
        ELSE underweight  -- This retains any values not specified in the CASE
    END;
	UPDATE [dbo].[Ethiopia]
SET underweight = 
    CASE 
        WHEN underweight = '0' THEN 'not underweight'
        WHEN underweight = '1' THEN 'moderately underweight'
        WHEN underweight = '2' THEN 'severely underweight'
        ELSE underweight  -- This retains any values not specified in the CASE
    END;
--stunting
UPDATE [dbo].[India]
SET stunting = 
    CASE 
        WHEN stunting = '0' THEN 'not stunted'
        WHEN stunting = '1' THEN 'moderately stunted'
        WHEN stunting = '2' THEN 'severely stunted'
        ELSE stunting  -- This retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET stunting = 
    CASE 
        WHEN stunting = '0' THEN 'not stunted'
        WHEN stunting = '1' THEN 'moderately stunted'
        WHEN stunting = '2' THEN 'severely stunted'
        ELSE stunting  -- This retains any values not specified in the CASE
    END;

--thinness
UPDATE [dbo].[India]
SET thinness = 
    CASE 
        WHEN thinness = '0' THEN 'not thin'
        WHEN thinness = '1' THEN 'moderately thin'
        WHEN thinness = '2' THEN 'severely thin'
        ELSE thinness  -- This retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET thinness = 
    CASE 
        WHEN thinness = '0' THEN 'not thin'
        WHEN thinness = '1' THEN 'moderately thin'
        WHEN thinness = '2' THEN 'severely thin'
        ELSE thinness  -- This retains any values not specified in the CASE
    END;
--dadedu
UPDATE [dbo].[India]
SET dadedu = 
    CASE 
        WHEN dadedu = '0' THEN 'None'
        WHEN dadedu = '1' THEN 'Grade 1'
        WHEN dadedu = '2' THEN 'Grade 2'
        WHEN dadedu = '3' THEN 'Grade 3'
        WHEN dadedu = '4' THEN 'Grade 4'
        WHEN dadedu = '5' THEN 'Grade 5'
        WHEN dadedu = '6' THEN 'Grade 6'
        WHEN dadedu = '7' THEN 'Grade 7'
        WHEN dadedu = '8' THEN 'Grade 8'
        WHEN dadedu = '9' THEN 'Grade 9'
        WHEN dadedu = '10' THEN 'Grade 10'
        WHEN dadedu = '11' THEN 'Grade 11'
        WHEN dadedu = '12' THEN 'Grade 12'
        WHEN dadedu = '13' THEN 'Vocational, technical college'
        WHEN dadedu = '14' THEN 'University'
        WHEN dadedu ='15' THEN 'Masters, doctorate'
        WHEN dadedu = '28' THEN 'Adult literacy'
        WHEN dadedu = '29' THEN 'Religious education'
        WHEN dadedu = '30' THEN 'Other'
        ELSE dadedu  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET dadedu = 
    CASE 
        WHEN dadedu = '0' THEN 'None'
        WHEN dadedu = '1' THEN 'Grade 1'
        WHEN dadedu = '2' THEN 'Grade 2'
        WHEN dadedu = '3' THEN 'Grade 3'
        WHEN dadedu = '4' THEN 'Grade 4'
        WHEN dadedu = '5' THEN 'Grade 5'
        WHEN dadedu = '6' THEN 'Grade 6'
        WHEN dadedu = '7' THEN 'Grade 7'
        WHEN dadedu = '8' THEN 'Grade 8'
        WHEN dadedu = '9' THEN 'Grade 9'
        WHEN dadedu = '10' THEN 'Grade 10'
        WHEN dadedu = '11' THEN 'Grade 11'
        WHEN dadedu = '12' THEN 'Grade 12'
        WHEN dadedu = '13' THEN 'Post-secondary, vocational'
        WHEN dadedu = '14' THEN 'University'
        WHEN dadedu = '15' THEN 'Masters, doctorate'
        WHEN dadedu = '28' THEN 'Adult literacy'
        WHEN dadedu = '29' THEN 'Religious education'
        WHEN dadedu = '30' THEN 'Other'
        ELSE dadedu  -- Retains any values not specified in the CASE
    END;
--momedu
UPDATE [dbo].[India]
SET momedu = 
    CASE 
        WHEN momedu = '0' THEN 'None'
        WHEN momedu = '1' THEN 'Grade 1'
        WHEN momedu = '2' THEN 'Grade 2'
        WHEN momedu = '3' THEN 'Grade 3'
        WHEN momedu = '4' THEN 'Grade 4'
        WHEN momedu = '5' THEN 'Grade 5'
        WHEN momedu = '6' THEN 'Grade 6'
        WHEN momedu = '7' THEN 'Grade 7'
        WHEN momedu = '8' THEN 'Grade 8'
        WHEN momedu = '9' THEN 'Grade 9'
        WHEN momedu = '10' THEN 'Grade 10'
        WHEN momedu = '11' THEN 'Grade 11'       
        ELSE momedu  -- Retains any values not specified in the CASE
    END;
	UPDATE [dbo].[Ethiopia]
SET momedu = 
    CASE 
        WHEN momedu = '0' THEN 'None'
        WHEN momedu = '1' THEN 'Grade 1'
        WHEN momedu = '2' THEN 'Grade 2'
        WHEN momedu = '3' THEN 'Grade 3'
        WHEN momedu = '4' THEN 'Grade 4'
        WHEN momedu = '5' THEN 'Grade 5'
        WHEN momedu = '6' THEN 'Grade 6'
        WHEN momedu = '7' THEN 'Grade 7'
        WHEN momedu = '8' THEN 'Grade 8'
        WHEN momedu = '9' THEN 'Grade 9'
        WHEN momedu = '10' THEN 'Grade 10'
        WHEN momedu = '11' THEN 'Grade 11'
        WHEN momedu = '12' THEN 'Grade 12'
        WHEN momedu = '13' THEN 'Post-secondary, vocational'
        WHEN momedu = '14' THEN 'University'
        WHEN momedu = '15' THEN 'Masters, doctorate'
        WHEN momedu = '28' THEN 'Adult literacy'
        WHEN momedu = '29' THEN 'Religious education'
        WHEN momedu = '30' THEN 'Other'
        ELSE momedu  -- Retains any values not specified in the CASE
    END;
--caredu
UPDATE [dbo].[India]
SET caredu = 
    CASE 
        WHEN caredu = '0' THEN 'None'
        WHEN caredu = '1' THEN 'Grade 1'
        WHEN caredu = '2' THEN 'Grade 2'
        WHEN caredu = '3' THEN 'Grade 3'
        WHEN caredu = '4' THEN 'Grade 4'
        WHEN caredu = '5' THEN 'Grade 5'
        WHEN caredu = '6' THEN 'Grade 6'
        WHEN caredu = '7' THEN 'Grade 7'
        WHEN caredu = '8' THEN 'Grade 8'
        WHEN caredu = '9' THEN 'Grade 9'
        WHEN caredu = '10' THEN 'Grade 10'
        WHEN caredu = '11' THEN 'Grade 11'
        WHEN caredu = '12' THEN 'Grade 12'
        WHEN caredu = '13' THEN 'Vocational, technical college'
        WHEN caredu = '14' THEN 'University'
        WHEN caredu = '15' THEN 'Masters, doctorate'
        WHEN caredu = '28' THEN 'Adult literacy'
        WHEN caredu = '29' THEN 'Religious education'
        WHEN caredu = '30' THEN 'Other'
        ELSE caredu  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET caredu = 
    CASE 
        WHEN caredu = '0' THEN 'None'
        WHEN caredu = '1' THEN 'Grade 1'
        WHEN caredu = '2' THEN 'Grade 2'
        WHEN caredu = '3' THEN 'Grade 3'
        WHEN caredu = '4' THEN 'Grade 4'
        WHEN caredu = '5' THEN 'Grade 5'
        WHEN caredu = '6' THEN 'Grade 6'
        WHEN caredu = '7' THEN 'Grade 7'
        WHEN caredu = '8' THEN 'Grade 8'
        WHEN caredu = '9' THEN 'Grade 9'
        WHEN caredu = '10' THEN 'Grade 10'
        WHEN caredu = '11' THEN 'Grade 11'
        WHEN caredu = '12' THEN 'Grade 12'
        WHEN caredu = '13' THEN 'Post-secondary, vocational'
        WHEN caredu = '14' THEN 'University'
        WHEN caredu = '15' THEN 'Masters, doctorate'
        WHEN caredu = '28' THEN 'Adult literacy'
        WHEN caredu = '29' THEN 'Religious education'
        WHEN caredu = '30' THEN 'Other'
        ELSE caredu  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET caredu = 
    CASE 
        WHEN caredu = '0' THEN 'None'
        WHEN caredu = '1' THEN 'Grade 1'
        WHEN caredu = '2' THEN 'Grade 2'
        WHEN caredu = '3' THEN 'Grade 3'
        WHEN caredu = '4' THEN 'Grade 4'
        WHEN caredu = '5' THEN 'Grade 5'
        WHEN caredu = '6' THEN 'Grade 6'
        WHEN caredu = '7' THEN 'Grade 7'
        WHEN caredu = '8' THEN 'Grade 8'
        WHEN caredu = '9' THEN 'Grade 9'
        WHEN caredu = '10' THEN 'Grade 10'
        WHEN caredu = '11' THEN 'Grade 11'
        WHEN caredu = '12' THEN 'Grade 12'
        WHEN caredu = '13' THEN 'Post-secondary, vocational'
        WHEN caredu = '14' THEN 'University'
        WHEN caredu = '15' THEN 'Masters, doctorate'
        WHEN caredu = '28' THEN 'Adult literacy'
        WHEN caredu = '29' THEN 'Religious education'
        WHEN caredu = '30' THEN 'Other'
        ELSE caredu  -- Retains any values not specified in the CASE
    END;

UPDATE [dbo].[India]
SET headedu = 
    CASE 
        WHEN headedu = '0' THEN 'None'
        WHEN headedu = '1' THEN 'Grade 1'
        WHEN headedu = '2' THEN 'Grade 2'
        WHEN headedu = '3' THEN 'Grade 3'
        WHEN headedu = '4' THEN 'Grade 4'
        WHEN headedu = '5' THEN 'Grade 5'
        WHEN headedu = '6' THEN 'Grade 6'
        WHEN headedu = '7' THEN 'Grade 7'
        WHEN headedu = '8' THEN 'Grade 8'
        WHEN headedu = '9' THEN 'Grade 9'
        WHEN headedu = '10' THEN 'Grade 10'
        WHEN headedu = '11' THEN 'Grade 11'
        WHEN headedu = '12' THEN 'Grade 12'
        WHEN headedu = '13' THEN 'Vocational, technical college'
        WHEN headedu = '14' THEN 'University'
        WHEN headedu = '15' THEN 'Masters, doctorate'
        WHEN headedu = '28' THEN 'Adult literacy'
        WHEN headedu = '29' THEN 'Religious education'
        WHEN headedu = '30' THEN 'Other'
        ELSE headedu  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET headedu = 
    CASE 
        WHEN headedu = '0' THEN 'None'
        WHEN headedu = '1' THEN 'Grade 1'
        WHEN headedu = '2' THEN 'Grade 2'
        WHEN headedu = '3' THEN 'Grade 3'
        WHEN headedu = '4' THEN 'Grade 4'
        WHEN headedu = '5' THEN 'Grade 5'
        WHEN headedu = '6' THEN 'Grade 6'
        WHEN headedu = '7' THEN 'Grade 7'
        WHEN headedu = '8' THEN 'Grade 8'
        WHEN headedu = '9' THEN 'Grade 9'
        WHEN headedu = '10' THEN 'Grade 10'
        WHEN headedu = '11' THEN 'Grade 11'
        WHEN headedu = '12' THEN 'Grade 12'
        WHEN headedu = '13' THEN 'Vocational, technical college'
        WHEN headedu = '14' THEN 'University'
        WHEN headedu = '15' THEN 'Masters, doctorate'
        WHEN headedu = '28' THEN 'Adult literacy'
        WHEN headedu = '29' THEN 'Religious education'
        WHEN headedu = '30' THEN 'Other'
        ELSE headedu  -- Retains any values not specified in the CASE
    END;
--enrol
UPDATE [dbo].[India]
SET enrol = 
    CASE 
        WHEN enrol = '0' THEN 'no'
        WHEN enrol = '1' THEN 'yes'
        WHEN enrol = '99' THEN 'missing'
        WHEN enrol = '77' THEN 'nk'
        WHEN enrol = '88' THEN 'n/a'
        ELSE enrol  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET enrol = 
    CASE 
        WHEN enrol = '0' THEN 'no'
        WHEN enrol = '1' THEN 'yes'
        WHEN enrol = '99' THEN 'missing'
        WHEN enrol = '77' THEN 'nk'
        WHEN enrol = '88' THEN 'n/a'
        ELSE enrol  -- Retains any values not specified in the CASE
    END;
--engrade
UPDATE [dbo].[India]
SET engrade = 
    CASE 
        WHEN engrade = '0' THEN 'None'
        WHEN engrade = '1' THEN 'Grade 01'
        WHEN engrade = '2' THEN 'Grade 02'
        WHEN engrade = '3' THEN 'Grade 03'
        WHEN engrade = '4' THEN 'Grade 04'
        WHEN engrade = '5' THEN 'Grade 05'
        WHEN engrade = '6' THEN 'Grade 06'
        WHEN engrade = '7' THEN 'Grade 07'
        WHEN engrade = '8' THEN 'Grade 08'
        WHEN engrade = '9' THEN 'Grade 09'
        WHEN engrade = '10' THEN 'Grade 10'
        WHEN engrade = '11' THEN 'Grade 11'
        WHEN engrade = '12' THEN 'Grade 12'
        WHEN engrade = '13' THEN 'Post-secondary / technological institute'
        WHEN engrade = '14' THEN 'Vocational'
        WHEN engrade = '15' THEN 'University degree (graduate)'
        WHEN engrade = '16' THEN 'University degree (postgraduate)'
        WHEN engrade = '100' THEN 'Pre-primary'
        WHEN engrade = '28' THEN 'Adult literacy'
        WHEN engrade = '29' THEN 'Religious education'
        WHEN engrade = '77' THEN 'NK'
        ELSE engrade  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET engrade = 
    CASE 
        WHEN engrade = '0' THEN 'None'
        WHEN engrade = '1' THEN 'Grade 01'
        WHEN engrade = '2' THEN 'Grade 02'
        WHEN engrade = '3' THEN 'Grade 03'
        WHEN engrade = '4' THEN 'Grade 04'
        WHEN engrade = '5' THEN 'Grade 05'
        WHEN engrade = '6' THEN 'Grade 06'
        WHEN engrade = '7' THEN 'Grade 07'
        WHEN engrade = '8' THEN 'Grade 08'
        WHEN engrade = '9' THEN 'Grade 09'
        WHEN engrade = '10' THEN 'Grade 10'
        WHEN engrade = '11' THEN 'Grade 11'
        WHEN engrade = '12' THEN 'Grade 12'
        WHEN engrade = '13' THEN 'Post-secondary / technological institute'
        WHEN engrade = '14' THEN 'Vocational'
        WHEN engrade = '15' THEN 'University degree (graduate)'
        WHEN engrade = '16' THEN 'University degree (postgraduate)'
        WHEN engrade = '100' THEN 'Pre-primary'
        WHEN engrade = '28' THEN 'Adult literacy'
        WHEN engrade = '29' THEN 'Religious education'
        WHEN engrade = '77' THEN 'NK'
        ELSE engrade  -- Retains any values not specified in the CASE
    END;
--levlread
UPDATE [dbo].[India]
SET levlread = 
    CASE 
        WHEN levlread = '1' THEN 'can''t read anything'
        WHEN levlread = '2' THEN 'reads letters'
        WHEN levlread = '3' THEN 'reads words'
        WHEN levlread = '4' THEN 'reads sentences'
        ELSE levlread  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET levlread = 
    CASE 
        WHEN levlread = '1' THEN 'can''t read anything'
        WHEN levlread = '2' THEN 'reads letters'
        WHEN levlread = '3' THEN 'reads words'
        WHEN levlread = '4' THEN 'reads sentences'
        ELSE levlread  -- Retains any values not specified in the CASE
    END;
--literate
UPDATE [dbo].[India]
SET literate = 
    CASE 
        WHEN literate = '0' THEN 'no'
        WHEN literate = '1' THEN 'yes'
        ELSE literate  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET literate = 
    CASE 
        WHEN literate = '0' THEN 'no'
        WHEN literate = '1' THEN 'yes'
        ELSE literate  -- Retains any values not specified in the CASE
    END;
--typsite
UPDATE [dbo].[India]
SET typesite = 
    CASE 
        WHEN typesite = '1' THEN 'urban'
        WHEN typesite = '2' THEN 'rural'
        WHEN typesite = '77' THEN 'Not known'
        ELSE typesite  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET typesite = 
    CASE 
        WHEN typesite = '1' THEN 'urban'
        WHEN typesite = '2' THEN 'rural'        
        ELSE typesite  -- Retains any values not specified in the CASE
    END;
--ownhouse
UPDATE [dbo].[India]
SET ownhouse = 
    CASE 
        WHEN ownhouse = '0'THEN 'no'
        WHEN ownhouse = '1'THEN 'yes'
        ELSE ownhouse  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET ownhouse = 
    CASE 
        WHEN ownhouse = '0' THEN 'no'
        WHEN ownhouse = '1' THEN 'yes'
        ELSE ownhouse  -- Retains any values not specified in the CASE
    END;
--ownlandhse
UPDATE [dbo].[India]
SET ownlandhse = 
    CASE 
        WHEN ownlandhse = '0' THEN 'no'
        WHEN ownlandhse = '1'THEN 'yes'
        ELSE ownlandhse  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET ownlandhse = 
    CASE 
        WHEN ownlandhse = '0' THEN 'no'
        WHEN ownlandhse = '1' THEN 'yes'
        ELSE ownlandhse  -- Retains any values not specified in the CASE
    END;
--drwaterq
UPDATE [dbo].[India]
SET drwaterq = 
    CASE 
        WHEN drwaterq = '0' THEN 'no'
        WHEN drwaterq = '1' THEN 'yes'
        ELSE drwaterq  -- Retains any values not specified in the CASE
    END;
	UPDATE [dbo].[Ethiopia]
SET drwaterq = 
    CASE 
        WHEN drwaterq = '0' THEN 'no'
        WHEN drwaterq = '1' THEN 'yes'
        ELSE drwaterq  -- Retains any values not specified in the CASE
    END;
--toiletq
UPDATE [dbo].[India]
SET toiletq = 
    CASE 
        WHEN toiletq = '0' THEN 'no'
        WHEN toiletq = '1' THEN 'yes'
        ELSE toiletq  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET toiletq = 
    CASE 
        WHEN toiletq = '0' THEN 'no'
        WHEN toiletq = '1' THEN 'yes'
        ELSE toiletq  -- Retains any values not specified in the CASE
    END;
--elecq
UPDATE [dbo].[India]
SET elecq = 
    CASE 
        WHEN elecq = '0'THEN 'no'
        WHEN elecq = '1' THEN 'yes'
        ELSE elecq  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET elecq = 
    CASE 
        WHEN elecq = '0' THEN 'no'
        WHEN elecq = '1' THEN 'yes'
        ELSE elecq  -- Retains any values not specified in the CASE
    END;

--cookingq
UPDATE [dbo].[India]
SET cookingq = 
    CASE 
        WHEN cookingq = '0' THEN 'no'
        WHEN cookingq = '1' THEN 'yes'
        ELSE cookingq  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET cookingq = 
    CASE 
        WHEN cookingq = '0' THEN 'no'
        WHEN cookingq = '1' THEN 'yes'
        ELSE cookingq  -- Retains any values not specified in the CASE
    END;
--credit
UPDATE [dbo].[India]
SET credit = 
    CASE 
        WHEN credit = '0' THEN 'no'
        WHEN credit = '1' THEN 'yes'
        ELSE credit  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET credit = 
    CASE 
        WHEN credit = '0' THEN 'no'
        WHEN credit = '1' THEN 'yes'
        ELSE credit  -- Retains any values not specified in the CASE
    END;
--chhealth
UPDATE [dbo].[India]
SET chhealth = 
    CASE 
        WHEN chhealth = '1' THEN 'very poor'
        WHEN chhealth = '2' THEN 'poor'
        WHEN chhealth = '3' THEN 'average'
        WHEN chhealth = '4' THEN 'good'
        WHEN chhealth = '5' THEN 'very good'
        ELSE chhealth  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET chhealth = 
    CASE 
        WHEN chhealth = '1' THEN 'very poor'
        WHEN chhealth = '2' THEN 'poor'
        WHEN chhealth = '3' THEN 'average'
        WHEN chhealth = '4' THEN 'good'
        WHEN chhealth = '5' THEN 'very good'
        ELSE chhealth  -- Retains any values not specified in the CASE
    END;
--chmightdie,chillness,chinjury,chdisability
UPDATE [dbo].[India]
SET chmightdie = CASE 
        WHEN chmightdie = '0' THEN 'no'
        WHEN chmightdie= '1' THEN 'yes'
        ELSE chmightdie  -- Retains any values not specified in the CASE
    END,
    chillness = CASE 
        WHEN chillness  = '0' THEN 'no'
        WHEN chillness  = '1'THEN 'yes'
        ELSE chillness
    END,
    chinjury = CASE 
        WHEN chinjury= '0'THEN 'no'
        WHEN chinjury = '1' THEN 'yes'
        ELSE chinjury
    END,
    chdisability = CASE 
        WHEN chdisability = '0' THEN 'no'
        WHEN chdisability = '1' THEN 'yes'
        ELSE chdisability
    END;

UPDATE [dbo].[Ethiopia]
SET chmightdie = CASE 
        WHEN chmightdie = '0' THEN 'no'
        WHEN chmightdie= '1' THEN 'yes'
        ELSE chmightdie  -- Retains any values not specified in the CASE
    END,
    chillness = CASE 
        WHEN chillness  = '0' THEN 'no'
        WHEN chillness  = '1' THEN 'yes'
        ELSE chillness
    END,
    chinjury = CASE 
        WHEN chinjury= '0.'THEN 'no'
        WHEN chinjury = '1' THEN 'yes'
        ELSE chinjury
    END,
    chdisability = CASE 
        WHEN chdisability = '0' THEN 'no'
        WHEN chdisability = '1' THEN 'yes'
        ELSE chdisability
    END;

--carehead
UPDATE [dbo].[India]
SET carehead = CASE 
        WHEN carehead = '1' THEN 'Caregiver is household head'
        WHEN carehead = '2'THEN 'Caregiver is partner of household head'
        WHEN carehead = '3' THEN 'Other'
        ELSE carehead  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET carehead = CASE 
        WHEN carehead = '1' THEN 'Caregiver is household head'
        WHEN carehead = '2' THEN 'Caregiver is partner of household head'
        WHEN carehead = '3' THEN 'Other'
        ELSE carehead  -- Retains any values not specified in the CASE
    END;
--shhouse1,shhouse2,shhouse3
UPDATE [dbo].[India]
SET 
    shhouse1 = CASE 
        WHEN shhouse1 = '0' THEN 'no'
        WHEN shhouse1 = '1' THEN 'yes'
        ELSE shhouse1  -- Retains any values not specified in the CASE
    END,
    shhouse2 = CASE 
        WHEN shhouse2 = '0' THEN 'no'
        WHEN shhouse2 = '1' THEN 'yes'
        ELSE shhouse2  -- Retains any values not specified in the CASE
    END,
    shhouse3 = CASE 
        WHEN shhouse3 = '0' THEN 'no'
        WHEN shhouse3 = '1' THEN 'yes'
        ELSE shhouse3  -- Retains any values not specified in the CASE
    END;
UPDATE [dbo].[Ethiopia]
SET 
    shhouse1 = CASE 
        WHEN shhouse1 = '0' THEN 'no'
        WHEN shhouse1 ='1' THEN 'yes'
        ELSE shhouse1  -- Retains any values not specified in the CASE
    END,
    shhouse2 = CASE 
        WHEN shhouse2 = '0' THEN 'no'
        WHEN shhouse2 = '1' THEN 'yes'
        ELSE shhouse2  -- Retains any values not specified in the CASE
    END,
    shhouse3 = CASE 
        WHEN shhouse3 = '0' THEN 'no'
        WHEN shhouse3 = '1' THEN 'yes'
        ELSE shhouse3  -- Retains any values not specified in the CASE
    END;
--shenv1,shenv2,shenv3
UPDATE [dbo].[India]
SET 
    shenv1 = CASE 
        WHEN shenv1 = '0' THEN 'no'
        WHEN shenv1 = '1' THEN 'yes'
        ELSE shenv1  -- Retains any values not specified in the CASE
    END,
    shenv2 = CASE 
        WHEN shenv2 = '0' THEN 'no'
        WHEN shenv2 = '1' THEN 'yes'
        ELSE shenv2
    END,
    shenv3 = CASE 
        WHEN shenv3 = '0' THEN 'no'
        WHEN shenv3 = '1' THEN 'yes'
        ELSE shenv3
    END;
UPDATE [dbo].[Ethiopia]
SET 
    shenv1 = CASE 
        WHEN shenv1 = '0' THEN 'no'
        WHEN shenv1 = '1' THEN 'yes'
        ELSE shenv1
    END,
    shenv2 = CASE 
        WHEN shenv2 = '0'THEN 'no'
        WHEN shenv2 = '1' THEN 'yes'
        ELSE shenv2
    END,
    shenv3 = CASE 
        WHEN shenv3 = '0' THEN 'no'
        WHEN shenv3 = '1' THEN 'yes'
        ELSE shenv3
    END;
--numante
UPDATE [dbo].[India]
SET numante = CASE 
    WHEN numante = '88' THEN 'NA'
    WHEN numante = '99' THEN 'NK'
    ELSE numante  -- Retains any values not specified in the CASE
END;
UPDATE [dbo].[Ethiopia]
SET numante = CASE 
    WHEN numante = '88' THEN 'NA'
    WHEN numante = '99' THEN 'NK'
    ELSE numante  -- Retains any values not specified in the CASE
END;
--delivery,tetanus,bcg,measles,polio,dpt,hib
UPDATE [dbo].[India]
SET 
    delivery = CASE 
        WHEN delivery = '0' THEN 'no'
        WHEN delivery = '1' THEN 'yes'
        ELSE delivery  -- Retains any values not specified in the CASE
    END,
    tetanus = CASE 
        WHEN tetanus = '0' THEN 'no'
        WHEN tetanus = '1' THEN 'yes'
        ELSE tetanus
    END,
    bcg = CASE 
        WHEN bcg = '0' THEN 'no'
        WHEN bcg = '1' THEN 'yes'
        ELSE bcg
    END,
    measles = CASE 
        WHEN measles = '0' THEN 'no'
        WHEN measles = '1' THEN 'yes'
        ELSE measles
    END,
    polio = CASE 
        WHEN polio = '0' THEN 'no'
        WHEN polio = '1' THEN 'yes'
        ELSE polio
    END,
    dpt = CASE 
        WHEN dpt = '0' THEN 'no'
        WHEN dpt = '1' THEN 'yes'
        ELSE dpt
    END,
    hib = CASE 
        WHEN hib = '0' THEN 'no'
        WHEN hib = '1' THEN 'yes'
        ELSE hib
    END;
UPDATE [dbo].[Ethiopia]
SET 
    delivery = CASE 
        WHEN delivery = '0' THEN 'no'
        WHEN delivery = '1' THEN 'yes'
        ELSE delivery
    END,
    tetanus = CASE 
        WHEN tetanus = '0' THEN 'no'
        WHEN tetanus = '1' THEN 'yes'
        ELSE tetanus
    END,
    bcg = CASE 
        WHEN bcg = '0' THEN 'no'
        WHEN bcg = '1' THEN 'yes'
        ELSE bcg
    END,
    measles = CASE 
        WHEN measles = '0' THEN 'no'
        WHEN measles = '1' THEN 'yes'
        ELSE measles
    END,
    polio = CASE 
        WHEN polio = '0' THEN 'no'
        WHEN polio = '1' THEN 'yes'
        ELSE polio
    END,
    dpt = CASE 
        WHEN dpt = '0' THEN 'no'
        WHEN dpt = '1' THEN 'yes'
        ELSE dpt
    END,
    hib = CASE 
        WHEN hib = '0' THEN 'no'
        WHEN hib = '1' THEN 'yes'
        ELSE hib
    END;
--region
UPDATE [dbo].[India]
SET region = CASE 
    WHEN region = '24' THEN 'Others'
    WHEN region = '23' THEN 'Telangana'
    WHEN region = '77' THEN 'Not Known'
    WHEN region = '22' THEN 'Rayalaseema'
    WHEN region = '21' THEN 'Coastal Andhra'
    ELSE region
END;

UPDATE [dbo].[Ethiopia]
SET region = CASE 
    WHEN region = '1' THEN 'Tigray'
    WHEN region = '2' THEN 'Afar'
    WHEN region = '3' THEN 'Amhara'
	WHEN region = '4' THEN 'Oromiya'
	WHEN region = '5' THEN 'Somali'
	WHEN region = '6' THEN 'Benshangul Gumz'
	WHEN region = '7' THEN 'SNNP'
	WHEN region = '12' THEN 'Gambela'
	WHEN region = '13' THEN 'Harari'
	WHEN region = '14' THEN 'Addis Ababa City Administration'
    WHEN region = '15' THEN 'Dire Dawa City Administration'
    ELSE region
END;
--foodsec
UPDATE [dbo].[India]
SET foodsec = CASE 
    WHEN foodsec = '1' THEN 'We always eat enough of what we want' 
    WHEN foodsec = '2' THEN 'We eat enough but not always what we would like'
    WHEN foodsec = '3' THEN 'We sometimes do not eat enough'
    WHEN foodsec = '4' THEN 'We frequently do not eat enough'
    ELSE foodsec
END;

UPDATE [dbo].[Ethiopia]
SET foodsec = CASE 
    WHEN foodsec = '1' THEN 'We always eat enough of what we want' 
    WHEN foodsec = '2' THEN 'We eat enough but not always what we would like'
    WHEN foodsec = '3' THEN 'We sometimes do not eat enough'
    WHEN foodsec = '4' THEN 'We frequently do not eat enough'
    ELSE foodsec
END;
SELECT TOP 10 *
FROM [dbo].[India];

SELECT TOP 10 *
FROM [dbo].[Ethiopia];
--Create Views
--1.View for food security and child growth metrics
CREATE VIEW FoodSecurityChildGrowth AS
   SELECT
       country,
	   childid,
	   chsex,
	   agemon,
	   region,
       foodsec,
       chweight,
       chheight,
       bmi,
       underweight,
       stunting,
       thinness
   FROM
       (SELECT 'India' AS  country,childid,chsex,agemon, region,foodsec, chweight, chheight, bmi, underweight, stunting, thinness FROM [dbo].[India]
        UNION ALL
        SELECT 'Ethiopia' AS country, childid,chsex,agemon,region,foodsec, chweight, chheight, bmi, underweight, stunting, thinness FROM [dbo].[Ethiopia]) AS CombinedData;
   
--2.View for Parental Education and Child Education
CREATE VIEW ParentalChildEducation AS
   SELECT
       childid,
       country,
       dadedu,
       momedu,
       caredu,
       headedu,
       enrol,
       engrade,
       hschool,
       timesch,
       levlread,
       levlwrit,
       literate
   FROM
       (SELECT 'India' AS childid,country, dadedu, momedu, caredu, headedu, enrol, engrade, hschool, timesch, levlread, levlwrit, literate FROM [dbo].[India]
        UNION ALL
        SELECT 'Ethiopia' AS childid,country, dadedu, momedu, caredu, headedu, enrol, engrade, hschool, timesch, levlread, levlwrit, literate FROM [dbo].[Ethiopia]) AS CombinedData;
 
--3.View for Urban-Rural Household Size
-- Corrected View for Urban-Rural Household Size
CREATE VIEW UrbanRuralHouseholdSize AS
SELECT
    country,
    agemon,
    typesite,
    hhsize,
    ownhouse,
    ownlandhse,
    region
FROM
    (SELECT 
	    country,
        agemon,   -- agemon should come first
        typesite, 
        hhsize, 
        ownhouse, 
        ownlandhse, 
        region
     FROM 
        [dbo].[India]
    UNION ALL
    SELECT 
	    country,
        agemon,  -- agemon should come first in Ethiopia as well
        typesite, 
        hhsize, 
        ownhouse, 
        ownlandhse, 
        region
    FROM 
        [dbo].[Ethiopia]) AS CombinedData;


--4.Create view forHealthcare Access and Child Health Outcomes 
CREATE VIEW Healthcare_access AS
SELECT 
    childid,
	country,
    chsex,
    typesite,
    region,
    numante,  -- Number of antenatal visits
    delivery, tetanus, bcg, measles, polio, dpt, hib,  -- Immunizations
    chhealth, chillness, chinjury, chdisability,  -- Child health metrics
    dadedu, momedu, caredu  -- Parental/Caregiver education levels
FROM 
    [dbo].[India] 
UNION ALL
SELECT 
    childid,
	country,
    chsex,
    typesite,
    region,
    numante,
    delivery, tetanus, bcg, measles, polio, dpt, hib,
    chhealth, chillness, chinjury, chdisability,
    dadedu, momedu, caredu
FROM 
    [dbo].[Ethiopia];
--5.Malnutrition and Household Economic Factors
CREATE VIEW vw_malnutrition_economics AS
SELECT 
    childid,
	country,
    underweight, stunting, thinness,  -- Child malnutrition indicators
    ownhouse, ownlandhse,  -- Household asset ownership
    drwaterq, toiletq, elecq, cookingq,  -- Household infrastructure access
    region, typesite, hhsize  -- Demographic information
FROM 
    [dbo].[India] 
UNION ALL
SELECT 
    childid,
	country,
    underweight, stunting, thinness,
    ownhouse, ownlandhse,
    drwaterq, toiletq, elecq, cookingq,
    region, typesite, hhsize
FROM 
    [dbo].[Ethiopia];
--6.Child Labor and Access to Education
CREATE VIEW vchild_labor_education AS
SELECT 
    childid,
	country,
    hwork, hchore, htask,  -- Child labor indicators
    enrol, engrade, levlread, literate,  -- Educational outcomes
    typesite, wi, hhsize, region  -- Filters for area, wealth index, household size
FROM 
    [dbo].[India] 
UNION ALL
SELECT 
    childid,
	country,
    hwork, hchore, htask,
    enrol, engrade, levlread, literate,
    typesite, wi, hhsize, region
FROM 
    [dbo].[Ethiopia];
--7.Child Labor and Socioeconomic Status
CREATE VIEW Child_labor_socioeconomic AS
SELECT 
    childid,
	country,
    hwork,          -- Child's involvement in work (yes/no)
    hchore,         -- Household chores (yes/no)
    htask,          -- Task responsibilities (yes/no)
    wi,             -- Wealth index
    dadedu,        -- Father's education level
    momedu,        -- Mother's education level
    caredu,         -- Caregiver's education level
    enrol,          -- Child's enrollment status
    engrade,        -- Current grade in school
    hhsize,         -- Household size
    region,         -- Geographic region
    typesite        -- Urban or rural classification
FROM 
    [dbo].[India] 
UNION ALL
SELECT 
    childid,
	country,
    hwork,
    hchore,
    htask,
    wi,
    dadedu,
    momedu,
    caredu,
    enrol,
    engrade,
    hhsize,
    region,
    typesite
FROM 
    [dbo].[Ethiopia];

