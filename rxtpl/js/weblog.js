/* Rumex Weblog Erweiterung */


$(document).ready(function() {

	/* Dokument vorbereiten */

	// Texte im div.weblog Tags ausblenden
	$("#seite div.weblog").hide();

	// Überschrift h1 als Link simulieren  
	// Cursor ändern
	$("h1").css("cursor","pointer");
	// ... und beim überfahren unterstreichen
	$("h1").hover(
		function(){
			$(this).css("text-decoration","underline")
		},
		function() {
			$(this).css("text-decoration","none")
		});

	// "weiter lesen" Link vor den ausgeblendeten Text .weblog einbauen
	//	Der <a> tag wurde eingebaut um auch die F Taste von vrome
	//	zu unterstützen. Bei pentadactyl funktioniert
	//	dieser Trick leider nicht da hier der komplette TAG
	//	<a href=""></a>	vorhanden sein muss und dieser beißt sich mit
	//	der js Funktion.
	$('<p class="weiter_lesen"><a>...&nbsp;weiter lesen</a></p>').insertBefore("div.weblog");

	// ...und Text als Link formatieren
	$(".weiter_lesen").css("text-decoration","underline");
	$(".weiter_lesen").css("color","#0000EE");
	$(".weiter_lesen").css("cursor","pointer");





	// Zeile "am Datum um Uhrzeit schrieb Autor"
	// formatieren.
	//	
	/** Ausgeschaltet wegen Fehler bei
	 *		Texten die im ersten Absatz eine kursive 
	 *		Auszeichnung haben.
	$("h1+p>em").css("display","block");
	//$("h1+p>em").css("text-align","right");
	$("h1+p>em").css("font-size",".8em");
	$("h1+p>em").css("margin-right","4em");
	$("h1+p>em").css("color","gray");
*/



	/* Einblenden */

	// klick auf die Überschrift h1
	$("#seite h1").click(function() {
		// "... weiter lesen" Link ausblenden
		$(this).nextAll(".weiter_lesen").first().hide('500',function(){
			// ...und Text in div.weblog einblenden
			$(this).nextAll("div.weblog").first().slideDown(1500);
		});
	});

	// klick auf Link "weiter lesen"
	$('.weiter_lesen').click(function() {
		// "... weiter lesen" Link ausblenden
		$(this).hide('500', function(){
			// ...und Text in div.weblog einblenden
			$(this).next().slideDown(1500);
		});
	});
});
