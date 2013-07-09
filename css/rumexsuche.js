/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	+               OfflineSearchEngine JavaScript  v2.0                   +
	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	+ Copyright (C) 2004-10 by Michael Loesler, http://derletztekick.com   +
	+                                                                      +
	+                                                                      +
	+ This program is free software; you can redistribute it and/or modify +
	+ it under the terms of the GNU General Public License as published by +
	+ the Free Software Foundation; either version 2 of the License, or    +
	+ (at your option) any later version.                                  +
	+                                                                      +
	+ This program is distributed in the hope that it will be useful,      +
	+ but WITHOUT ANY WARRANTY; without even the implied warranty of       +
	+ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        +
	+ GNU General Public License for more details.                         +
	+                                                                      +
	+ You should have received a copy of the GNU General Public License    +
	+ along with this program; if not, write to the                        +
	+ Free Software Foundation, Inc.,                                      +
	+ 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.            +
	+                                                                      + 
	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	

	var JSSearchEngine = {
		httpRequest : false,
		keyWords : new Array(),
		sites2search : new Array(),
		searchForm : null,
		tbody : null,
		pEl : null,
		index : 0,
		hasResult : false,
		searchrangestart : null,
		searchrangeend : null,
		searchMode : 1,
		fileContens : new Array(),
		firstSearch : true,
		UseHTTP_GET : false,
		init : function(start, end, uhg, s2s) {
			if (!(this.pEl = document.getElementById("rumexsuche")) || !(this.searchForm = document.forms["rumexsuche"]))
				return false;
			
			if (window.ActiveXObject) {
				try {
					this.httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						this.httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						window.alert("Fehler "+e);
						return false;
					}
				}
			}
			else if (window.XMLHttpRequest) 
				this.httpRequest = new XMLHttpRequest();
			
			this.searchrangestart = start==null?"<body>":start;
			this.searchrangeend = end==null?"</body>":end;
			
			this.UseHTTP_GET = uhg;
			
			if (typeof(s2s) == "object")
				this.sites2search = s2s;
			
			var querys = this.getParameters();
			if (this.UseHTTP_GET && querys != false && typeof(querys["q"]) != "undefined") {
				this.reset();
				this.searchForm.elements["q"].value = querys["q"].replace(/\+/g," ");

				if (typeof(querys["mode"]) != "undefined" && !isNaN(parseInt(querys["mode"])))
					this.searchForm.elements["mode"][ (parseInt(querys["mode"])>=this.searchForm.elements["mode"].length?0:parseInt(querys["mode"]))].checked = true;
				this.searchMode = this.getSearchMode();
				this.getKeywords();
				
				if (this.fileContens.length > 0)
					this.firstSearch = false;
				this.pEl.replaceChild(document.createTextNode(""), this.pEl.firstChild);
				if (this.keyWords.length > 0){
					this.createResultTable();
					this.searchPage();
				}
			}
			
			this.searchForm.Instanz = this;
			this.searchForm.onsubmit = function(e) {
				this.Instanz.reset();
				this.Instanz.searchMode = this.Instanz.getSearchMode();
				this.Instanz.getKeywords();
				
				if (this.Instanz.keyWords.length == 0){
					window.alert("Der Suchbegriff muss min. 3 Zeichen lang sein!");
					return false;
				}
				
				if (this.Instanz.UseHTTP_GET)
					return true;
					
				if (this.Instanz.fileContens.length > 0)
					this.Instanz.firstSearch = false;
				this.Instanz.pEl.replaceChild(document.createTextNode(""), this.Instanz.pEl.firstChild);
				
				if (this.Instanz.keyWords.length > 0){
					this.Instanz.createResultTable();
					this.Instanz.searchPage();
				}
				return false; 
			};
		},
		
		getParameters : function() {
			var q = window.location.search.substring(1).split('&');
			if(!q.length) 
				return false;
			var GET = new Object();
			for(var i=0; i<q.length; i++){
				var vars = q[i].split('=');
				try {
					GET[decodeURIComponent(vars[0])] = decodeURIComponent(vars[1]);
				}
				catch(e) {
					GET[unescape(vars[0])] = unescape(vars[1]);
				}
			}
			return GET;
		},
		
		reset : function() {
			this.index = 0;
			this.keyWords = new Array();
			this.hasResult = false;
		},
		
		getSearchMode : function() {
			for (var i=0; i<this.searchForm.elements["mode"].length; i++)
				if (this.searchForm.elements["mode"][i].checked)
					return i;
			return 0;
		},
		
		addResult : function() {
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			if (this.index < this.sites2search.length) {
				var a  = document.createElement("a");
				// ----------------------------------------------
				// Statt Dateiname den Titel als Link Text anzeigen.
				// orig :: a.appendChild(document.createTextNode( this.sites2search[this.index][1] ));
				// !! Wieder auf Dateiname zurück gestellt.
				a.appendChild(document.createTextNode( this.sites2search[this.index][1] ));


				// ---------------------------------------------------
				// Link Erweiterung raus genommen
				// orig :: a.href  = this.sites2search[this.index][1] + "?suchwort=" + this.replaceUmlauts(this.keyWords.join("&suchwort="), 1);
				a.href  = this.sites2search[this.index][1];

				a.title = this.sites2search[this.index][0];
				td.appendChild(document.createTextNode( this.sites2search[this.index][0] ));
				tr.appendChild(td);
				td = document.createElement("td");
				td.appendChild(a);
			}
			else if (!this.hasResult){
				td.colSpan = 2;
				td.appendChild(document.createTextNode("kein Treffer!"));
			}
			tr.appendChild(td);
			this.tbody.appendChild(tr);
			
		},
		
		createResultTable : function() {
			var table = document.createElement("table");
			var thead = document.createElement("thead");
			this.tbody = document.createElement("tbody");
			table.appendChild(thead);
			table.appendChild(this.tbody);
			
			var tr = document.createElement("tr");
			var th = document.createElement("th");
			th.appendChild(document.createTextNode("Seitentitel"));
			tr.appendChild(th);
			thead.appendChild(tr);

			var th = document.createElement("th");
			th.appendChild(document.createTextNode("Link"));
			tr.appendChild(th);
			thead.appendChild(tr);
			this.pEl.replaceChild(table, this.pEl.firstChild);
			
		},
		
		searchPage : function() {
			if (this.index == 0) {
				//window.alert("Beginne mit Suche");
				var img = new Image(43,11);
				img.src = "css/lade_suche.gif";
				img.id = "loader";
				img.alt = "Statusbalken";
				//this.pEl.appendChild(img);
				this.pEl.insertBefore(img, this.pEl.getElementsByTagName("table")[0]);
			}
			if (this.firstSearch && this.index < this.sites2search.length)
				this.sendRequest(this.sites2search[this.index][1],"GET", new Date().getTime());
			else if (!this.firstSearch) {
				for (var i=0; i<this.fileContens.length; i++, this.index++){
					if (this.isFound(this.fileContens[i])) {
						this.hasResult = true;
						this.addResult();
					}
				}
			}
			if (!this.hasResult && this.index >= this.sites2search.length){
				this.addResult();
				this.hasResult = true;
			}
			if (this.index == this.sites2search.length) {
				var img = this.pEl.getElementsByTagName("img")[0];
				if (img)
					this.pEl.removeChild(img);
				//window.alert("Ende der Suche");
			}
		},
		
		sendRequest : function(uri,m,q){
			try{
				this.httpRequest.abort();
				this.httpRequest.onreadystatechange = function() {	JSSearchEngine.handleAJAXResponse(); };
	
				if (m.toLowerCase() == "post"){
					this.httpRequest.open("POST", uri, true);
					this.httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					this.httpRequest.send( q );
				}
				else {
					this.httpRequest.open("GET", uri+"?"+q, true);
					this.httpRequest.send(null);
				}
			}
			catch(err) {
				window.alert("Die Seite "+uri+" konnte nicht geladen werden!\n\n"+err);
				this.sites2search.splice(this.index,1);
				var thisInstanz = this;
				window.setTimeout(function() { thisInstanz.searchPage(); } ,150);
			}			
		},
		
		handleAJAXResponse : function() {
			if (this.httpRequest.readyState == 4) {
				var str = this.httpRequest.responseText.toLowerCase();
				var spos = str.lastIndexOf( this.searchrangestart.toLowerCase() );
				var epos = str.indexOf( this.searchrangeend.toLowerCase() );
				spos = spos==-1?0:spos+this.searchrangestart.length;
				epos = epos<spos?str.length:epos;
				str = str.substring(spos, epos);
				str = this.replaceHTML(str);
				str = this.replaceUmlauts(str,0);
				this.fileContens.push( str );
				if (this.isFound(str)) {
					this.addResult();
					this.hasResult = true;
				}
				this.index++;
				var thisInstanz = this;
				window.setTimeout(function() { thisInstanz.searchPage(); } ,150);
			}
		}, 
		 
		isFound : function( fileContent ){
			for (var i=0,l=0; i<this.keyWords.length; i++){
				if (fileContent.search(this.keyWords[i].toLowerCase()) != -1){ //indexOf
					l++;
					if (this.searchMode!=0 && l > 0)
						return true;
					else if (this.searchMode==0 && l == (this.keyWords.length))
						return true;
				}
			}
			return false;
		},
		
		getKeywords : function() {
			if (this.searchMode==2)
				var kW = [decodeURIComponent(this.searchForm.elements['q'].value).replace(/\+/g," ")];
			else	
				var kW = decodeURIComponent(this.searchForm.elements['q'].value).replace(/\+/g," ").split(/\s+/);	
			for (var i=0; i<kW.length; i++)
				if (this.trim(kW[i]) != "" && kW[i].length > 2)
					this.keyWords.push(this.trim(this.replaceUmlauts(kW[i],0)));	
		},

		replaceUmlauts : function (str, k){
		    var arr = [	["Ö", "ö", "Ä", "ä", "Ü", "ü", "ß"],
						["&Ouml;", "&ouml;", "&Auml;", "&auml;", "&Uuml;", "&uuml;", "&szlig;"]];
		    
		    for (var i=0; i<arr[ (k==0?0:1) ].length; i++){
				myRegExp = new RegExp(arr[ (k==0?0:1) ][i],"g");
				str = str.replace(myRegExp, arr[(k==0?1:0)][i]);
			}
			str = str.replace(/&nbsp;/g, " ");
		    return str.replace (/\s+/g," ");
		},
		
		trim : function(str){
			return str.replace(/^\s*|\s*$/g, "");
		},
		
		replaceHTML : function(str){
			str = str.replace (/\<[\/\!]*?[^\<\>]*?\>/g," ");
			return str.replace (/\s+/g," ");
		}
	
	}
	
	var DOMContentLoaded = false;
	function addContentLoadListener (func) {
		if (document.addEventListener) {
			var DOMContentLoadFunction = function () {
				window.DOMContentLoaded = true;
				func();
			};
			document.addEventListener("DOMContentLoaded", DOMContentLoadFunction, false);
		}
		var oldfunc = (window.onload || new Function());
		window.onload = function () {
			if (!window.DOMContentLoaded) {
				oldfunc();
				func();
			}
		};
	}

	addContentLoadListener( function() { JSSearchEngine.init("<body>", "</body>", true, suchseite ); } );	
