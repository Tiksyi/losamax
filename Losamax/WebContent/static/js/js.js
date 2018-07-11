function calculCote(id, nom) {
	var mise = document.getElementById('mise').value;
	/* var cote = document.getElementById(id).innerHTML; */
	var cote = id;
	var resultat;

	resultat = mise * cote;
	console.log(mise);
	console.log(cote);
	console.log(resultat);
	var view = document.getElementById('view');
	view.value = resultat;

	var choix = document.getElementById('choix');
	choix.value = nom;
}