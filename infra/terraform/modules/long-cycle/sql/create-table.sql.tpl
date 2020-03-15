CREATE EXTERNAL TABLE IF NOT EXISTS ${athena_db_name}.${athena_table_name} (
  `count` int,
  `unix_time` bigint,
  `hoge` date
) PARTITIONED BY (
  year int,
  month int,
  day int,
  hour int
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://${s3_bucket_name}/logs/'
TBLPROPERTIES ('has_encrypted_data'='true');
