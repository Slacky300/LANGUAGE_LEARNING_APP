import mongoose from 'mongoose';

const CourseSchema = mongoose.Schema({

    name: {
        type: String,
        required: true
    },
    code: {
        type: String,
        required: true
    },
    language: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Language'
    },
    description: {
        type: String,
        required: true
    },
    duration: {
        type: Number,
    },
    lessons: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Lesson'
    },
    price: {
        type: Number,
    },
    image: {
        type: String,
    },
    status: {
        type: String,
        enum: ['completed', 'in-progress', 'not-started'],
        default: 'not-started'
    },
    users_enrolled: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    }],
}, { timestamps: true });

const Course = mongoose.model('Course', CourseSchema);

export default Course;