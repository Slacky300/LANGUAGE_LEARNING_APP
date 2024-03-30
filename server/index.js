import express from 'express';
import dbConnect from './utils/dbConnect.js';
import cors from 'cors';
import userRouter from './routes/user.routes.js';
import languageRouter from './routes/language.routes.js';
import courseRouter from './routes/course.routes.js';
import lessonRouter from './routes/lesson.routes.js';


const app = express();
const PORT = process.env.PORT || 8000;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(cors());


const startServer = () =>  app.listen(PORT, async () => {
  await dbConnect();
  console.log(`Server is running on http://localhost:${PORT} 👌`);
});

startServer();


app.use('/api/v1/users', userRouter);
app.use('/api/v1/languages', languageRouter);
app.use('/api/v1/courses', courseRouter);
app.use('/api/v1/lessons', lessonRouter);