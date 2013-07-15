/**
 * rumexmarker.js
 *    
 *    Suchwörter die von der internen Suche gefunden wurden 
 *    hervorheben.
 */

// wenn das Dokument geladen ist Inhalt durchsuchen 
// und gefundenen Text hervorheben.
$(document).ready(function(){

	// Parameter der das Suchwort anzeigt :: S-uchwort-P-arameter
	var sp = "suchwort";

	var suchwort = "";

	// ID ab wann der Text eingelesen soll
	var suchid = "seite";

	// Klasse für die Markierung
	var marker = "marker";

	// Seiten Text
	var text = "";

	// URL GET Parameter auswerten
	var sx = location.search.replace('?', '').split('&').map(function(val){
		return val.split('=');
	});

	// Die einzelnen GET Parameter durchlaufen
	for(var i=0; i<sx.length; i++) {
		// Suchwort merken
		if (sx[i][0] == sp) {
			suchwort = sx[i][1];
		}
	}



	// Quelle: http://james.padolsey.com/javascript/highlighting-text-with-javascript/
	//
	highlight(document.getElementById(suchid),suchwort,marker);

	function highlight(container,what,spanClass) {
		var content = container.innerHTML,
			// Groß - Klein Schreibung beachten
			//pattern = new RegExp('(>[^<.]*)(' + what + ')([^<.]*)','g'),
			// Groß - Klein Schreibung NICHT beachten
			pattern = new RegExp('(>[^<.]*)(' + what + ')([^<.]*)','ig'),
			replaceWith = '$1<span ' + ( spanClass ? 'class="' + spanClass + '"' : '' ) + '">$2</span>$3',
					highlighted = content.replace(pattern,replaceWith);

					return (container.innerHTML = highlighted) !== content;
					}

					// ENDE jQuery
					});

