import mongoose from 'mongoose';

const LessonSchema = mongoose.Schema({

    name: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    video: {
        type: String,
    },
    duration: {
        type: Number,
    },
    course: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Course'
    },
    status: {
        type: String,
        enum: ['completed', 'in-progress', 'not-started'],
        default: 'not-started'
    },
    level: {
        type: String,
        enum: ['beginner', 'intermediate', 'advanced'],
        required: true
    },
}, { timestamps: true });

const Lesson = mongoose.model('Lesson', LessonSchema);

export default Lesson;