var SE = Application("System Events");

/* アクティブアプリケーションをこのスクリプトから一つ前に戻す */
SE.keyCode(48, {using: "command down"});
delay(0.1);

/* アクティブなアプリケーションを取得 */
var frontmost_apps = SE.processes().filter(function(p) {
	return p.frontmost();
});

/* ターミナルのウィドウがアクティブなら */
if(frontmost_apps.length && frontmost_apps[0].name() == 'Terminal') {

	/* 一つ前に使っていたアプリケーションに切り替え */
	SE.keyCode([48, 48], {using: "command down"});
	delay(0.1);

/* ターミナル以外のアプリケーションがアクティブなら */
} else {

	/* ターミナルをアクティブにする */
	var T = Application('Terminal');
	T.activate();
	delay(0.1);

	/* ターミナルのウィンドウがなければ */
	if(!T.windows().length) {
		/* 新規ウィンドウを作成 */
		SE.keystroke("n", {using: "command down"});
	}

	/* 念のためターミナルをアクティブにする */
	T.activate();
}
