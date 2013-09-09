/* Rumex Weblog Funktion */


$(document).ready(function() {


	// Texte im weblog Tag ausblenden
	$("#seite div.weblog").hide();
	$("h1").css("cursor","pointer");
	
	// Überschriften raus suchen
	$("#seite h1").click(function() {
        $(this).nextAll("div.weblog").first().toggle();
		});

	});
