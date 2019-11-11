'use strict';

var http = require('http');

module.exports = function(req, res, next) {
    // request
    req.getContentType = function() {
        return req.get('Content-Type');
    };

    res.success = (res, data) => {
        return res.status(200).json({
            status: 'success',
            code: 200,
            data: data || null,
        });
    };

    res.fail = (res, data) => {
        res.status(400).json({
            status: 'fail',
            code: 400,
            message: data || null,
        });
    };

    res.message = (res, code, message) => {
        res.status(code).json({
            status: 'fail',
            code: code || 400,
            message: message || null,
        });
    };

    res.authenticationError = (res, code, message) => {
        res.status(code).json({
            status: 'fail',
            message: message || null,
            code: code || 401,
        });
    };

    res.error = (res, code, message) => {
        res.status(code).json({
            status: 'error',
            code: code || 500,
            message: message || null,
        });
    };

    res.successMessage = (res, message) => {
        res.status(200).json({
            status: 'success',
            code: 200,
            message: message || null,
        });
    };

    // response
    res.sendInvalidUsernameOrPassword = function() {
        return res.status(401).send({
            status: 'error',
            code: 401,
            message: 'Please enter valid credentials',
            request_id: req.requestId,
        });
    };

    res.sendUnverfiedUser = function() {
        return res.status(401).send({
            status: 'fail',
            code: 401,
            data: null,
            message: 'Account has not been activated. Please activate the account by clicking on the link.',
            request_id: req.requestId,
        });
    };

    res.sendInvalidLogin = function() {
        return res.status(401).send({
            status: 'fail',
            code: 401,
            message: 'Invalid Login Credentials',
            request_id: req.requestId,
        });
    };

    res.sendJson = function(status, object) {
        res.status(status).json(object);
    };

    res.sendJsonHttpMessage = function(status, data) {
        res.sendJson(status, {
            message: http.STATUS_CODES[status],
            data: data,
        });
    };

    res.sendJsonHttpMessageWithError = function(res, status, err) {
        res.sendJson(status, {
            status: status,
            request_id: req.requestId,
            data: null,
            error: err,
        });
    };

    res.sendBadRequest = function(res, err) {
        res.sendJsonHttpMessageWithError(res, 400, err);
    };

    res.sendUnauthorize = function() {
        res.sendJsonHttpMessage(401);
    };

    res.sendNoContent = function(res, message) {
        return res.status(204).send({
            status: 'fail',
            code: 204,
            message: message || null,
        });
    };

    res.sendConflict = function(data) {
        return res.status(409).send({
            status: 'error',
            code: 409,
            message: 'Email already registered',
        });
    };

    res.sendConflictError = function(message) {
        return res.status(409).send({
            status: 'error',
            code: 409,
            message: message,
        });
    };

    res.sendNotFound = function() {
        res.sendJsonHttpMessage(404);
    };

    res.sendData = function(data, message) {
        res.sendJson(200, {
            status: "success",
            code: 200,
            request_id: req.requestId,
            data: data,
            message: message || null,
        });
    };
    next();
};
