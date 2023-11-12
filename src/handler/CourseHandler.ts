import express from 'express';
import { Request, Response } from "express"
import { AppDataSource } from '../data-source';
import { Course } from '../entity/Course';


const router = express.Router();

// Create a new course
router.post('/api/courses', async (req: Request, res: Response) => {
  const {
    title,
    courseCode,
    description,
    creditHours,
  } = req.body;

  const courseRegistory = await AppDataSource.getRepository(Course).create(req.body);
  const results = await AppDataSource.getRepository(Course).save(courseRegistory);
  return res.send(results);
  }
);


// Get all courses
router.get('/api/courses', async (req: Request, res: Response) => {
  // const results = await AppDataSource.getRepository(Course)
  // .createQueryBuilder('course')
  // .leftJoinAndSelect('course.students', 'students')
  // .leftJoinAndSelect('course.grades', 'grades')
  // .getMany();

  const courses = await AppDataSource.getRepository(Course)
  .createQueryBuilder('course')
  .leftJoinAndSelect('course.enrolledStudents', 'student')
  .leftJoinAndSelect('course.grades', 'grade')
  .getMany();

  console.log("Course -student list", courses)

  courses.forEach(course => {
    console.log(`Course: ${course.title}`);
    course.enrolledStudents.forEach(student => {
      console.log(`Student: ${student.name}`);
      course.grades.forEach(grade => {
        console.log( `Grade: ${grade.letterGrade}`)
      });
    });
  })

  return res.json(courses);
});

// Get course by id
router.get('/api/courses/:id', async (req: Request, res: Response) => {
  const results = await AppDataSource.getRepository(Course).findOne(req.params.id);
  return res.json(results);
});

// Update course by id

router.put('/api/courses/:id', async (req: Request, res: Response) => {
  const course = await AppDataSource.getRepository(Course).findOne(req.params.id);
  if (course) {
    AppDataSource.getRepository(Course).merge(course, req.body);
    const results = await AppDataSource.getRepository(Course).save(course);
    return res.send(results);
  }
  return res.status(404).send({ message: 'Not found' });
});

// Delete course by id

router.delete('/api/courses/:id', async (req: Request, res: Response) => {
  const results = await AppDataSource.getRepository(Course).delete(req.params.id);
  return res.send(results);
});


export { router as courseRouter}

