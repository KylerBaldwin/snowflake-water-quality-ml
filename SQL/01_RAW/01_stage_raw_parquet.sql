-- -----------------------------------------------------------------------------
-- 01_stage_raw_parquet.sql
-- Purpose: Define reusable CSV file format + a stage for raw CSV drops
-- -----------------------------------------------------------------------------

USE DATABASE WATER_QUALITY;
USE SCHEMA RAW;

-- Parquet format
CREATE OR REPLACE FILE FORMAT FF_PARQUET
  TYPE = PARQUET
  COMPRESSION = AUTO;

-- Internal stage for uploading CSVs
CREATE OR REPLACE STAGE STG_RAW_PARQUET
  FILE_FORMAT = FF_PARQUET
  DIRECTORY = ( ENABLE = TRUE);

-- list stage
LIST @STG_RAW_PARQUET;
