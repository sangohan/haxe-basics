package;

import kha.System;

class Main {
	public static function main() : Void {
		System.init({ title: "Test", width: 550, height: 300 }, function () : Void {
			new KhaApplication();
		});
	}
}
