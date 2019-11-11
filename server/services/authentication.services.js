const mysql = require('../lib/mysql');
const _ = require('lodash');
const mysqlFileHelper = require('../lib/mysql-file-helper');
// var execsql = require('execsql');

exports.addNewCompany = async(req) => {
  let sql = 'INSERT INTO multitenant_master.companies (company_name, db_user, db_password) VALUES (?, ?, ?)'
  let data = [_.get(req, 'body.company', null), _.get(req, 'body.username', null), _.get(req, 'body.password', null)];
  await mysql.query(sql, data);
}

exports.populateDB = async(dbName) => {
  let dbConfig = {
		host: 'localhost',
		port: 3306, // optional, default is 3306
		user: 'root',
		password: 'root'
  };
  const createSql = `create database ${dbName}`
  const sql = `use ${dbName}`,
	sqlFile = __dirname + '/timer-schema.sql';

  await mysqlFileHelper.config(dbConfig);
  await mysqlFileHelper.exec(createSql);
  await mysqlFileHelper.exec(sql);
  await mysqlFileHelper.execFile(sqlFile);
  await mysqlFileHelper.end();
}
