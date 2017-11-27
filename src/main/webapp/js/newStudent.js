var root = 'http://localhost:8080/capstone/';

var newStudentURL = '/newStudent';


$(function(){
    $('#newStudent-modal').modal({
        keyboard: true,
        backdrop: "static",
        show:false,
        
    });
    
    
});

function saveNewStudent(){
	$.ajax({
		url: root + newStudentURL,
		method: "POST",
		data: {
			'firstName' : $("#firstNameStudent").val(),
			'lastName' : $("#lastNameStudent").val(),
			'gender' : $("#genderStudent").val(),
			'birthday' : $("#birthdayStudent").val(),
		}
	}).done(function(data){
		alert("The student has been added.");
		$("#firstNameStudent").val("");
		$("#lastNameStudent").val("");
		$("#genderStudent").val("");
		$("#birthdayStudent").val("");
		
	})
};



