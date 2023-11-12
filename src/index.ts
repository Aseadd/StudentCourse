import cors from "cors"
import express from "express"
import bodyParser from "body-parser"
import { AppDataSource } from "./data-source"
import { courseRouter } from "./handler/CourseHandler"
import { StudentHandler } from "./handler/StudentHandler"
import { GradeHandler } from "./handler/GradeHandler"
import { Course } from "./entity/Course"
import { Student } from "./entity/Student"
import { User } from "./entity/User"


const app = express()

AppDataSource.initialize().then(async () => {

    console.log("Inserting a new user into the database...")
    app.use(express.json())
    app.use(bodyParser.json())
    app.use(cors())
    app.use("/", courseRouter)
    app.use("/", StudentHandler)
    app.use("/", GradeHandler)
    app.listen(3001, () => {
        console.log("Server is running at http://localhost:3001")
    })

}).catch(error => console.log(error))
