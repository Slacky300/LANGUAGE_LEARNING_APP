import express from 'express';
import { register, login, verifyemail, getUsers, getMyProfile } from '../controllers/user.controller.js';
import validateToken from '../middlewares/auth.middleware.js';


const userRouter = express.Router();


userRouter.route('/register').post(register);
userRouter.route('/verifyemail/:tokenId').get(verifyemail);
userRouter.route('/login').post(login);
userRouter.route('/get-my-profile').get(validateToken, getMyProfile);
userRouter.get('/get-all-users', getUsers)

export default userRouter;