USE tempdb
GO

/*
Use the following SQL to create temp tables and data. 
Write SQL scripts to the questions that follow after each question. The results should match the samples with the question
*/


CREATE TABLE CHILDSTAT(FIRSTNAME VARCHAR(50),GENDER VARCHAR(1),BIRTHDATE SMALLDATETIME,HEIGHT SMALLINT,WEIGHT SMALLINT);
INSERT INTO CHILDSTAT VALUES('ROSEMARY','F','2000-05-08',35,123);     
INSERT INTO CHILDSTAT VALUES('LAUREN','F','2000-06-10',54,876);     
INSERT INTO CHILDSTAT VALUES('ALBERT','M','2000-08-02',45,150);     
INSERT INTO CHILDSTAT VALUES('BUDDY','M','1998-10-02',45,189);   
INSERT INTO CHILDSTAT VALUES('FARQUAR','M','1998-11-05',76,198);     
INSERT INTO CHILDSTAT VALUES('TOMMY','M','1998-12-11',78,167);     
INSERT INTO CHILDSTAT VALUES('SIMON','M','1999-01-03',87,256);
GO

CREATE TABLE CANDYBAR_CONSUMPTION_DATA(CONSUMER_ID INT,CANDYBAR_NAME VARCHAR(50),SURVEY_YEAR INT,GENDER VARCHAR(1),OVERALL_RATING INT,NUMBER_BARS_CONSUMED INT);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(1,'MARS BAR',2009,'M',10,252);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(1,'MARS BAR',2010,'M',10,352);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(1,'MARS BAR',2011,'M',10,452);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(1,'TWIX BAR',2009,'M',10,6);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(1,'TWIX BAR',2010,'M',7,60);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(1,'TWIX BAR',2011,'M',8,600);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(2,'MARS BAR',2009,'F',8,25);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(2,'MARS BAR',2010,'F',8,12);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(2,'MARS BAR',2011,'F',8,13);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(2,'HERSHEY BAR',2009,'F',5,2);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(2,'HERSHEY BAR',2010,'F',5,3);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(2,'HERSHEY BAR',2011,'F',5,1);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(3,'TWIX BAR',2009,'M',7,6);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(3,'TWIX BAR',2010,'M',8,60);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(3,'TWIX BAR',2011,'M',9,600);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(3,'MARS BAR',2009,'M',8,25);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(3,'MARS BAR',2010,'M',7,12);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(3,'MARS BAR',2011,'M',8,13);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(4,'HERSHEY BAR',2009,'F',7,20);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(4,'HERSHEY BAR',2010,'F',7,30);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(4,'HERSHEY BAR',2011,'F',7,10);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(4,'TWIX BAR',2009,'F',7,20);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(4,'TWIX BAR',2010,'F',7,30);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(4,'TWIX BAR',2011,'F',7,10);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(4,'MARS BAR',2009,'F',7,25);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(4,'MARS BAR',2010,'F',7,35);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(4,'MARS BAR',2011,'F',7,15);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(5,'SNICKERS BAR',2009,'M',8,55);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(5,'SNICKERS BAR',2010,'M',8,65);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(5,'SNICKERS BAR',2011,'M',8,75);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(5,'TWIX BAR',2009,'M',9,75);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(5,'TWIX BAR',2010,'M',9,85);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(5,'TWIX BAR',2011,'M',9,95);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(5,'HERSHEY BAR',2009,'M',8,15);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(5,'HERSHEY BAR',2010,'M',8,15);
INSERT INTO CANDYBAR_CONSUMPTION_DATA VALUES(5,'HERSHEY BAR',2011,'M',6,5);
GO

CREATE TABLE NUMBERS(NUM INT);
INSERT INTO NUMBERS VALUES(4);
INSERT INTO NUMBERS VALUES(3);
INSERT INTO NUMBERS VALUES(2);
INSERT INTO NUMBERS VALUES(1);
GO

CREATE TABLE FAMILY(CHILD_KEY VARCHAR(50) NOT NULL,PARENT_KEY VARCHAR(50));
INSERT INTO FAMILY VALUES('GRANDPARENTS',NULL);
INSERT INTO FAMILY VALUES('PARENTS','GRANDPARENTS');
INSERT INTO FAMILY VALUES('CHILD-1','PARENTS');
INSERT INTO FAMILY VALUES('CHILD-2','PARENTS');
GO

