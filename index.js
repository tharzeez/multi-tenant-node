require('dotenv').config();

const express = require('express');
const AuthenticRoute = require('./server/routes/authentication.routes');
const bodyParser = require('body-parser');

const app = express();

const port = 3000;

app.use(require('./server/middleware'));
app.use(bodyParser.json({ limit: '100mb' }));

app.get('/', (req, res) => res.send('Hello World!'));


const router = express.Router();
app.use('/api', router);
AuthenticRoute.init(router);

app.listen(port, () => console.log(`Multi tenant listening on port ${port}!`));
