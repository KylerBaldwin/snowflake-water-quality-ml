-- -----------------------------------------------------------------------------
-- 01_stage_raw_parquet.sql
-- Purpose: Define reusable CSV file format + a stage for raw CSV drops
-- -----------------------------------------------------------------------------

USE DATABASE WATER_QUALITY;
USE SCHEMA ML_MODELS;

-- pkl format blobs
CREATE OR REPLACE STAGE STG_MODEL_ARTIFACTS_BIN
  DIRECTORY = ( ENABLE = TRUE );

-- list stage
LIST @STG_MODEL_ARTIFACTS_BIN;
