-- Migration from existing schema to new schema based on ERD.mmd

-- Add timestamps to existing tables
ALTER TABLE "Candidate" 
ADD COLUMN IF NOT EXISTS "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "Education" 
ADD COLUMN IF NOT EXISTS "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "WorkExperience" 
ADD COLUMN IF NOT EXISTS "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "Resume" 
ADD COLUMN IF NOT EXISTS "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- Add onDelete CASCADE to existing relationships
ALTER TABLE "Education" DROP CONSTRAINT IF EXISTS "Education_candidateId_fkey";
ALTER TABLE "Education" ADD CONSTRAINT "Education_candidateId_fkey" 
    FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE;

ALTER TABLE "WorkExperience" DROP CONSTRAINT IF EXISTS "WorkExperience_candidateId_fkey";
ALTER TABLE "WorkExperience" ADD CONSTRAINT "WorkExperience_candidateId_fkey" 
    FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE;

ALTER TABLE "Resume" DROP CONSTRAINT IF EXISTS "Resume_candidateId_fkey";
ALTER TABLE "Resume" ADD CONSTRAINT "Resume_candidateId_fkey" 
    FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE;

-- Standardize existing column naming to snake_case
ALTER TABLE "Education" RENAME COLUMN "candidateId" TO "candidate_id";
ALTER TABLE "Education" RENAME COLUMN "startDate" TO "start_date";
ALTER TABLE "Education" RENAME COLUMN "endDate" TO "end_date";

ALTER TABLE "WorkExperience" RENAME COLUMN "candidateId" TO "candidate_id";
ALTER TABLE "WorkExperience" RENAME COLUMN "startDate" TO "start_date";
ALTER TABLE "WorkExperience" RENAME COLUMN "endDate" TO "end_date";

ALTER TABLE "Resume" RENAME COLUMN "candidateId" TO "candidate_id";
ALTER TABLE "Resume" RENAME COLUMN "uploadDate" TO "upload_date";

-- Add improved indexes to existing tables
CREATE INDEX IF NOT EXISTS "Candidate_firstName_lastName_idx" ON "Candidate"("firstName", "lastName");
DROP INDEX IF EXISTS "Candidate_email_idx"; -- Remove redundant index (email is already unique)

CREATE INDEX IF NOT EXISTS "Education_candidate_id_idx" ON "Education"("candidate_id");
CREATE INDEX IF NOT EXISTS "Education_start_date_end_date_idx" ON "Education"("start_date", "end_date");

CREATE INDEX IF NOT EXISTS "WorkExperience_candidate_id_idx" ON "WorkExperience"("candidate_id");
CREATE INDEX IF NOT EXISTS "WorkExperience_start_date_end_date_idx" ON "WorkExperience"("start_date", "end_date");
CREATE INDEX IF NOT EXISTS "WorkExperience_company_idx" ON "WorkExperience"("company");

CREATE INDEX IF NOT EXISTS "Resume_candidate_id_idx" ON "Resume"("candidate_id");
CREATE INDEX IF NOT EXISTS "Resume_upload_date_idx" ON "Resume"("upload_date");
CREATE INDEX IF NOT EXISTS "Resume_fileType_idx" ON "Resume"("fileType");

-- Create new tables

-- Company table
CREATE TABLE "Company" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "description" TEXT,
  "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Employee table
CREATE TABLE "Employee" (
  "id" SERIAL PRIMARY KEY,
  "company_id" INTEGER NOT NULL,
  "name" VARCHAR(100) NOT NULL,
  "email" VARCHAR(255) NOT NULL UNIQUE,
  "role" VARCHAR(50) NOT NULL,
  "is_active" BOOLEAN NOT NULL DEFAULT true,
  "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "Employee_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company"("id") ON DELETE CASCADE
);

