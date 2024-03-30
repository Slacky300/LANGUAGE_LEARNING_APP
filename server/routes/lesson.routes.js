import { Router } from "express";

import * as lessonController from "../controllers/lesson.controller.js";

const lessonRouter = Router();

lessonRouter.post("/", lessonController.createALesson);
lessonRouter.get("/:courseId", lessonController.getCourseLessons);

export default lessonRouter;