
import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable } from "typeorm";
import { Student } from "./Student";
import { Grade } from "./Grade";

@Entity()
export class Course {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  title: string;

  @Column()
  courseCode: string;

  @Column()
  description: string;

  @Column()
  creditHours: number;


  @ManyToMany(() => Grade, grade => grade.courses)
  @JoinTable()
  grades: Grade[];

  @ManyToMany(() => Student)
  @JoinTable()
  enrolledStudents: Student[];
}
