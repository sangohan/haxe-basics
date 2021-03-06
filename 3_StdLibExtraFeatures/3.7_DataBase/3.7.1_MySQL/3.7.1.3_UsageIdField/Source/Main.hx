package;

// http://api.haxe.org/sys/db/Mysql.html
// http://api.haxe.org/sys/db/Connection.html

import sys.db.*;

class Main {
	public static function main () {
		var connData = {
			host: "localhost",
			port: 3306,
			user: "root",
			pass: "root",
			database: "testdb"
		};
		
		var conn = null;
		
		try {
			conn = Mysql.connect(connData);
		}
		catch (e:Dynamic) {
			trace('Connection failed with error: $e');
		}
		
		if (conn != null) {
			trace('Connected to database ${conn.dbName()}');
			
			conn.request("
				CREATE TABLE IF NOT EXISTS idtbl (
					id int(10) unsigned NOT NULL AUTO_INCREMENT,
						PRIMARY KEY (id),
						UNIQUE KEY idtbl_UNIQUE (id)
				)
			");
			
			for (i in 0...5) {
				conn.request('INSERT INTO idtbl () VALUES ()');
				trace('record id = ${conn.lastInsertId()}'); // get last inserted row id
			}
			
			conn.close();
		}
	}
}
