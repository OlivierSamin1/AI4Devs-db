import { PrismaClient } from '@prisma/client';

// Initialize Prisma Client
const prisma = new PrismaClient();

async function main() {
  console.log('Starting seeding...');

  // Clean up existing data
  await prisma.interview.deleteMany({});
  await prisma.application.deleteMany({});
  await prisma.resume.deleteMany({});
  await prisma.workExperience.deleteMany({});
  await prisma.education.deleteMany({});
  await prisma.candidate.deleteMany({});
  await prisma.position.deleteMany({});
  await prisma.interviewStep.deleteMany({});
  await prisma.interviewType.deleteMany({});
  await prisma.interviewFlow.deleteMany({});
  await prisma.employee.deleteMany({});
  await prisma.company.deleteMany({});

  // Sample Spanish job titles
  const jobTitles = [
    'Desarrollador Frontend', 'Desarrollador Backend', 'Ingeniero DevOps', 
    'Arquitecto de Software', 'Analista de Datos'
  ];

  const cities = ['Madrid', 'Barcelona', 'Valencia', 'Sevilla', 'Bilbao'];
  
  // Create 3 companies
  for (let i = 0; i < 3; i++) {
    const company = await prisma.company.create({
      data: {
        name: `Empresa Española ${i + 1}`,
        description: `Descripción de la empresa ${i + 1}`
      }
    });
    
    console.log(`Created company: ${company.name}`);
    
    // Create 2 employees per company
    for (let j = 0; j < 2; j++) {
      await prisma.employee.create({
        data: {
          companyId: company.id,
          name: `Empleado ${j + 1} de ${company.name}`,
          email: `empleado${j+1}@${company.name.toLowerCase().replace(/\s+/g, '')}.es`,
          role: j === 0 ? 'Gerente' : 'Recursos Humanos',
          isActive: true
        }
      });
    }

    // Create an interview flow
    const flow = await prisma.interviewFlow.create({
      data: {
        description: `Proceso de entrevista ${i + 1}`
      }
    });

    // Create interview types
    const type1 = await prisma.interviewType.create({
      data: {
        name: 'Entrevista Técnica',
        description: 'Evaluación de habilidades técnicas'
      }
    });

    const type2 = await prisma.interviewType.create({
      data: {
        name: 'Entrevista Personal',
        description: 'Evaluación de habilidades blandas'
      }
    });

    // Create steps for the flow
    await prisma.interviewStep.create({
      data: {
        interviewFlowId: flow.id,
        interviewTypeId: type1.id,
        name: 'Paso 1',
        orderIndex: 1
      }
    });

    await prisma.interviewStep.create({
      data: {
        interviewFlowId: flow.id,
        interviewTypeId: type2.id,
        name: 'Paso 2',
        orderIndex: 2
      }
    });

    // Create 2 positions per company
    for (let j = 0; j < 2; j++) {
      await prisma.position.create({
        data: {
          companyId: company.id,
          interviewFlowId: flow.id,
          title: jobTitles[Math.floor(Math.random() * jobTitles.length)],
          description: `Descripción del puesto ${j + 1}`,
          status: 'Activa',
          isVisible: true,
          location: cities[Math.floor(Math.random() * cities.length)],
          jobDescription: `Descripción detallada del trabajo ${j + 1}. Este puesto requiere habilidades específicas.`,
          requirements: `Requisitos para el puesto ${j + 1}`,
          responsibilities: `Responsabilidades del puesto ${j + 1}`,
          salaryMin: 30000,
          salaryMax: 50000,
          employmentType: 'Tiempo completo',
          benefits: `Beneficios para el puesto ${j + 1}`,
          applicationDeadline: new Date(new Date().setMonth(new Date().getMonth() + 2)),
          contactInfo: `info@${company.name.toLowerCase().replace(/\s+/g, '')}.es`
        }
      });
    }
  }

  // Create 5 candidates
  for (let i = 0; i < 5; i++) {
    const firstName = `Nombre${i + 1}`;
    const lastName = `Apellido${i + 1}`;
    
    const candidate = await prisma.candidate.create({
      data: {
        firstName,
        lastName,
        email: `${firstName.toLowerCase()}.${lastName.toLowerCase()}@example.es`,
        phone: `+34 6${Math.floor(Math.random() * 10000000).toString().padStart(8, '0')}`,
        address: `Calle Ejemplo ${i + 1}, Madrid`
      }
    });
    
    console.log(`Created candidate: ${candidate.firstName} ${candidate.lastName}`);
    
    // Create education for each candidate
    await prisma.education.create({
      data: {
        candidateId: candidate.id,
        institution: 'Universidad de Madrid',
        title: 'Ingeniería Informática',
        startDate: new Date(2015, 9, 1),
        endDate: new Date(2019, 6, 30)
      }
    });
    
    // Create work experience for each candidate
    await prisma.workExperience.create({
      data: {
        candidateId: candidate.id,
        company: `Empresa Anterior ${i + 1}`,
        position: jobTitles[Math.floor(Math.random() * jobTitles.length)],
        description: `Experiencia en ${jobTitles[Math.floor(Math.random() * jobTitles.length)]}`,
        startDate: new Date(2019, 7, 1),
        endDate: new Date()
      }
    });
    
    // Create resume for each candidate
    await prisma.resume.create({
      data: {
        candidateId: candidate.id,
        filePath: `/uploads/resumes/${candidate.id}.pdf`,
        fileType: 'application/pdf',
        uploadDate: new Date()
      }
    });
  }

  // Get all positions and candidates for applications
  const positions = await prisma.position.findMany();
  const candidates = await prisma.candidate.findMany();
  
  // Create 10 applications
  for (let i = 0; i < 10; i++) {
    const position = positions[Math.floor(Math.random() * positions.length)];
    const candidate = candidates[Math.floor(Math.random() * candidates.length)];
    
    const application = await prisma.application.create({
      data: {
        positionId: position.id,
        candidateId: candidate.id,
        applicationDate: new Date(),
        status: ['Pendiente', 'En revisión', 'Entrevista programada'][Math.floor(Math.random() * 3)],
        notes: `Notas para la aplicación ${i + 1}`
      }
    });
    
    console.log(`Created application for position: ${position.title}`);
  }

  console.log('Seeding completed');
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  }); 