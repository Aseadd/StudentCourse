import { Router } from 'express';
import { Request, Response } from 'express';
import { AppDataSource } from '../data-source';
import { getRepository } from 'typeorm';
import { Course } from '../entity/Course';
import { Student } from '../entity/Student';

const router = Router();

// Get all students
router.get('/api/students', async (req:Request, res: Response) => {

  const { f, r, st, sc, sd } = req.query;

  const studentRepository = await AppDataSource.getRepository(Student)
  .createQueryBuilder('student')
  .leftJoinAndSelect('student.courses', 'course')
  .leftJoinAndSelect('course.grades', 'grade')
  .getMany();
console.log("The response from student fetch query is ", studentRepository);

studentRepository.forEach((student) => {
  console.log(`Student: ${student.name}`);
  student.courses.forEach((course) => {
    console.log(`Course: ${course.title}`);
    course.grades.forEach((grade) => {
      console.log(`Grade: ${grade.letterGrade}`);
    });
  });
});


  return res.json(studentRepository)
})


// Create a new student
router.post('/api/students', async (req: Request, res: Response) => {
  const {
    name,
    contactDetails,
    academicRecord,
  } = req.body;

  const studentRepository = await AppDataSource.getRepository(Student).create(req.body);
  const results = await AppDataSource.getRepository(Student).save(studentRepository);
  return res.send(results);
  }
);

// Update an existing student
router.put('/api/students/:id', async (req: Request, res: Response) => {
  const studentRepository = await AppDataSource.getRepository(Student).findOne(req.params.id);
  if (studentRepository) {
    AppDataSource.getRepository(Student).merge(studentRepository, req.body);
    const results = await AppDataSource.getRepository(Student).save(studentRepository);
    return res.send(results);
  }
  return res.status(404).send({ message: 'Not found' });
});


// Delete a student
router.delete('/api/students/:id', async (req: Request, res: Response) => {
  const results = await AppDataSource.getRepository(Student).delete(req.params.id);
  return res.send(results);
});

export {router as StudentHandler}
