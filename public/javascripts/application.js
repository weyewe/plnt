var chartArray= new Array();

jQuery(function() {  
  // alter browser's backspace behavior
  $(document).keydown(function(e) {
  var element = e.target.nodeName.toLowerCase();
  if (element != 'input' && element != 'textarea') {
      if (e.keyCode === 8) {
          return false;
      }
  }
  });
  
  
  // editing the availability table
  jQuery("td.target-availability, td.real-availability").click(function(){
    if( $(this).hasClass( "entry-view") ){
      var $theTd = $(this);
      $("span.td-value", $theTd).hide();
      $("input.td-value", $theTd).attr('changed', 1 );
      $("input.td-value", $theTd).show().focus();
      return false;
    }
  });
  
  jQuery("input#availability_submit").click(function(){
    var value_container = new Array();
    var company_id_container = new Array();
    var category_id_container = new Array();
    var day_container = new Array();
    
    var target_value_container = new Array();
    var target_company_id_container = new Array();
    var target_category_id_container = new Array();
    
    
    var errorCounter = 0;
    
    // alert("Gonna strike");
    $("table#mca input.td-value").each(function(){
      var currentInput = $(this);
      
      if( currentInput.attr('changed') == "1"){
        var inputValue = 0;
        var inputWrapperId = 0;
        
        inputValue = parseFloat(currentInput.attr('value'));
        inputWrapperId = currentInput.parent().attr('id');
        
        if( currentInput.hasClass("real") ){
          value_container.push( inputValue );
          var arrayWrapper = inputWrapperId.split("_");
          company_id_container.push(  parseInt( arrayWrapper[1] ) );
          category_id_container.push( parseInt( arrayWrapper[3] ) );
          day_container.push( parseInt(arrayWrapper[5])  );
        }else{
          target_value_container.push( inputValue );
          // alert("The inputWrapperId is " + inputWrapperId);
          var arrayWrapper = inputWrapperId.split("_");
          target_company_id_container.push(  parseInt( arrayWrapper[1] ) );
          target_category_id_container.push( parseInt( arrayWrapper[3] ) );
        }
        
        
        
        if( inputValue < 0 || inputValue > 100){
          currentInput.addClass("warning");
          errorCounter++;
        }else{
          if( currentInput.hasClass("warning")){
            currentInput.removeClass("warning");
          }
        }
      }
    });    
    // 
    // alert("errorCounter = " + errorCounter);
    
    if( errorCounter > 0 ){
      alert("Ada " + errorCounter + " error! Perbaiki isian yang berwarna merah!");
      return false;
    }else{
      // alert("gonna update");
      // alert("value_container's length is " + value_container.length );
      $("input#value_container").attr('value' , value_container.join(","));
      $("input#category_id_container").attr('value' , category_id_container.join(","));
      $("input#company_id_container").attr('value' , company_id_container.join(","));
      $("input#day_container").attr('value' , day_container.join(","));
      
      $("input#target_value_container").attr('value' , target_value_container.join(","));
      $("input#target_company_id_container").attr('value' , target_company_id_container.join(","));
      $("input#target_category_id_container").attr('value' , target_category_id_container.join(","));
      
      // alert("The content of value_container is " + $("input#value_container").attr('value') );
      // alert("The content of category_id_container is " + $("input#category_id_container").attr('value') );
      // alert("The content of company_id_container is " + $("input#company_id_container").attr('value') );
      // alert("The content of day_container is " + $("input#day_container").attr('value') );
      
      // alert("The content of target_value_container is " + $("input#target_value_container").attr('value') );
      // alert("The content of target_category_id_container is " + $("input#target_category_id_container").attr('value') );
      // alert("The content of target_company_id_container is " + $("input#target_company_id_container").attr('value') );
    }
  });
    
  jQuery("table#mca td.real-availability, table#mca td.target-availability").hover(
    function () {
      $(this).addClass("onHover");
    }, 
    function () {
      $(this).removeClass("onHover");
    }
  );

  jQuery("a#back-mca").click( function(){
    showTableHideChart();
    return false;
  });

  jQuery("a.graph-starter").click( function(){

    destroyChart();    
    showChartHideTable();
    
    
    var companyName = $(this).text();
    // alert(companyName + " is clicked");
    // getting the x-axis ( days ), can be used for all categories
    var days_array = new Array(); 
    // alert("gonna call getDays()");
    days_array = getDays();
    
    
    // getting the location to plot the graph
    // 1 company has N graphs, where N == total number of categories in that company
    var company_id = $(this).attr('id').split("_")[1];
    
    var graph_data_collection = [];
    
    // get the category text, target_value, real_value 
    $("table#mca tr.body").each(function( ){
      if( $(this).attr('company_id') != company_id ){
        return true;  // continue
      }else{
        var current_row = $(this);
        var row_info = {};
        row_info["category_id"] = current_row.attr('category_id');
        row_info["category_name"] = $("td.category-name", current_row).text();
        
        
        // get the category_target
        var td = $("td.target-availability", current_row);
        var span_value = $("span", td);
        var target_array = new Array();
        
        
        if( $("span" , td ).hasClass("still-nil") ){
          for( var j =0; j < days_array.length ; j++ ){
            target_array[j] = 0;
          }
        } else {
          var value = parseFloat( span_value.text() );
          for( var j = 0; j < days_array.length; j++) {
            target_array[j] =  value;
          }
        }
        
        row_info["category_target_array"] = target_array;
        
        
        
        // get the category_real
        var real_array = new Array();
        $("td.real-availability", current_row).each(function(){
          var td = $(this);
          var span_value = $("span" , td);
          
          if( $("span", td).hasClass("still-nil") ){
            real_array.push( 0 ) ;
          } else{
            var value = parseFloat( span_value.text() );
            real_array.push( value );
          }
        });
        
        row_info["category_real_array"] = real_array;
        graph_data_collection.push( row_info );
      }
    });
    
    // alert( graph_data_collection.length );
    
    plot_graph(graph_data_collection , company_id, companyName , days_array);   
      
    return false;
  });  
  
  
  // init comboselect during $(document).ready( function() {} );
  // comboselect
  $("select.combo-select").live({
      'change': function() {
          var text = $(this).find(":selected").text();
          console.log("The selected text is " + text);
          propagateChanges( $(this) );
      },
      'keyup': function() {
          $(this).change();
      }
  });
});

