import { Router } from 'express';
import { Request, Response } from "express"
import { AppDataSource } from '../data-source';
import { Grade } from '../entity/Grade';

const router = Router();

// get all grades
router.get('/api/grades', async (req: Request, res: Response) => {
  const results = await AppDataSource.getRepository(Grade).find();
  return res.json(results);
});

// get grade by id
router.get('/api/grades/:id', async (req: Request, res: Response) => {
  const results = await AppDataSource.getRepository(Grade).findOne(req.params.id);
  return res.json(results);
});

// create a new grade
router.post('/api/grades', async (req: Request, res: Response) => {
  const {
    grade,
    studentId,
    courseId,
  } = req.body;

  // validate incoming data 
  if(!grade) {
    return res.status(400).send({ message: 'grade is required' });
  }
  if(!studentId) {
    return res.status(400).send({ message: 'studentId is required' });
  }
  if(!courseId) {
    return res.status(400).send({ message: 'courseId is required' });
  }
  

  const gradeRegistory = await AppDataSource.getRepository(Grade).create(req.body);
  const results = await AppDataSource.getRepository(Grade).save(gradeRegistory);
  return res.send(results);
  }
);

// update grade by id
router.put('/api/grades/:id', async (req: Request, res: Response) => {
  const grade = await AppDataSource.getRepository(Grade).findOne(req.params.id);
  if (grade) {
    AppDataSource.getRepository(Grade).merge(grade, req.body);
    const results = await AppDataSource.getRepository(Grade).save(grade);
    return res.send(results);
  }
  return res.status(404).send({ message: 'Not found' });
});

// delete grade by id
router.delete('/api/grades/:id', async (req: Request, res: Response) => {
  const results = await AppDataSource.getRepository(Grade).delete(req.params.id);
  return res.send(results);
});


export {router as GradeHandler}
