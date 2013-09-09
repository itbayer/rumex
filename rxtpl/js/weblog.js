/* Rumex Weblog Funktion */


jQuery(document).ready(function() {


	// Texte im weblog Tag ausblenden
//	$("#seite weblog").hide();
	
	// Überschriften raus suchen
	$("#seite h1").click(function() {
		$(this).next("p > weblog").css("border", "1px solid red");
		});

	});
