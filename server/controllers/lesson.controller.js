import Lesson from "../models/lessons.model.js";

export const createALesson = async (req, res) => {
    try{
        const {name, description, duration, course, level} = req.body;

        if (!name || !description || !duration || !course || !level) {
            res.status(400).send({ message: "Content can not be empty!" });
            return;
        }

        const newLesson = await Lesson.create({name, description, duration, level, course});
        res.status(201).json(newLesson);
        
    }catch(err){
        res.status(500).json({ message: err.message });
    }   
}

export const getCourseLessons = async (req, res) => {
    try{
        const {courseId} = req.params;
        console.log('courseId: ', courseId)
        const lessons = await Lesson.find({course: courseId});
        res.status(200).json(lessons);
    }catch(err){
        res.status(500).json({ message: err.message });
    }
}