CREATE TABLE COMPANY(EMPLOYEE_ID INT NOT NULL,EMPLOYEE_NAME VARCHAR(10),MANAGER_ID INT,SALARY INT);
INSERT INTO COMPANY VALUES(1,'FRED',NULL,100000);
INSERT INTO COMPANY VALUES(2,'BARNEY',1,50000);
INSERT INTO COMPANY VALUES(3,'WILMA',1,50000);
INSERT INTO COMPANY VALUES(4,'BETTY',3,40000);
INSERT INTO COMPANY VALUES(5,'PEBBLES',3,40000);
INSERT INTO COMPANY VALUES(6,'BAM-BAM',4,20000);
INSERT INTO COMPANY VALUES(7,'DINO',4,20000);
INSERT INTO COMPANY VALUES(8,'HOPPY',4,40000);
GO

CREATE TABLE T_CANDYBAR_DATA(CONSUMER_ID int,
                             CANDYBAR_NAME VARCHAR(50),
                             SURVEY_YEAR int,
                             GENDER VARCHAR(1),
                             STAT_TYPE int,
                             STAT_VALUE int)
INSERT INTO T_CANDYBAR_DATA
 SELECT CONSUMER_ID,CANDYBAR_NAME,SURVEY_YEAR,GENDER,
        1 AS STAT_TYPE,OVERALL_RATING AS STAT_VALUE
  FROM CANDYBAR_CONSUMPTION_DATA
  
INSERT INTO T_CANDYBAR_DATA
 SELECT CONSUMER_ID,CANDYBAR_NAME,SURVEY_YEAR,GENDER,
        2 AS STAT_TYPE,NUMBER_BARS_CONSUMED AS STAT_VALUE
  FROM CANDYBAR_CONSUMPTION_DATA
GO
/*
1. Write a query to list FIRSTNAME, GENDER, BIRTHDATE, HEIGHT, WEIGHT,  row counts within gender and birth year.

FIRSTNAME  GENDER BIRTHDATE  HEIGHT  WEIGHT  CNT_GBY  
---------  ------ ---------  ------  ------  -------
ROSEMARY   F      08-MAY-00  35      123     2           
LAUREN     F      10-JUN-00  54      876     2           
BUDDY      M      02-OCT-98  45      189     3           
FARQUAR    M      05-NOV-98  76      198     3           
TOMMY      M      11-DEC-98  78      167     3           
SIMON      M      03-JAN-99  87      256     1           
ALBERT     M      02-AUG-00  45      150     1 
*/

SELECT A.FIRSTNAME, A.GENDER, A.BIRTHDATE, A.HEIGHT, A.WEIGHT, B.CNT_GBY 

FROM 
(
SELECT FIRSTNAME, GENDER, UPPER(REPLACE(CONVERT(VARCHAR(9), BIRTHDATE, 6), ' ', '-')) as BIRTHDATE, HEIGHT, WEIGHT
FROM CHILDSTAT
) A

JOIN 
(
SELECT GENDER, DATEPART (YY, BIRTHDATE) BIRTHDATE, COUNT(*) AS CNT_GBY
FROM CHILDSTAT
GROUP BY GENDER, DATEPART (YY, BIRTHDATE)) B

ON A.GENDER = B.GENDER
AND DATEPART(YY, A.BIRTHDATE) = B.BIRTHDATE

GROUP BY A.FIRSTNAME, A.GENDER, A.BIRTHDATE, A.HEIGHT, A.WEIGHT, B.CNT_GBY 
ORDER BY GENDER
--

/*
2. Write a query to list FIRSTNAME, WEIGHT, next heaviest weight and previous lightest weight (without considering gender)

FIRSTNAME WEIGHT  LEAD_1_WT  LAG_2_WT  
--------- ------  ---------  --------
ROSEMARY  123     150        -1        
ALBERT    150     167        -1        
TOMMY     167     189        123       
BUDDY     189     198        150       
FARQUAR   198     256        167       
SIMON     256     876        189       
LAUREN    876     -1         198 
*/





/*
3. Write a query to list FIRSTNAME, GENDER, WEIGHT, next heaviest weight and previous lightest weight (considering gender)

FIRSTNAME GENDER WEIGHT  LEAD_1_WT LAG_2_WT
--------- ------ ------  --------- --------
ROSEMARY  F      123     876	   -1      
LAUREN    F      876     -1	   	   -1      
ALBERT    M      150     167	   -1      
TOMMY     M      167     189	   -1      
BUDDY     M      189     198	   150     
FARQUAR   M      198     256	   167     
SIMON     M      256     -1	   	   189
*/



