-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sZHmvX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar   NOT NULL,
    "description" text   NOT NULL,
    "goal" numeric(10,2)   NOT NULL,
    "pledged" numeric(10,2)   NOT NULL,
    "outcome" varchar   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar   NOT NULL,
    "currency" varchar   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "Category" (
    "category_id" varchar   NOT NULL,
    "category_name" varchar   NOT NULL,
	PRIMARY KEY (category_id)     
);

CREATE TABLE "Subcategory" (
    "subcategory_id" varchar   NOT NULL,
    "subcategory_name" varchar   NOT NULL,
	PRIMARY KEY (subcategory_id)
);

CREATE TABLE "Contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "email" varchar   NOT NULL,
	PRIMARY KEY (contact_id)
);

CREATE TABLE "backers" (
    "backer_id" varchar   NOT NULL,
    "cf_id" int   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "email" varchar   NOT NULL,
    PRIMARY KEY (backer_id)
);


ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "Subcategory" ("subcategory_id");

ALTER TABLE "backers" ADD CONSTRAINT "fk_backers_cf_id" FOREIGN KEY("cf_id")
REFERENCES "Campaign" ("cf_id");

ALTER TABLE "Campaign" RENAME TO campaign;
ALTER TABLE "Category" RENAME TO category;
ALTER TABLE "Subcategory" RENAME TO subcategory;
ALTER TABLE "Contacts" RENAME TO contacts;

