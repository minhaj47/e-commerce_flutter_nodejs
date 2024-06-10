// importing packages
const express = require('express');
const mongoose = require('mongoose');

// importing other files
const authRouter = require('./routes/auth');

// init
const PORT = 3000;
const DB =
    'mongodb+srv://minhaj47:alupotol@e-commerce.xuratvb.mongodb.net/?retryWrites=true&w=majority&appName=e-commerce';
const app = express();

// middleware
app.use(express.json());
app.use(authRouter);

// functions
mongoose
    .connect(DB)
    .then(console.log('Connected to mongodb'))
    .catch((e) => {
        console.log(e);
    });

app.listen(PORT, () => {
    console.log(`server is connected to ${PORT}`);
});
