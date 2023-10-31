CREATE TABLE "invoices" (
    "id" SERIAL PRIMARY KEY,
    "total_amount" DECIMAL(8, 2) NOT NULL,
    "generated_at" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "paid_at" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "medical_history_id" INTEGER NOT NULL,
     FOREIGN KEY ("medical_history_id") REFERENCES "medical_histories"("id")
);

CREATE TABLE "treatments" (
    "id" SERIAL PRIMARY KEY,
    "type" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "patients" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);

CREATE TABLE "medical_histories" (
    "id" SERIAL PRIMARY KEY,
    "admitted_at" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    FOREIGN KEY ("patient_id") REFERENCES "patients"("id")
);

CREATE TABLE "invoice_items" (
    "id" SERIAL PRIMARY KEY,
    "unit_price" DECIMAL(8, 2) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "treatment_id" INTEGER NOT NULL,
    FOREIGN KEY ("invoice_id") REFERENCES "invoices"("id"),
    FOREIGN KEY ("treatment_id") REFERENCES "treatments"("id")
);


