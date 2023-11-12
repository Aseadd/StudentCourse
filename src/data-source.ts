import "reflect-metadata"
import { DataSource } from "typeorm"
import express from "express";
import cors from "cors";
import { User } from "./entity/User"
import { Student } from "./entity/Student"
import { Course } from "./entity/Course"
import { Grade } from "./entity/Grade"

// const logger = require('./middleware/Logger')
// const app = express()
// app.use(logger)
// app.use(express.json())
// app.use(cors())

// app.use("/students", require("./handler/StudentHandler"))
// app.use("/courses", require("./handler/StudentHandler"))

export const AppDataSource = new DataSource({
    type: "mysql",
    host: "localhost",
    port: 3306,
    username: "root",
    password: "root",
    database: "shega",
    synchronize: true,
    logging: false,
    entities: [User, Student, Course, Grade],
    migrations: [],
    subscribers: [],


})


// app.use(express.json())
// app.use(cors())
// app.use("/students", require("./handler/StudentHandler"))
// app.use("/courses", require("./handler/CourseHandler"))
// app.use("/grades", require("./handler/GradeHandler"))






