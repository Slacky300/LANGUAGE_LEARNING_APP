import { Router } from "express";

import * as languageController from "../controllers/language.controller.js";

const languageRouter = Router();

languageRouter.post("/", languageController.createALanguage);
languageRouter.get("/", languageController.getAllLanguages);

export default languageRouter;