# hive sql
CREATE DATABASE test_hive;
USE test_hive;
CREATE TABLE test_person (id INT,name string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
LOAD DATA LOCAL INPATH '/software/hive-1.2.1/test_person.txt' OVERWRITE INTO TABLE test_person;
select * from test_person;

# HDFS
./hdfs dfs -ls /hive/warehouse/
./hdfs dfs -ls /hive/warehouse/test_hive.db/
./hdfs dfs -ls /hive/warehouse/test_hive.db/test_person/
./hdfs dfs -cat /hive/warehouse/test_hive.db/test_person/test_person.txt