-- InterviewFlow table
CREATE TABLE "InterviewFlow" (
  "id" SERIAL PRIMARY KEY,
  "description" VARCHAR(255) NOT NULL,
  "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- InterviewType table
CREATE TABLE "InterviewType" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "description" TEXT,
  "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- InterviewStep table
CREATE TABLE "InterviewStep" (
  "id" SERIAL PRIMARY KEY,
  "interview_flow_id" INTEGER NOT NULL,
  "interview_type_id" INTEGER NOT NULL,
  "name" VARCHAR(100) NOT NULL,
  "order_index" INTEGER NOT NULL,
  "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "InterviewStep_interview_flow_id_fkey" FOREIGN KEY ("interview_flow_id") REFERENCES "InterviewFlow"("id") ON DELETE CASCADE,
  CONSTRAINT "InterviewStep_interview_type_id_fkey" FOREIGN KEY ("interview_type_id") REFERENCES "InterviewType"("id")
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
  "application_deadline" DATE,
  "contact_info" VARCHAR(255),
  "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "Position_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company"("id") ON DELETE CASCADE,
  CONSTRAINT "Position_interview_flow_id_fkey" FOREIGN KEY ("interview_flow_id") REFERENCES "InterviewFlow"("id")
);

-- Application table
CREATE TABLE "Application" (
  "id" SERIAL PRIMARY KEY,
  "position_id" INTEGER NOT NULL,
  "candidate_id" INTEGER NOT NULL,
  "application_date" DATE NOT NULL,
  "status" VARCHAR(50) NOT NULL,
  "notes" TEXT,
  "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "Application_position_id_fkey" FOREIGN KEY ("position_id") REFERENCES "Position"("id") ON DELETE CASCADE,
  CONSTRAINT "Application_candidate_id_fkey" FOREIGN KEY ("candidate_id") REFERENCES "Candidate"("id") ON DELETE CASCADE
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
  "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "Interview_application_id_fkey" FOREIGN KEY ("application_id") REFERENCES "Application"("id") ON DELETE CASCADE,
  CONSTRAINT "Interview_interview_step_id_fkey" FOREIGN KEY ("interview_step_id") REFERENCES "InterviewStep"("id"),
  CONSTRAINT "Interview_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee"("id")
);

-- Create improved indexes for better performance
CREATE INDEX "Company_name_idx" ON "Company"("name");

CREATE INDEX "Employee_company_id_idx" ON "Employee"("company_id");
CREATE INDEX "Employee_name_idx" ON "Employee"("name");
CREATE INDEX "Employee_role_idx" ON "Employee"("role");
CREATE INDEX "Employee_is_active_idx" ON "Employee"("is_active");

CREATE INDEX "InterviewType_name_idx" ON "InterviewType"("name");

CREATE INDEX "InterviewStep_interview_flow_id_idx" ON "InterviewStep"("interview_flow_id");
CREATE INDEX "InterviewStep_interview_type_id_idx" ON "InterviewStep"("interview_type_id");
CREATE INDEX "InterviewStep_order_index_idx" ON "InterviewStep"("order_index");

CREATE INDEX "Position_company_id_idx" ON "Position"("company_id");
CREATE INDEX "Position_interview_flow_id_idx" ON "Position"("interview_flow_id");
CREATE INDEX "Position_status_idx" ON "Position"("status");
CREATE INDEX "Position_location_idx" ON "Position"("location");
CREATE INDEX "Position_is_visible_idx" ON "Position"("is_visible");
CREATE INDEX "Position_application_deadline_idx" ON "Position"("application_deadline");
CREATE INDEX "Position_employment_type_idx" ON "Position"("employment_type");
CREATE INDEX "Position_title_idx" ON "Position"("title");

CREATE INDEX "Application_position_id_idx" ON "Application"("position_id");
CREATE INDEX "Application_candidate_id_idx" ON "Application"("candidate_id");
CREATE INDEX "Application_application_date_idx" ON "Application"("application_date");
CREATE INDEX "Application_status_idx" ON "Application"("status");
CREATE INDEX "Application_position_id_status_idx" ON "Application"("position_id", "status");

CREATE INDEX "Interview_application_id_idx" ON "Interview"("application_id");
CREATE INDEX "Interview_interview_step_id_idx" ON "Interview"("interview_step_id");
CREATE INDEX "Interview_employee_id_idx" ON "Interview"("employee_id");
CREATE INDEX "Interview_interview_date_idx" ON "Interview"("interview_date");
CREATE INDEX "Interview_result_idx" ON "Interview"("result");
CREATE INDEX "Interview_application_id_interview_step_id_idx" ON "Interview"("application_id", "interview_step_id"); 