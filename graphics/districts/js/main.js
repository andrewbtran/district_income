(function() { globe.onDefine('window.jQuery && $(".article-graphic.districts").length', function() {


var data = [
	["district1","District 1","68.46","Salvatore LaMattina","Yes","2006"],
	["district2","District 2","56.90","Bill Linehan","Yes","2007"],
	["district3","District 3","77.55","Frank Baker","Yes","2011"],
	["district4","District 4","81.39","Charles C. Yancey","Yes","1983"],
	["district5","District 5","69.59","Timothy McCarthy","Yes","2013"],
	["district6","District 6","51.88","Matt O'Malley","No","2010"],
	["district7","District 7","84.29","Tito Jackson","Yes","2011"],
	["district8","District 8","47.34","Josh Zakim","No","2013"],
	["district9","District 9","72.64","Mark Ciommo","Yes","2007"],
]

$(document).ready(function(){
for (var i in data) {
$("#"+data[i][0]).css("fill","rgb(220, 105, 81)");
if (data[i][2] >= 47.34 && 55.00000000000 > data[i][2]) {
$("#"+data[i][0]).css("opacity", 0.2);
}
if (data[i][2] >= 55.00 && 65.00 > data[i][2]) {
$("#"+data[i][0]).css("opacity", 0.4);
}
if (data[i][2] >= 65.00 && 70.00 > data[i][2]) {
$("#"+data[i][0]).css("opacity", 0.6);
}
if (data[i][2] >= 70.00 && 80 > data[i][2]) {
$("#"+data[i][0]).css("opacity", 0.8);
}
if (data[i][2] >= 80.00) {
$("#"+data[i][0]).css("opacity", 1);
}
}
});


	var masterSelector = '.article-graphic.districts';
	var master = $(masterSelector);

var thissvg;
var pos, thex, they;
var isFirefox = typeof InstallTrigger !== 'undefined';

$(document).ready(function(){
$("#timeline").height($("#chart").height());
$("#timeline").width($("#chart").width());


if(isFirefox == true) {
	var mysvg = document.getElementById("svg");
	var mysvgw = mysvg.getAttributeNS(null,'width')
	mysvg.getAttributeNS('height', mysvgw*1.066);

	  $(".state").mouseover( function(evt){
	    	thissvg = evt.target;
			$(thissvg)
				.css("cursor","pointer")

		});
		
	  $(".state").mouseout( function(evt){
			thissvg = evt.target;
			$(thissvg)

		});

	  $(window).resize(function(){
	  		mysvgw = mysvg.getAttributeNS(null,'width')
			mysvg.getAttributeNS('height', mysvgw*1.066);
		})


} else {
	$("#svg").height($("#svg").width()*1.066)
    $(".state").mouseover( function(){
    	thissvg = $(event.target).parent();
		$(thissvg)
			.css("cursor","pointer")

	});
	$(".state").mouseout( function(){
		thissvg = $(event.target).parent();
		$(thissvg)

	});

	$(window).resize(function(){
		$("#svg").height($("#svg").width()*1.066)
	})
}

$(".state").mouseover(function(e){
	if (navigator.userAgent.indexOf("Firefox")!=-1){
		
	    pos = $("#timeline").offset()
	    thex = e.pageX - pos.left + 10;
	    they = e.pageY - pos.top + 10;
	    if (thex > $("#timeline").width() - 200) { thex = $("#timeline").width() - 200 };
	    if (they > $("#timeline").height() - 200) { they = $("#timeline").height() - 100 };
	} else {

	    pos = $("#timeline").offset()
	    thex = event.pageX - pos.left + 10;
	    they = event.pageY - pos.top + 10;
	    if (thex > $("#timeline").width() - 200) { thex = $("#timeline").width() - 200 };
	    if (they > $("#timeline").height() - 200) { they = $("#timeline").height() - 100 };
	}

	
	for (var i=0; i<data.length; i++) {
	if (this.id == data[i][0]) {
$("#timeline").append('<div class="hoverbox" style="top:'+they+'px; left:'+thex+'px;"><div class="statename">'+data[i][1]+' - '+data[i][3]+'</div><div class="summ">Families with income less than $100,000: </div><div class="statepct"> '+data[i][2]+'%</div></div>');
	} 
	

	}	
});

$(".state").mouseleave(function(){
	$(".hoverbox").remove();
});


});



}); }());