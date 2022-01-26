function validatepassword(){
        
         var password = document.getElementById("password").value;
         var confirm_password = document.getElementById("confirm_password").value;
         var form_teacher_details = document.getElementById("teacher_details");
         
         
       
			
			if ((password==null || password==""))
			{
			 showInfoToast('Please enter your password !!');
                                return false;
			}
			if((confirm_password==null || confirm_password==""))
                            {
			showInfoToast('Please enter confirm password!!');
                          return false;
			}
                        if((confirm_password!=password ))
                            {
                                showInfoToast('Passwords do not match');
                                return false;
			}
			
			
			else
			form_teacher_details.submit();
                    
    } 