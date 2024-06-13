const jwt = require('jsonwebtoken');

const checkLogin = async (req, res, next) => {
    try {
        const { authentication } = req.headers;
        const token = authentication.split(' ')[1];
        const decoded = await jwt.verify(token, process.env.JWT_SECRET);
        const { id, name } = decoded;

        req.id = id;
        req.name = name;
        next();
    } catch (error) {
        req.send(error);
    }
};

module.exports = checkLogin;
