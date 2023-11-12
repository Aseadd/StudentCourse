
import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable } from "typeorm";
import { Course } from "./Course";
import { Grade } from "./Grade";

@Entity()
export class Student {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    contactDetails: string;

    @Column()
    academicRecord: string;

    @ManyToMany(() => Grade, grade => grade.courses)
    @JoinTable()
    grades: Grade[];

    @ManyToMany(() => Course, course => course.enrolledStudents)
    @JoinTable()
    courses: Course[];
}

