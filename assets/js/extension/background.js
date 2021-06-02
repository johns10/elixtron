chrome.action.onClicked.addListener(function(tab) {
	chrome.windows.create({
		url: "https://dev.elixtron.com:4000",
		type: "popup"
	});
});