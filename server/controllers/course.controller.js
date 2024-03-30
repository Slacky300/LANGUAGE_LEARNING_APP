import Course from "../models/course.model.js";

export const createACourse = async (req, res) => {
    try{
        const {name, code, language, description} = req.body;

        if (!name || !code || !language || !description) {
            res.status(400).send({ message: "Content can not be empty!" });
            return;
        }

        const newCourse = await Course.create({name, code, language, description});
        res.status(201).json(newCourse);
        
    }catch(err){
        res.status(500).json({ message: err.message });
    }   
}

export const getAllCourses = async (req, res) => {
    try{
        const courses = await Course.find();
        res.status(200).json({courses});
    }catch(err){
        res.status(500).json({ message: err.message });
    }
}