-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4wVRHO
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "state" (
    "state_fips" VARCHAR   NOT NULL,
    "state_name" VARCHAR   NOT NULL
);

CREATE TABLE "county_state" (
    "county_fips" VARCHAR   NOT NULL,
    "state_fips" VARCHAR   NOT NULL
);

CREATE TABLE "county" (
    "county_fips" VARCHAR   NOT NULL,
    "county_name" VARCHAR   NOT NULL
);

CREATE TABLE "population" (
    "county_fips" VARCHAR   NOT NULL,
    "state_fips" VARCHAR   NOT NULL,
    "2019_population" VARCHAR   NOT NULL
);

CREATE TABLE "mask_usage" (
    "county_fips" VARCHAR   NOT NULL,
    "state_fips" VARCHAR   NOT NULL,
    "never" FLOAT   NOT NULL,
    "rarely" FLOAT   NOT NULL,
    "sometimes" FLOAT   NOT NULL,
    "frequenty" FLOAT   NOT NULL,
    "always" FLOAT   NOT NULL
);

CREATE TABLE "cases_death" (
    "county_fips" VARCHAR   NOT NULL,
    "state_fips" VARCHAR   NOT NULL,
    "cases_num" INTEGER   NOT NULL,
    "deaths_num" INTEGER   NOT NULL
);

ALTER TABLE "county_state" ADD CONSTRAINT "fk_county_state_county_fips" FOREIGN KEY("county_fips")
REFERENCES "county" ("county_fips");

ALTER TABLE "county_state" ADD CONSTRAINT "fk_county_state_state_fips" FOREIGN KEY("state_fips")
REFERENCES "state" ("state_fips");

ALTER TABLE "population" ADD CONSTRAINT "fk_population_county_fips_state_fips" FOREIGN KEY("county_fips", "state_fips")
REFERENCES "county_state" ("county_fips", "state_fips");

ALTER TABLE "mask_usage" ADD CONSTRAINT "fk_mask_usage_county_fips_state_fips" FOREIGN KEY("county_fips", "state_fips")
REFERENCES "county_state" ("county_fips", "state_fips");

ALTER TABLE "cases_death" ADD CONSTRAINT "fk_cases_death_county_fips_state_fips" FOREIGN KEY("county_fips", "state_fips")
REFERENCES "county_state" ("county_fips", "state_fips");

