/*
  Warnings:

  - You are about to drop the column `applicationDate` on the `Application` table. All the data in the column will be lost.
  - You are about to drop the column `candidateId` on the `Application` table. All the data in the column will be lost.
  - You are about to drop the column `positionId` on the `Application` table. All the data in the column will be lost.
  - You are about to drop the column `candidateId` on the `Education` table. All the data in the column will be lost.
  - You are about to drop the column `endDate` on the `Education` table. All the data in the column will be lost.
  - You are about to drop the column `startDate` on the `Education` table. All the data in the column will be lost.
  - You are about to drop the column `companyId` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `isActive` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `applicationId` on the `Interview` table. All the data in the column will be lost.
  - You are about to drop the column `employeeId` on the `Interview` table. All the data in the column will be lost.
  - You are about to drop the column `interviewDate` on the `Interview` table. All the data in the column will be lost.
  - You are about to drop the column `interviewStepId` on the `Interview` table. All the data in the column will be lost.
  - You are about to drop the column `interviewFlowId` on the `InterviewStep` table. All the data in the column will be lost.
  - You are about to drop the column `interviewTypeId` on the `InterviewStep` table. All the data in the column will be lost.
  - You are about to drop the column `orderIndex` on the `InterviewStep` table. All the data in the column will be lost.
  - You are about to drop the column `applicationDeadline` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `companyDescription` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `companyId` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `contactInfo` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `employmentType` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `interviewFlowId` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `isVisible` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `jobDescription` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `salaryMax` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `salaryMin` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `candidateId` on the `Resume` table. All the data in the column will be lost.
  - You are about to drop the column `uploadDate` on the `Resume` table. All the data in the column will be lost.
  - You are about to drop the column `candidateId` on the `WorkExperience` table. All the data in the column will be lost.
  - You are about to drop the column `endDate` on the `WorkExperience` table. All the data in the column will be lost.
  - You are about to drop the column `startDate` on the `WorkExperience` table. All the data in the column will be lost.
  - Added the required column `application_date` to the `Application` table without a default value. This is not possible if the table is not empty.
  - Added the required column `candidate_id` to the `Application` table without a default value. This is not possible if the table is not empty.
  - Added the required column `position_id` to the `Application` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Application` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Candidate` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Company` table without a default value. This is not possible if the table is not empty.
  - Added the required column `candidate_id` to the `Education` table without a default value. This is not possible if the table is not empty.
  - Added the required column `start_date` to the `Education` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Education` table without a default value. This is not possible if the table is not empty.
  - Added the required column `company_id` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `application_id` to the `Interview` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employee_id` to the `Interview` table without a default value. This is not possible if the table is not empty.
  - Added the required column `interview_date` to the `Interview` table without a default value. This is not possible if the table is not empty.
  - Added the required column `interview_step_id` to the `Interview` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Interview` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `InterviewFlow` table without a default value. This is not possible if the table is not empty.
  - Added the required column `interview_flow_id` to the `InterviewStep` table without a default value. This is not possible if the table is not empty.
  - Added the required column `interview_type_id` to the `InterviewStep` table without a default value. This is not possible if the table is not empty.
  - Added the required column `order_index` to the `InterviewStep` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `InterviewStep` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `InterviewType` table without a default value. This is not possible if the table is not empty.
  - Added the required column `company_id` to the `Position` table without a default value. This is not possible if the table is not empty.
  - Added the required column `interview_flow_id` to the `Position` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Position` table without a default value. This is not possible if the table is not empty.
  - Added the required column `candidate_id` to the `Resume` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Resume` table without a default value. This is not possible if the table is not empty.
  - Added the required column `upload_date` to the `Resume` table without a default value. This is not possible if the table is not empty.
  - Added the required column `candidate_id` to the `WorkExperience` table without a default value. This is not possible if the table is not empty.
  - Added the required column `start_date` to the `WorkExperience` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `WorkExperience` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Application" DROP CONSTRAINT "Application_candidateId_fkey";

-- DropForeignKey
ALTER TABLE "Application" DROP CONSTRAINT "Application_positionId_fkey";

-- DropForeignKey
ALTER TABLE "Education" DROP CONSTRAINT "Education_candidateId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_companyId_fkey";

-- DropForeignKey
ALTER TABLE "Interview" DROP CONSTRAINT "Interview_applicationId_fkey";

-- DropForeignKey
ALTER TABLE "Interview" DROP CONSTRAINT "Interview_employeeId_fkey";

-- DropForeignKey
ALTER TABLE "Interview" DROP CONSTRAINT "Interview_interviewStepId_fkey";

-- DropForeignKey
ALTER TABLE "InterviewStep" DROP CONSTRAINT "InterviewStep_interviewFlowId_fkey";

-- DropForeignKey
ALTER TABLE "InterviewStep" DROP CONSTRAINT "InterviewStep_interviewTypeId_fkey";

-- DropForeignKey
ALTER TABLE "Position" DROP CONSTRAINT "Position_companyId_fkey";

-- DropForeignKey
ALTER TABLE "Position" DROP CONSTRAINT "Position_interviewFlowId_fkey";

-- DropForeignKey
ALTER TABLE "Resume" DROP CONSTRAINT "Resume_candidateId_fkey";

-- DropForeignKey
ALTER TABLE "WorkExperience" DROP CONSTRAINT "WorkExperience_candidateId_fkey";

-- DropIndex
DROP INDEX "Application_candidateId_idx";

-- DropIndex
DROP INDEX "Application_positionId_idx";

-- DropIndex
DROP INDEX "Education_candidateId_idx";

-- DropIndex
DROP INDEX "Employee_companyId_idx";

-- DropIndex
DROP INDEX "Interview_applicationId_idx";

-- DropIndex
DROP INDEX "Interview_employeeId_idx";

-- DropIndex
DROP INDEX "Interview_interviewStepId_idx";

-- DropIndex
DROP INDEX "InterviewStep_interviewFlowId_idx";

-- DropIndex
DROP INDEX "InterviewStep_interviewTypeId_idx";

-- DropIndex
DROP INDEX "Position_companyId_idx";

-- DropIndex
DROP INDEX "Position_interviewFlowId_idx";

-- DropIndex
DROP INDEX "Resume_candidateId_idx";

-- DropIndex
DROP INDEX "WorkExperience_candidateId_idx";

-- AlterTable
ALTER TABLE "Application" DROP COLUMN "applicationDate",
DROP COLUMN "candidateId",
DROP COLUMN "positionId",
ADD COLUMN     "application_date" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "candidate_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "position_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Candidate" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Company" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Education" DROP COLUMN "candidateId",
DROP COLUMN "endDate",
DROP COLUMN "startDate",
ADD COLUMN     "candidate_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "end_date" TIMESTAMP(3),
ADD COLUMN     "start_date" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Employee" DROP COLUMN "companyId",
DROP COLUMN "isActive",
ADD COLUMN     "company_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "is_active" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Interview" DROP COLUMN "applicationId",
DROP COLUMN "employeeId",
DROP COLUMN "interviewDate",
DROP COLUMN "interviewStepId",
ADD COLUMN     "application_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "employee_id" INTEGER NOT NULL,
ADD COLUMN     "interview_date" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "interview_step_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "InterviewFlow" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "InterviewStep" DROP COLUMN "interviewFlowId",
DROP COLUMN "interviewTypeId",
DROP COLUMN "orderIndex",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "interview_flow_id" INTEGER NOT NULL,
ADD COLUMN     "interview_type_id" INTEGER NOT NULL,
ADD COLUMN     "order_index" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "InterviewType" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "description" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Position" DROP COLUMN "applicationDeadline",
DROP COLUMN "companyDescription",
DROP COLUMN "companyId",
DROP COLUMN "contactInfo",
DROP COLUMN "employmentType",
DROP COLUMN "interviewFlowId",
DROP COLUMN "isVisible",
DROP COLUMN "jobDescription",
DROP COLUMN "salaryMax",
DROP COLUMN "salaryMin",
ADD COLUMN     "application_deadline" TIMESTAMP(3),
ADD COLUMN     "company_id" INTEGER NOT NULL,
ADD COLUMN     "contact_info" VARCHAR(255),
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "employment_type" VARCHAR(50),
ADD COLUMN     "interview_flow_id" INTEGER NOT NULL,
ADD COLUMN     "is_visible" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "job_description" TEXT,
ADD COLUMN     "salary_max" DECIMAL(10,2),
ADD COLUMN     "salary_min" DECIMAL(10,2),
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "description" DROP NOT NULL,
ALTER COLUMN "location" DROP NOT NULL,
ALTER COLUMN "requirements" DROP NOT NULL,
ALTER COLUMN "responsibilities" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Resume" DROP COLUMN "candidateId",
DROP COLUMN "uploadDate",
ADD COLUMN     "candidate_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "upload_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "WorkExperience" DROP COLUMN "candidateId",
DROP COLUMN "endDate",
DROP COLUMN "startDate",
ADD COLUMN     "candidate_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "end_date" TIMESTAMP(3),
ADD COLUMN     "start_date" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- CreateIndex
CREATE INDEX "Application_position_id_idx" ON "Application"("position_id");

-- CreateIndex
CREATE INDEX "Application_candidate_id_idx" ON "Application"("candidate_id");

-- CreateIndex
CREATE INDEX "Application_application_date_idx" ON "Application"("application_date");

-- CreateIndex
CREATE INDEX "Application_status_idx" ON "Application"("status");

-- CreateIndex
CREATE INDEX "Application_position_id_status_idx" ON "Application"("position_id", "status");

-- CreateIndex
CREATE INDEX "Candidate_firstName_lastName_idx" ON "Candidate"("firstName", "lastName");

-- CreateIndex
CREATE INDEX "Company_name_idx" ON "Company"("name");

-- CreateIndex
CREATE INDEX "Education_candidate_id_idx" ON "Education"("candidate_id");

-- CreateIndex
CREATE INDEX "Education_start_date_end_date_idx" ON "Education"("start_date", "end_date");

-- CreateIndex
CREATE INDEX "Employee_company_id_idx" ON "Employee"("company_id");

-- CreateIndex
CREATE INDEX "Employee_name_idx" ON "Employee"("name");

-- CreateIndex
CREATE INDEX "Employee_role_idx" ON "Employee"("role");

-- CreateIndex
CREATE INDEX "Employee_is_active_idx" ON "Employee"("is_active");

-- CreateIndex
CREATE INDEX "Interview_application_id_idx" ON "Interview"("application_id");

-- CreateIndex
CREATE INDEX "Interview_interview_step_id_idx" ON "Interview"("interview_step_id");

-- CreateIndex
CREATE INDEX "Interview_employee_id_idx" ON "Interview"("employee_id");

-- CreateIndex
CREATE INDEX "Interview_interview_date_idx" ON "Interview"("interview_date");

-- CreateIndex
CREATE INDEX "Interview_result_idx" ON "Interview"("result");

-- CreateIndex
CREATE INDEX "Interview_application_id_interview_step_id_idx" ON "Interview"("application_id", "interview_step_id");

-- CreateIndex
CREATE INDEX "InterviewStep_interview_flow_id_idx" ON "InterviewStep"("interview_flow_id");

-- CreateIndex
CREATE INDEX "InterviewStep_interview_type_id_idx" ON "InterviewStep"("interview_type_id");

-- CreateIndex
CREATE INDEX "InterviewStep_order_index_idx" ON "InterviewStep"("order_index");

-- CreateIndex
CREATE INDEX "InterviewType_name_idx" ON "InterviewType"("name");

-- CreateIndex
CREATE INDEX "Position_company_id_idx" ON "Position"("company_id");

-- CreateIndex
CREATE INDEX "Position_interview_flow_id_idx" ON "Position"("interview_flow_id");

-- CreateIndex
CREATE INDEX "Position_status_idx" ON "Position"("status");

-- CreateIndex
CREATE INDEX "Position_location_idx" ON "Position"("location");

-- CreateIndex
CREATE INDEX "Position_is_visible_idx" ON "Position"("is_visible");

-- CreateIndex
CREATE INDEX "Position_application_deadline_idx" ON "Position"("application_deadline");

-- CreateIndex
CREATE INDEX "Position_employment_type_idx" ON "Position"("employment_type");

-- CreateIndex
CREATE INDEX "Position_title_idx" ON "Position"("title");

-- CreateIndex
CREATE INDEX "Resume_candidate_id_idx" ON "Resume"("candidate_id");

-- CreateIndex
CREATE INDEX "Resume_upload_date_idx" ON "Resume"("upload_date");

-- CreateIndex
CREATE INDEX "Resume_fileType_idx" ON "Resume"("fileType");

-- CreateIndex
CREATE INDEX "WorkExperience_candidate_id_idx" ON "WorkExperience"("candidate_id");

-- CreateIndex
CREATE INDEX "WorkExperience_start_date_end_date_idx" ON "WorkExperience"("start_date", "end_date");

-- CreateIndex
CREATE INDEX "WorkExperience_company_idx" ON "WorkExperience"("company");

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_candidate_id_fkey" FOREIGN KEY ("candidate_id") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkExperience" ADD CONSTRAINT "WorkExperience_candidate_id_fkey" FOREIGN KEY ("candidate_id") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Resume" ADD CONSTRAINT "Resume_candidate_id_fkey" FOREIGN KEY ("candidate_id") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InterviewStep" ADD CONSTRAINT "InterviewStep_interview_flow_id_fkey" FOREIGN KEY ("interview_flow_id") REFERENCES "InterviewFlow"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InterviewStep" ADD CONSTRAINT "InterviewStep_interview_type_id_fkey" FOREIGN KEY ("interview_type_id") REFERENCES "InterviewType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Position" ADD CONSTRAINT "Position_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Position" ADD CONSTRAINT "Position_interview_flow_id_fkey" FOREIGN KEY ("interview_flow_id") REFERENCES "InterviewFlow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Application" ADD CONSTRAINT "Application_position_id_fkey" FOREIGN KEY ("position_id") REFERENCES "Position"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Application" ADD CONSTRAINT "Application_candidate_id_fkey" FOREIGN KEY ("candidate_id") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Interview" ADD CONSTRAINT "Interview_application_id_fkey" FOREIGN KEY ("application_id") REFERENCES "Application"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Interview" ADD CONSTRAINT "Interview_interview_step_id_fkey" FOREIGN KEY ("interview_step_id") REFERENCES "InterviewStep"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Interview" ADD CONSTRAINT "Interview_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
