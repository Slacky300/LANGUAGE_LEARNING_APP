import mongoose from 'mongoose';

const LanguageSchema = mongoose.Schema({

    name: {
        type: String,
        required: true
    },
    code: {
        type: String,
        required: true
    },
    course: {
        type: mongoose.Schema.Types.ObjectId,
    },



}, { timestamps: true });

const Language = mongoose.model('Language', LanguageSchema);

export default Language;