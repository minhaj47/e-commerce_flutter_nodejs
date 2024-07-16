const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');

dotenv.config();

const authMiddleware = async (req, res, next) => {
    try {
        const authorization = req.header('Authorization');
        // console.log(authorization);
        const token = authorization.split(' ')[1];
        // console.log(token);
        if (!token) {
            res.status(401).json({ message: 'No auth token: Access denied!' });
        }
        const verified = await jwt.verify(token, process.env.JWT_SECRET);
        if (!verified) {
            res.status(401).json({ message: 'Token verification failed!' });
        }
        const { id } = verified;
        req.user = id;
        next();
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: error.message });
    }
};

module.exports = authMiddleware;
