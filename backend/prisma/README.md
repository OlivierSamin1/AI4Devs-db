# Database Schema and Seeding

This directory contains the Prisma schema and seeding tools for the database.

## Files

- `schema.prisma`: The original Prisma schema
- `schema_updated.prisma`: The updated Prisma schema with improved indexes and normalization
- `migration.sql`: SQL migration script to update the database schema
- `seed.ts`: TypeScript script to populate the database with synthetic Spanish data
- `new_ERD.mmd`: Updated Entity Relationship Diagram in Mermaid format
- `ERD.mmd`: Original Entity Relationship Diagram in Mermaid format

## Running Migrations and Seeding

### Step 1: Install Dependencies

First, install all necessary dependencies:

```bash
npm install
```

### Step 2: Copy the Updated Schema

Replace the existing schema with the updated one:

```bash
cp schema_updated.prisma schema.prisma
```

### Step 3: Generate Prisma Client

Generate the Prisma client based on the updated schema:

```bash
npm run prisma:generate
```

### Step 4: Run Migrations

Initialize and run migrations to update your database:

```bash
npm run prisma:migrate
```

### Step 5: Seed the Database

Populate the database with synthetic Spanish data:

```bash
npm run prisma:seed
```

## Database Connection

### Using pgAdmin

To connect to your PostgreSQL database using pgAdmin:

1. **Access pgAdmin**: Open pgAdmin in your browser (typically at http://localhost:5050)
2. **Log in**: Use your pgAdmin credentials
3. **Create a New Server Connection**:
   - **Name**: Any name (e.g., "AI4Devs-DB")
   - **Host**: localhost
   - **Port**: 5432
   - **Maintenance Database**: LTIdb
   - **Username**: LTIdbUser
   - **Password**: D1ymf8wyQEGthFR1E9xhCq

## Schema Improvements

The updated schema includes the following improvements:

1. **Optimized Indexes**:
   - Added compound indexes for common query patterns
   - Added indexes on fields commonly used for filtering and searching
   - Removed redundant indexes

2. **Normalization**:
   - Moved company description from Position to Company for better normalization
   - Standardized naming conventions with proper mapping

3. **Audit Fields**:
   - Added createdAt/updatedAt timestamps to all entities
   - Added proper mapping to database column names

4. **Relationships**:
   - Added proper cascade deletion rules
   - Improved relationship references

## Seed Data

The seed script creates:

- 10 Spanish companies
- 5 employees per company
- 3 positions per company
- 50 candidates
- 100 applications
- Multiple interviews for qualifying applications

The data includes Spanish names, job titles, universities, and locations for realistic Spanish context. 