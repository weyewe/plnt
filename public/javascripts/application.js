var chart1;
jQuery(function() {  


  // $("a#new_employee").fancybox({
    // 	'autoDimensions' : false,
    // 	'width' : 800,
    // 	'height' : 600,
    // 	'padding' : 60,
    // 	'margin' : 20,
    // 	'centerOnScroll' : true
    // });
    // 

/*
Simple model; though it is more complicated in which the unit model should
change based on classification 

Category will affect the Classification 

Manufacturer will affect the UnitModel shown

EngineBrand will affect the EngineModel shown

However, due to time constraint, let them self-filter, better space to breathe

*/

  jQuery("table#mca td.real-availability, table#mca td.target-availability").hover(
    function () {
      $(this).addClass("onHover");
    }, 
    function () {
      $(this).removeClass("onHover");
    }
  );

  chart1 = new Highcharts.Chart({
    chart: {
      renderTo: 'chart-container-1',
      defaultSeriesType: 'bar'
    },
    title: {
      text: 'Monthly Control Availability'
    },
    xAxis: {
      categories: ['1','2','3','4','5','6','7','8','9','10',
                  '11','12','13','14','15','16','17','18','19','20',
                  '21','22','23','24','25','26','27','28','29','30']
    },
    yAxis: {
      title: {
        text: 'Physical Availability (A2B)'
      }
    },
    series: [{
      type: 'column',
      name: 'TBP',
      data: [29, 51, 68, 94, 96, 91, 97, 1, 55, 17, 72, 44, 31, 12, 6, 87, 64, 69, 68, 50, 16, 89, 65, 37, 46, 12, 25, 84, 12, 54] 
    }, {
      type: 'column',
      name: 'GPS',
      data: [61, 45, 47, 1, 44, 27, 95, 53, 21, 15, 78, 11, 94, 23, 36, 70, 31, 88, 75, 26, 90, 90, 5, 19, 14, 82, 74, 62, 30, 31]
    }, {
      type: 'column',
      name: 'KPT',
      data: [79, 22, 42, 53, 83, 62, 20, 42, 10, 52, 34, 64, 5, 56, 73, 69, 25, 18, 0, 53, 6, 11, 12, 68, 21, 6, 52, 94, 97, 26]
    }, {
      type: 'spline',
      name: 'target',
      data: [80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80] 
    }]
    });




});

