-- -----------------------------------------------------------------------------
-- 00_init.sql
-- Purpose: One-time bootstrap for database + schemas
-- -----------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS WATER_QUALITY;

USE DATABASE WATER_QUALITY;

CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS FEATURES;
CREATE SCHEMA IF NOT EXISTS ML_MODELS;
CREATE SCHEMA IF NOT EXISTS PREDICTIONS;

-- sanity check
SHOW SCHEMAS;
