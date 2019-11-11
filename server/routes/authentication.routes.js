

'use strict';

const authentication = require('../controllers/authentication.controller');

function init(router) {
  router.post('/register', authentication.register);
}

module.exports.init = init;
