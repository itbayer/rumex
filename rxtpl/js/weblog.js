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



	/* Einblenden 
	 * ... weiter lesen
	 */

	// klick auf die Überschrift h1
	$("#seite h1").click(function() {

		$(this).nextAll("div.weblog").first().slideDown(500);
$(this).nextAll(".weiter_lesen").first().slideUp(500);
	});

	// klick auf Link "weiter lesen"
	$('.weiter_lesen').click(function() {
		$(this).next().slideDown(500)
		$(this).slideUp(500);
	});
});
