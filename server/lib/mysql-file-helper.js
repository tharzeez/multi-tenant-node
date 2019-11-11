var fs = require('fs'),
	_ = require('underscore'),
	mysql = require('mysql'),
	config = {
		multipleStatements: true,
		connectTimeout: 0,
	},
	conn;
const util = require('util');
const readFile = util.promisify(fs.readFile);

exec = async(sql) => {
	try {
		const query = util.promisify(conn.query).bind(conn);
		await query(sql)
		return this;
	} catch (error) {
		console.log(error);
	}
}

execFile = async (filename, callback) => {
	let data = await readFile(filename, 'utf8');
	await exec(data);
	return this;
}

exports.exec = exec;
exports.execFile = execFile;
exports.end = function () {
	conn.end();
	return this;
};
exports.config = function (options) {
	_.extend(config, _.pick(options, ['host', 'port', 'user', 'password']));
	conn = mysql.createConnection(config);
	conn.connect();
	return this;
};
