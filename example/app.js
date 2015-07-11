
var safariDialog = require('Ti.SafariDialog');
Ti.API.info("module is => " + safariDialog);

var win = Titanium.UI.createWindow({  
    title:'Demo', backgroundColor:'#fff',layout:'vertical'
});

var btnOpenDialog = Ti.UI.createButton({
	top:20, title:'Open Safari Dialog',
	height:60, width:Ti.UI.FILL
});
win.add(btnOpenDialog);

btnOpenDialog.addEventListener('click',function(d){
	safariDialog.open({
		url:"http://appcelerator.com",
		title:"Hello World",
		tintColor:"red"
	});
});

safariDialog.addEventListener("opened",function(e){
	console.log("opened: " + JSON.stringify(e));
});

safariDialog.addEventListener("closed",function(e){
	console.log("closed: " + JSON.stringify(e));
});

win.open();