function propagateChanges( select_dom ){
  var dependant_id = select_dom.find(":selected").attr("id");
  
  var targetPropagation = select_dom.attr("targetPropagation");
  var targetCounter = 0;
  $("select#" + targetPropagation + " option ").each ( function () {
    var option = $(this);
    var selected_option;
    if( option.attr("dependant") !=   dependant_id ){
      option.hide();
    }else{
      option.show();
      targetCounter++;
      selected_option = option;
    }
  });
    
  if( targetCounter == 0 ){
    // doNothing()
  }else{
    // set the current selected option
    $this.val( selected_option.val() );
    // and if there is nextTargetPropagation, do it
    var nextTargetPropagation = selected_option.attr("targetPropagation") ;
    if( nextTargetPropagation == undefined || nextTargetPropagation == "" ){
      // don't do it
    }else{
      propagateChanges( $("select#" + nextTargetPropagation ) );
    }
  }
}

function plot_graph( arrayOfData  ,company_id ,companyName, days_array) {
  for( var i=0; i< arrayOfData.length; i++ ){
    var graphData = arrayOfData[i];
    
    var optionsObject =  { 
      chart: {
        renderTo: 'chart-container-' + graphData["category_id"] ,
        defaultSeriesType: 'bar'
      },
      title: {
        text: 'Monthly Control Availability '  +graphData["category_name"]
      }, 
      xAxis: {
        categories: days_array
      },
      yAxis: {
        title: {
          text: graphData["category_name"]
        }
      },
      series: [
        {
          type: 'column',
          name: companyName ,
          data: graphData["category_real_array"] 
        },
        {
          type: 'spline',
          name: 'target',
          data: graphData["category_target_array"] 
        }
      ]
    };
    
    if( chartArray[i] == undefined){
      chartArray[i]  = new Highcharts.Chart( optionsObject );
    }
    
  }
}


function  destroyChart(){
  for( var i =0; i <chartArray.length; i++ ){
     chartArray[i] = null; 
   }
}

function getDays(){
  var days_array = new Array();
  var total_days = $("tr.header-month-number td.day").length; 
  
  for( var i =0 ; i < total_days ; i++) {
    days_array[i] = i+1;
  }
  
  return days_array;
}


function showChartHideTable(){
  $("table#mca").hide();
  $("form#target-availability-form").hide();
  $("div#month-navigator").hide();
  $("div#data_plot").show();
}

function showTableHideChart() {
  $("table#mca").show();
  $("form#target-availability-form").show();
  $("div#month-navigator").show();
  $("div#data_plot").hide();
}