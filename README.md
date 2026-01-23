# snowflake-water-quality-ml
Snowflake-based data engineering and machine learning for inferring water quality metrics (Total Alkalinity, Electrical Conductance, and Dissolved Reactive Phosphorus) using point-in-time environmental and earth observation features.

This project was developed in the context of the EY AI & Data Challenge 2026 Optimizing Clean Water Supply and is designed to demonstrate production-grade feature engineering, spatial validation, and in-warehouse ML workflows.

---

## Problem Framing

The modeling task is framed as **retrospective inference**, not forward-looking forecasting.

- Targets represent measured water quality values at known historical sample dates
- Predictors are derived from environmental and earth observation datasets around those dates
- Some source datasets may be published after the sample date while still describing conditions at that time

As a result, the goal is to **estimate the state of water quality at a point in time**, rather than
predict future values.

This framing directly informs feature engineering, model validation, and evaluation strategy.

---

## Target Variables

The pipeline infers the following water quality metrics:

- **Total Alkalinity**
- **Electrical Conductance**
- **Dissolved Reactive Phosphorus (DRP)**

Each target is modeled using a shared set of spatial, temporal, and environmental covariates.

---

## Architecture

**Primary platform:** Snowflake

The pipeline follows a layered warehouse architecture:

- **RAW**
  - Immutable source datasets (water quality measurements, Landsat features, TerraClimate features, submission template)
- **FEATURES**
  - Rebuildable point-in-time feature tables, including spatial joins, climate variables, earth observation indices, and temporal encodings
- **MODEL_INPUT**
  - Final wide tables used for model training and inference
- **PREDICTIONS**
  - Model outputs

---

## Feature Engineering Strategy

Feature engineering is designed around point-in-time correctness and spatial generalization

- One row per **(latitude, longitude, sample_date)**
- Environmental context derived from:
  - Satellite-based earth observation (Landsat)
  - Monthly climate and hydrologic variables (TerraClimate)
- Temporal alignment using nearest-in-time or same-period representations
- Spatial aggregation and buffering applied where appropriate
- Derived features created inside Snowflake for transparency and performance

---

## Validation Strategy

Model validation is spatially aware to reflect real-world generalization requirements.

- Locations are grouped using a pseudo-station identifier derived from rounded latitude and longitude
- Entire locations are held out during validation to prevent spatial leakage
- Validation simulates inference at unseen river locations rather than random row splits

---

## Modeling Approach

- One regression model per target variable
- Notebook-driven experimentation and error analysis
- Model predictions written back to Snowflake tables for inspection and submission

---

## Repository Structure

```text
├── notebooks/          # Exploratory analysis and model development
├── sql/                # Snowflake SQL (RAW, STAGING, ANALYTICS, ML)
└── README.md
