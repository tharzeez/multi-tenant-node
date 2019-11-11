
const authenticationService = require('../services/authentication.services');
const _ = require('lodash');

exports.register = async(req, res)  => {
  try {
    let response = await authenticationService.addNewCompany(req);
    await authenticationService.populateDB(_.get(req, 'body.username', 'testing-multi-tenant'));
    res.success(res, response);
  } catch (err) {
    return res.error(res, err.code || 500, err.message || err.stack || err);
  }
}