/*
4. Write a query to list FIRSTNAME, GENDER, HEIGHT, WEIGHT and list of all names with same gender (as follows)

FIRSTNAME GENDER HEIGHT  WEIGHT  NAMELIST                             
--------- ------ ------  ------  ------------------------------------
LAUREN    F      54      876     LAUREN, ROSEMARY                       
ROSEMARY  F      35      123     LAUREN, ROSEMARY                       
SIMON     M      87      256     SIMON, FARQUAR, BUDDY, TOMMY, ALBERT   
FARQUAR   M      76      198     SIMON, FARQUAR, BUDDY, TOMMY, ALBERT   
BUDDY     M      45      189     SIMON, FARQUAR, BUDDY, TOMMY, ALBERT   
TOMMY     M      78      167     SIMON, FARQUAR, BUDDY, TOMMY, ALBERT   
ALBERT    M      45      150     SIMON, FARQUAR, BUDDY, TOMMY, ALBERT 
*/

--select  FirstName, GENDER, HEIGHT, WEIGHT
--into #temp1
--from CHILDSTAT
WITH C
as
(
select gender, STRING_AGG (FirstName, ',') as NameList
from CHILDSTAT
group by gender
) 

SELECT FirstName, c.GENDER, HEIGHT, WEIGHT, NameList
from CHILDSTAT b
JOIN C
ON C.Gender = b.gender
/*
5. Write a query to display FIRSTNAME, GENDER, HEIGHT, RANK by gender order by height, 
dense rank by gender order by height

FIRSTNAME GENDER HEIGHT HT_RANK HT_DENSERANK
--------- ------ ------ ------- ------------
ROSEMARY  F      35     1		1           
LAUREN    F      54     2		2           
ALBERT    M      45     1		1           
BUDDY     M      45     1		1           
FARQUAR   M      76     3		2           
TOMMY     M      78     4		3           
SIMON     M      87     5		4
*/

SELECT FIRSTNAME, GENDER, HEIGHT, RANK() OVER ( PARTITION BY GENDER ORDER BY HEIGHT)  AS HT_RANK, DENSE_RANK () OVER ( PARTITION BY GENDER ORDER BY HEIGHT) AS HT_DENSERANK
FROM CHILDSTAT
/*
6. Write a query to display GENDER, FIRSTNAME, WEIGHT, Running weight of current & previous,
running wight of current and all following 

GENDER FIRSTNAME WEIGHT  WT_RUN  WT_RUN2  
------ --------- ------  ------  -------
F      ROSEMARY  123     123     999      
F      LAUREN    876     999     999      
M      ALBERT    150     150     960      
M      TOMMY     167     317     960      
M      BUDDY     189     506     960      
M      FARQUAR   198     704     960      
M      SIMON     256     960     960 
*/

/*
7. Write a query to display FIRSTNAME, GENDER, WEIGHT, average weight using current, previous and next rows

FIRSTNAME GENDER WEIGHT  AVG_3 
--------- ------ ------  -----
ROSEMARY  F      123     499.5 
LAUREN    F      876     499.5 
ALBERT    M      150     158.5 
TOMMY     M      167     168.6 
BUDDY     M      189     184.6 
FARQUAR   M      198     214.3 
SIMON     M      256     227 
*/



/*
8. Write a query to display FIRSTNAME, HEIGHT, rank on the height, percent rank on height

FIRSTNAME HEIGHT  RANK_HEIGHT  PCTDIST_HEIGHT  
--------- ------  -----------  --------------
ROSEMARY  35      1            0               
ALBERT    45      2            0.1667          
BUDDY     45      2            0.1667          
LAUREN    54      4            0.5             
FARQUAR   76      5            0.6667          
TOMMY     78      6            0.8333          
SIMON     87      7            1 
*/


/*
9. Write a query using ROLLUP to display SURVEY_YEAR, CANDYBAR_NAME, GENDER, OVERALL_RATING and TOTAL_BARS_CONSUMED

SURVEY_YEAR CANDYBAR_NAME GENDER OVERALL_RATING TOTAL_BARS_CONSUMED
----------- ------------- ------ -------------- -------------------
2009        HERSHEY BAR   F      5              2                  
2009        HERSHEY BAR   F      7              20                 
2009        HERSHEY BAR   F                     22                 
2009        HERSHEY BAR   M      8              15                 
2009        HERSHEY BAR   M                     15                 
2009        HERSHEY BAR                         37                 
2009        MARS BAR      F      7              25                 
2009        MARS BAR      F      8              25                 
2009        MARS BAR      F                     50                 
2009        MARS BAR      M      8              25                 
2009        MARS BAR      M      10             252                
2009        MARS BAR      M                     277                
2009        MARS BAR                            327                
2009        SNICKERS BAR  M      8              55                 
2009        SNICKERS BAR  M                     55                 
2009        SNICKERS BAR                        55                 
2009        TWIX BAR      F      7              20                 
2009        TWIX BAR      F                     20                 
2009        TWIX BAR      M      7              6                  
2009        TWIX BAR      M      9              75                 
2009        TWIX BAR      M      10             6                  
2009        TWIX BAR      M                     87                 
2009        TWIX BAR                            107                
2009                                            526  
*/


