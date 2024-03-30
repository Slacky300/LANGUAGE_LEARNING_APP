import { Router } from "express";
import * as courseController from "../controllers/course.controller.js";

const courseRouter = Router();

courseRouter.post("/", courseController.createACourse);
courseRouter.get("/", courseController.getAllCourses);

export default courseRouter;

