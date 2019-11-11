'use strict';

var Promise = require('bluebird'),
    getConnection = require('./db'),
    mysql = {};
const connection = require('./db');
const _ = require('lodash');

mysql.query = (query, data) => {
    return Promise.using(getConnection(), (conn) => {
        return conn.queryAsync(query, data);
    });
};

mysql.queryArray = (query, data) => {
    return Promise.using(getConnection(), (conn) => {
        return conn.queryAsync(query, [data]);
    });
};

mysql.findOne = (query, data) => {
    return Promise.using(getConnection(), (conn) => {
        return conn.queryAsync(query, data)
            .then(row => {
                return _.isEmpty(row) ? null : row[0];
            })
            .catch(err => {
                console.log(err);
            });
    });
};

mysql.findAll = (query, data) => {
    return Promise.using(getConnection(), (conn) => {
        return conn.queryAsync(query, data);
    });
};

module.exports = mysql;
