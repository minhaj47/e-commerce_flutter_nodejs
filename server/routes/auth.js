// importing packages
const express = require('express');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');

dotenv.config();

// importing other files
const User = require('../model/user');
const authMiddleware = require('../middleware/auth_middleware');

// init
const authRouter = express.Router();

// Sign UP
authRouter.post('/api/sign-up', async (req, res) => {
    try {
        const { name, email, password } = req.body;

        const existingUser = await User.findOne({ email });
        let message;

        if (existingUser) {
            message = 'Your Email is already registered!';
            console.log(message);
            return res.status(400).json({
                message,
            });
        }

        const hashedPassword = await bcryptjs.hash(password, 10);
        // console.log(`${password} ${hashedPassword}`);

        let user = new User({ name, email, password: hashedPassword });
        user = await user.save();

        console.log('Account Created!');

        return res.json({
            user,
        });
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
});

// Sign IN

authRouter.post('/api/sign-in', async (req, res) => {
    try {
        const { email, password } = req.body;

        const user = await User.findOne({ email });

        if (!user) {
            return res.status(400).json({
                message: 'Your Email is not registered!\nPlease Create an Account first.',
            });
        }

        const isMatched = await bcryptjs.compare(password, user.password);

        if (isMatched) {
            const token = jwt.sign(
                {
                    id: user._id,
                    name: user.name,
                },
                process.env.JWT_SECRET,
                // eslint-disable-next-line prettier/prettier
                { expiresIn: '100h' },
            );

            return res.json({
                // eslint-disable-next-line no-underscore-dangle
                ...user._doc,
                token,
            });
        }
        return res.status(400).json({
            msg: 'Incorrect Password!',
        });
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
});

// get data

authRouter.get('/', authMiddleware, async (req, res) => {
    const user = await User.findById(req.user);
    if (!user) {
        return res.status(404).json({ message: 'User not found!' });
    }
    // eslint-disable-next-line no-underscore-dangle
    return res.json({ ...user._doc, token: req.user });
});

module.exports = authRouter;
