$(function(){
    let edit_conditions = {login_ok: true};

    let checkUsername = function(element){
        $("#login-result").html('');
        $(element).css("background-color", "");
        $(element).css("opacity", "");
        edit_conditions.login_ok=true;
        if(element.value != $('[name="old_username"]').val()){
            axios.get("/user/checkUsername?login="+element.value).then(function(result){
                if(result.data == "not_unique"){
                    $("#login-result").html('Cet identifiant n\'est pas disponible');
                    $(element).css("background-color", "red");
                    $(element).css("opacity", "0.5");
                    edit_conditions.login_ok=false;
                }
            }, function(error){
                console.log(error);
            });
        }
    }

    $('[name="username"]').on("change", event => {
        checkUsername(event.target);
    });

    $("#user_form").on("submit", event => {
        if(!edit_conditions.login_ok){
            event.preventDefault();
            alert("L'identifiant n'est pas valide.");
        }
    });
})