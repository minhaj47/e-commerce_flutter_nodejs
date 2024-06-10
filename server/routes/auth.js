// importing packages
const express = require('express');
const bcryptjs = require('bcryptjs');

// importing other files
const User = require('../model/user');

// init
const authRouter = express.Router();

// functions
authRouter.post('/api/signUp', async (req, res) => {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });

    if (existingUser) {
        return res.status(400).json({
            name,
            email,
            password,
        });
    }

    let user = new User({ name, email, password });

    user = await user.save();

    return res.json({
        user,
    });
});

module.exports = authRouter;
