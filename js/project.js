$(document).ready(function(){
		
	$( "#propose-project" ).button().click(function() {
        if($(this).data("access") > 2) {
            $('#create_form').populate({});
	       $( "#dialog-form" ).dialog( "open" );
        } else {
            premiumFeature();
        }
	  	
	    return false;
	  });
	
	$( "#dialog-form" ).dialog({
	  autoOpen: false,
	  height: 700,
	  width: 850,
	  modal: true,
	  buttons: {
	    "Save": function() {
	      $("input[name='queryString']").val(location.search);
	      $('#create_form').submit();
	    },
	    Cancel: function() {
	      $( this ).dialog( "close" );
	    }
	  },
	  close: function() {
	    
	  }
	});
	
	$("#datepicker").datepicker({ dateFormat: "yy-mm-dd" });
        
        
    $('#project-time').timepicker({
        'minTime': '7:30am',
        'maxTime': '7:30pm',
        'timeFormat': 'H:i'
    });
        
        
	$("#create_form").validate();
	
	$(".project_edit").click(function(){
		var projectId = $(this).data("id");
		$.getJSON( "./projects.get.php?id=" + projectId, function( data ) {
  			$('#create_form').populate(data);
  			$( "#dialog-form" ).dialog( "open" );
	    	return false;
		});
	});
	
	$("#dialog-confirmation").dialog({
	  autoOpen: false,
	  height: 250,
	  width: 650,
	  modal: true,
	  buttons: {
	    "Confirm Facilitation": function() {
	    	$("input[name='queryString']").val(location.search);
	    	$("#confirmation_form").submit();
	    },
	    "No, May be Later": function() {
	      $( this ).dialog( "close" );
	    }
	  }
	});
	
	$(".takeProject").click(function(){
		$("#confirmation_form :input[name='projectId']").val($(this).data("id"));
		$("#dialog-confirmation").dialog( "open" );
		return false;
	});

	$("input[name='filterby'][value=" + qs['filter'] + "]").prop('checked', true);

	$("input[name='filterby']").change(function(){
		var filter = $("input[name='filterby']:checked").val();
		updateQueryString("filter", filter);	
	});
	
	$("input[name='sortby'][value=" + qs['sort'] + "]").prop('checked', true);

	$("input[name='sortby']").change(function(){
		var filter = $("input[name='sortby']:checked").val();
		updateQueryString("sort", filter);	
	});
});
