********************************************8 CREATING HIVE TABLE ***************************************************************************
hive> show databases;
OK
custom
custopm
default
onkar
Time taken: 1.018 seconds, Fetched: 4 row(s)

hive>use onkar;

hive> set hive.cli.print.current.db=true;

hive (onkar)> create table titanic_data (passenger_id int,survived int,pclass int,name string,sex string,age int,sib_sp string,parch string,ticket string,fare float,cabin string,embarked string) row format delimited fields terminated by ',' lines terminated by '\n' stored AS textfile;
OK
Time taken: 1.592 seconds

*************************************** LOADING DATA TO HIVE TABLE ***************************************************************************

hive (onkar)> LOAD DATA INPATH '/user/acadgild/hadoop/Onkar/Project1_1/FlumeData.1484318895045' INTO TABLE titanic_data;
Loading data to table onkar.titanic_data
Table onkar.titanic_data stats: [numFiles=1, totalSize=63667]
OK
Time taken: 1.813 seconds

1] *************************** Problem Statement 1 *******************************************************************************************

hive (onkar)>  select pclass, AVG(fare) from titanic_data GROUP BY pclass;

OK
NULL	NULL
1	84.15468752825701
2	20.66218318109927
3	13.675550210257411
Time taken: 49.647 seconds, Fetched: 4 row(s)

2] **************************************** Problem Statement 2*******************************************************************************

hive (onkar)> select pclass, COUNT(passenger_id) from titanic_data where survived=0 AND embarked='S' GROUP BY pclass;

DFS Write: 16 SUCCESS
Total MapReduce CPU Time Spent: 4 seconds 260 msec
OK
1	53
2	88
3	286
Time taken: 34.656 seconds, Fetched: 3 row(s)

3] *********************************** Problem Statement 3 ***********************************************************************************

hive (onkar)> select pclass, COUNT(passenger_id) from titanic_data where sex='male' AND survived=1 GROUP BY pclass;

OK
1	45
2	17
3	47
Time taken: 31.613 seconds, Fetched: 3 row(s)

4] ************************************ Problem Statement 4 ***********************************************************************************


hive (onkar)> select pclass, COUNT(passenger_id) from titanic_data where sex='female' AND survived=1 GROUP BY pclass;

OK
1	91
2	70
3	72
Time taken: 31.42 seconds, Fetched: 3 row(s)
hive (onkar)> 

