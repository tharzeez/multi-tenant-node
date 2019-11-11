'use strict';

const mysql = require('mysql');
const _ = require('lodash');
const Promise = require('bluebird');
Promise.promisifyAll(require('mysql/lib/Connection').prototype);
Promise.promisifyAll(require('mysql/lib/Pool').prototype);

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    // database: process.env.DB_NAME,
    connectionLimit: 5,
    supportBigNumbers: true,
});

function getSqlConnection() {
    return pool.getConnectionAsync().disposer(function(connection) {
        connection.release();
    });
}

module.exports = getSqlConnection;
