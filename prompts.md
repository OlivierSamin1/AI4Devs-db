Using Cursor in agent mode with Claude 3.7-sonnet model:
---

**Prompt 1**:
You are a senior software engineer with strong knowledge in databases and prisma. You are very well known to apply in a very efficient way the best principles and practices regarding databases and specially the index definition and the database normalization. 
I have my actual database schema here: @schema.prisma and I need to update it with the models in here @ERD.mmd.
perofrm the following steps:
1. transform the @ERD.mmd file into a sql file
2. use this sql file to create a new sql file taking into account the existing @schema.prisma

**Prompt 2**:
I want you to check @schema_updated.prisma  to ensure that:
1. the definition of indexes has been properly done
2. the normalization of the database is done
If not fix it and rewrite the needed files 

**Prompt 3**:
from @schema_updated.prisma generate a new_ERD.mmd file and then write a script to populate the db with synthetic data for spanish company and spanish applicants.

**Prompt 4**:
from @schema_updated.prisma generate a new_ERD.mmd file and then write a script to populate the db with synthetic data for spanish company and spanish applicants.

