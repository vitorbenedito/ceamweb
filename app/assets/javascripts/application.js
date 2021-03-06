// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
  $("#localizacaos th a, #localizacaos .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#localizacaos_search input").keyup(function() {
    $.get($("localizacaos_search").attr("action"), $("#localizacaos_search").serialize(), null, "script");
    return false;
  });

	jQuery.fn.multiselect = function() {
	    $(this).each(function() {
	        var checkboxes = $(this).find("input:checkbox");
	        checkboxes.each(function() {
	            var checkbox = $(this);
	            // Highlight pre-selected checkboxes
	            if (checkbox.attr("checked"))
	                checkbox.parent().addClass("multiselect-on");

	            // Highlight checkboxes that the user selects
	            checkbox.click(function() {
	                if (checkbox.attr("checked"))
	                    checkbox.parent().addClass("multiselect-on");
	                else
	                    checkbox.parent().removeClass("multiselect-on");
	            });
	        });
	    });
	};
	
	$(".multiselect").multiselect();
	
	var availableTags = [
		"ActionScript",
		"AppleScript",
		"Asp",
		"BASIC",
		"C",
		"C++",
		"Clojure",
		"COBOL",
		"ColdFusion",
		"Erlang",
		"Fortran",
		"Groovy",
		"Haskell",
		"Java",
		"JavaScript",
		"Lisp",
		"Perl",
		"PHP",
		"Python",
		"Ruby",
		"Scala",
		"Scheme"
	];
	$( "#tags" ).autocomplete({
		source: availableTags
	});

});
