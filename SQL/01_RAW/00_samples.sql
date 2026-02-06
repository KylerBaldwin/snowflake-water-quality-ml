-- -----------------------------------------------------------------------------
-- 10_create_raw_tables.sql
-- Purpose: Create immutable RAW tables that mirror the CSVs (typed + stable)
-- -----------------------------------------------------------------------------

USE DATABASE WATER_QUALITY;
USE SCHEMA RAW;

-- LANDING water quality training targets (to parse date)
CREATE OR REPLACE TABLE RAW.LANDING_WATER_QUALITY_TRAINING (
  LATITUDE                          FLOAT,
  LONGITUDE                         FLOAT,
  SAMPLE_DATE                       TEXT,
  TOTAL_ALKALINITY                  FLOAT,
  ELECTRICAL_CONDUCTANCE            FLOAT,
  DISSOLVED_REACTIVE_PHOSPHORUS     FLOAT
);

-- LANDING water quality validation 
CREATE OR REPLACE TABLE RAW.LANDING_WATER_QUALITY_VALIDATION (
  LATITUDE                      FLOAT,
  LONGITUDE                     FLOAT,
  SAMPLE_DATE                   TEXT,
  TOTAL_ALKALINITY              FLOAT,
  ELECTRICAL_CONDUCTANCE        FLOAT,
  DISSOLVED_REACTIVE_PHOSPHORUS FLOAT
);