(function($) {
  showSuccessToast = function($mesage) {
    'use strict';
    resetToastPosition();
    $.toast({
      heading: 'Success',
      text: $mesage,
      showHideTransition: 'slide',
      icon: 'success',
      loaderBg: '#f96868',
      position: 'top-right'
    })
  };
  showInfoToast = function($mesage) {
    'use strict';
    resetToastPosition();
    $.toast({
      heading: 'Info',
      text: $mesage,
      showHideTransition: 'slide',
      icon: 'info',
      loaderBg: '#eef9fc',
      position: 'top-right'
    })
  };
   showWarningToast = function($mesage) {
    'use strict';
    resetToastPosition();
    $.toast({
      heading: 'Warning',
      text: $mesage,
      showHideTransition: 'slide',
      icon: 'warning',
      loaderBg: '#eef9fc',
      
      position: 'top-right'
    })
  };
  
 
  showDangerToast = function($mesage) {
    'use strict';
    resetToastPosition();
    $.toast({
      heading: 'Danger',
      text: $mesage,
      showHideTransition: 'slide',
      icon: 'error',
      loaderBg: '#f2a654',
      position: 'top-right'
    })
  };
  showToastPosition = function(position) {
    'use strict';
    resetToastPosition();
    $.toast({
      heading: 'Positioning',
      text: 'Specify the custom position object or use one of the predefined ones',
      position: String(position),
      icon: 'success',
      stack: false,
      loaderBg: '#f96868'
    })
  }
  showToastInCustomPosition = function() {
    'use strict';
    resetToastPosition();
    $.toast({
      heading: 'Custom positioning',
      text: 'Specify the custom position object or use one of the predefined ones',
      icon: 'success',
      position: {
        left: 120,
        top: 120
      },
      stack: false,
      loaderBg: '#f96868'
    })
  }
  resetToastPosition = function() {
    $('.jq-toast-wrap').removeClass('bottom-left bottom-right top-left top-right mid-center'); // to remove previous position class
    $(".jq-toast-wrap").css({
      "top": "",
      "left": "",
      "bottom": "",
      "right": ""
    }); //to remove previous position style
  }
})(jQuery);
