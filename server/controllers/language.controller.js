import Language from "../models/language.model.js";


export const createALanguage = async (req, res) => {
    try{
        const {name, code} = req.body;

        if (!name || !code) {
            res.status(400).send({ message: "Content can not be empty!" });
            return;
        }

        const newLanguage = await Language.create({name, code});
        res.status(201).json(newLanguage);
        
    }catch(err){
        res.status(500).json({ message: err.message });
    }   
}

export const getAllLanguages = async (req, res) => {
    try{
        const languages = await Language.find();
        res.status(200).json({languages});
    }catch(err){
        res.status(500).json({ message: err.message });
    }
}