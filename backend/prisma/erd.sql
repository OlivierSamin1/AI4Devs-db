-- SQL generated from ERD.mmd

-- Company table
CREATE TABLE "Company" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL
);

-- Employee table
CREATE TABLE "Employee" (
  "id" SERIAL PRIMARY KEY,
  "company_id" INTEGER NOT NULL,
  "name" VARCHAR(100) NOT NULL,
  "email" VARCHAR(255) NOT NULL UNIQUE,
  "role" VARCHAR(50) NOT NULL,
  "is_active" BOOLEAN NOT NULL DEFAULT true,
  CONSTRAINT "fk_employee_company" FOREIGN KEY ("company_id") REFERENCES "Company"("id") ON DELETE CASCADE
);

-- InterviewFlow table
CREATE TABLE "InterviewFlow" (
  "id" SERIAL PRIMARY KEY,
  "description" VARCHAR(255) NOT NULL
);

-- InterviewType table
CREATE TABLE "InterviewType" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "description" TEXT
);

-- InterviewStep table
CREATE TABLE "InterviewStep" (
  "id" SERIAL PRIMARY KEY,
  "interview_flow_id" INTEGER NOT NULL,
  "interview_type_id" INTEGER NOT NULL,
  "name" VARCHAR(100) NOT NULL,
  "order_index" INTEGER NOT NULL,
  CONSTRAINT "fk_interview_step_flow" FOREIGN KEY ("interview_flow_id") REFERENCES "InterviewFlow"("id") ON DELETE CASCADE,
  CONSTRAINT "fk_interview_step_type" FOREIGN KEY ("interview_type_id") REFERENCES "InterviewType"("id") ON DELETE RESTRICT
);

-- Position table
CREATE TABLE "Position" (
  "id" SERIAL PRIMARY KEY,
  "company_id" INTEGER NOT NULL,
  "interview_flow_id" INTEGER NOT NULL,
  "title" VARCHAR(100) NOT NULL,
  "description" TEXT,
  "status" VARCHAR(50) NOT NULL,
  "is_visible" BOOLEAN NOT NULL DEFAULT true,
  "location" VARCHAR(100),
  "job_description" TEXT,
  "requirements" TEXT,
  "responsibilities" TEXT,
  "salary_min" DECIMAL(10,2),
  "salary_max" DECIMAL(10,2),
  "employment_type" VARCHAR(50),
  "benefits" TEXT,
  "company_description" TEXT,
  "application_deadline" DATE,
  "contact_info" VARCHAR(255),
  CONSTRAINT "fk_position_company" FOREIGN KEY ("company_id") REFERENCES "Company"("id") ON DELETE CASCADE,
  CONSTRAINT "fk_position_interview_flow" FOREIGN KEY ("interview_flow_id") REFERENCES "InterviewFlow"("id") ON DELETE RESTRICT
);

-- Application table
CREATE TABLE "Application" (
  "id" SERIAL PRIMARY KEY,
  "position_id" INTEGER NOT NULL,
  "candidate_id" INTEGER NOT NULL,
  "application_date" DATE NOT NULL,
  "status" VARCHAR(50) NOT NULL,
  "notes" TEXT,
  CONSTRAINT "fk_application_position" FOREIGN KEY ("position_id") REFERENCES "Position"("id") ON DELETE CASCADE,
  CONSTRAINT "fk_application_candidate" FOREIGN KEY ("candidate_id") REFERENCES "Candidate"("id") ON DELETE CASCADE
);

-- Interview table
CREATE TABLE "Interview" (
  "id" SERIAL PRIMARY KEY,
  "application_id" INTEGER NOT NULL,
  "interview_step_id" INTEGER NOT NULL,
  "employee_id" INTEGER NOT NULL,
  "interview_date" DATE NOT NULL,
  "result" VARCHAR(50),
  "score" INTEGER,
  "notes" TEXT,
  CONSTRAINT "fk_interview_application" FOREIGN KEY ("application_id") REFERENCES "Application"("id") ON DELETE CASCADE,
  CONSTRAINT "fk_interview_step" FOREIGN KEY ("interview_step_id") REFERENCES "InterviewStep"("id") ON DELETE RESTRICT,
  CONSTRAINT "fk_interview_employee" FOREIGN KEY ("employee_id") REFERENCES "Employee"("id") ON DELETE RESTRICT
);

-- Create indexes for better performance
CREATE INDEX "idx_employee_company" ON "Employee"("company_id");
CREATE INDEX "idx_position_company" ON "Position"("company_id");
CREATE INDEX "idx_position_interview_flow" ON "Position"("interview_flow_id");
CREATE INDEX "idx_interview_step_flow" ON "InterviewStep"("interview_flow_id");
CREATE INDEX "idx_interview_step_type" ON "InterviewStep"("interview_type_id");
CREATE INDEX "idx_application_position" ON "Application"("position_id");
CREATE INDEX "idx_application_candidate" ON "Application"("candidate_id");
CREATE INDEX "idx_interview_application" ON "Interview"("application_id");
CREATE INDEX "idx_interview_step" ON "Interview"("interview_step_id");
CREATE INDEX "idx_interview_employee" ON "Interview"("employee_id"); 