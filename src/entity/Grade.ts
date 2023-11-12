import { Entity, Column, ManyToMany, JoinTable, PrimaryGeneratedColumn, ManyToOne } from 'typeorm';
import { Course } from './Course';
import { Student } from './Student';

@Entity()
export class Grade {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    letterGrade: string;

    @ManyToMany(() => Course, course => course.grades)
    courses: Course[];

    @ManyToOne(() => Student, student => student.grades)
    student: Student;

}