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
    // const user = new User()
    // user.firstName = "Timber"
    // user.lastName = "Saw"
    // user.age = 25
    // await AppDataSource.manager.save(user)
    // console.log("Saved a new user with id: " + user.id)

    // console.log("Loading users from the database...")
    // const users = await AppDataSource.manager.find(User)
    // console.log("Loaded users: ", users)

    // console.log("Here you can setup and run express / fastify / any other framework.")

    const course = new Course()
    course.title = "Programming"
    course.courseCode = "SE101"
    course.description = "Programming Language"
    course.creditHours = 3
    await AppDataSource.manager.save(course)
    console.log("Saved a new course with id: " + course.id)

    const student = new Student()
    student.name = "Eyob"
    student.contactDetails = "0911121212"
    student.academicRecord = "Excellent"
    await AppDataSource.manager.save(student)
    console.log("Saved a new student with id: " + student.id)

    


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