/*
10. Write a query using CUBE to display all combinations of data using SURVEY_YEAR, CANDYBAR_NAME, GENDER and OVERALL_RATING
 
SURVEY_YEAR CANDYBAR_NAME GENDER OVERALL_RATING TOTAL_BARS_CONSUMED 
----------- ------------- ------ -------------- ------------------- 
                                                3174                
                                 5              6                   
                                 6              5                   
                                 7              273                 
                                 8              973                 
                                 9              855                 
                                 10             1062                
                          F                     251                 
                          F      5              6                   
                          F      7              195                 
                          F      8              50                  
                          M                     2923                
                          M      6              5                   
                          M      7              78                  
                          M      8              923                 
                          M      9              855                 
                          M      10             1062                
            MARS BAR                            1231                
            MARS BAR             7              87                  
            MARS BAR             8              88                  
            MARS BAR             10             1056                
            MARS BAR      F                     125                 
            MARS BAR      F      7              75                  
            MARS BAR      F      8              50                  
            MARS BAR      M                     1106                
            MARS BAR      M      7              12                  
            MARS BAR      M      8              38    
*/	
					
/*

11. use recursive function to display employees, their managers and level of the heirarchy (level 0 if the manager does not have a manager and 1 if manager in turn has a manager)

EMPID  ENAME      MGRID  LVL MGR_NAME   
------ ---------- -----  --- --------
4      BETTY      3      0   WILMA
5      PEBBLES    3      0   WILMA
6      BAM-BAM    4      1   BETTY      
7      DINO       4      1   BETTY      
8      HOPPY      4      1   BETTY 
/*


/*
12. Turning Columns to Rows

Query CANDYBAR_CONSUMPTION_DATA to display by converting OVERALL_RATING and NUMBER_BARS_CONSUMED columns into rows

CONSUMER_ID CANDYBAR_NAME SURVEY_YEAR GENDER STAT_TYPE            STAT_VALUE 
----------- ------------- ----------- ------ -------------------  ----------
1           TWIX BAR      2009        M      OVERALL_RATING       10         
1           TWIX BAR      2010        M      OVERALL_RATING       7          
1           TWIX BAR      2011        M      OVERALL_RATING       8          
1           TWIX BAR      2009        M      NUMBER_BARS_CONSUMED 6          
1           TWIX BAR      2010        M      NUMBER_BARS_CONSUMED 60         
1           TWIX BAR      2011        M      NUMBER_BARS_CONSUMED 600 
*/


/*
Turning rows into columns
Query T_CANDYBAR_DATA and 
	Turn STAT_VALUE where STAT_TYPE=1 back into OVERALL_RATING
	Turn STAT_VALUE where STAT_TYPE=2 back into NUMBER_BARS_CONSUMED

SURVEY_YEAR CANDYBAR_NAME GENDER OVERALL_RATING TOTAL_BARS_CONSUMED    
----------- ------------- ------ -------------- ---------------------- 
2009        TWIX BAR      F      7              20                     
2009        MARS BAR      F      7              25                     
2011        HERSHEY BAR   F      5              1                      
2009        HERSHEY BAR   F      7              20                     
2009        SNICKERS BAR  M      8              55                     
2011        MARS BAR      M      10             452                    
2009        TWIX BAR      M      10             6                      
2009        MARS BAR      F      8              25                     
2011        SNICKERS BAR  M      8              75                     
2009        TWIX BAR      M      9              75                     
2010        HERSHEY BAR   M      8              15                     
2010        TWIX BAR      M      7              60                     
2009        HERSHEY BAR   F      5              2                      
2010        HERSHEY BAR   F      5              3                      
2010        MARS BAR      M      7              12                     
2011        MARS BAR      M      8              13                     
2010        HERSHEY BAR   F      7              30                     
2011        TWIX BAR      F      7              10                     
2011        HERSHEY BAR   M      6              5                      
2010        MARS BAR      M      10             352                    
2011        HERSHEY BAR   F      7              10                     
2011        MARS BAR      F      7              15                     
2010        TWIX BAR      M      9              85                     
2010        MARS BAR      F      8              12                     
2009        MARS BAR      M      10             252                    
2011        TWIX BAR      M      8              600                    
2011        MARS BAR      F      8              13                     
2009        TWIX BAR      M      7              6                      
2010        TWIX BAR      F      7              30                     
2010        SNICKERS BAR  M      8              65                     
2009        HERSHEY BAR   M      8              15                     
2010        TWIX BAR      M      8              60                     
2011        TWIX BAR      M      9              695                    
2009        MARS BAR      M      8              25                     
2010        MARS BAR      F      7              35   
*/