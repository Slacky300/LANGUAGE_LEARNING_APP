import mongoose from "mongoose";

const UserProgressSchema = mongoose.Schema({

    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    },
    course: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Course'
    },
    lesson: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Lesson'
    },
    status: {
        type: String,
        enum: ['completed', 'in-progress', 'not-started'],
        default: 'not-started'
    },
    score: {
        type: Number,
        default: 0
    },
    maxScore: {
        type: Number,
        default: 0
    },
    percentage: {
        type: Number,
        default: 0
    },
    duration: {
        type: Number,
        default: 0
    },
    lastViewedAt: {
        type: Date,
    },
    startedAt: {
        type: Date,
    },
    completedAt: {
        type: Date,
    },
}, { timestamps: true });

const UserProgress = mongoose.model('UserProgress', UserProgressSchema);

export default UserProgress;