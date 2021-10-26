$(function(){
    const socket = new WebSocket("ws://localhost:3000/chat_websocket");
    const chat = $("#messages");

    socket.onopen = (e) => {
        chat.append(`<p>Vous vous êtes connecté à la messagerie</p>`);
    };

    socket.onclose = (e) => {
        chat.append(`<p>Vous vous êtes déconnecté de la messagerie</p>`);
    };

    $("#chat-message").on("keyup", event => {
        if(event.keyCode==13){
            if (socket.readyState === socket.OPEN) {
                // socket.send(JSON.stringify({username:$("#chat-pseudo").val(), message:event.target.value}));
                axios.post("/chat/send",{username:$("#chat-pseudo").val(), message:event.target.value}).then(function(result){
                    event.target.value="";
                });
            }
        }
    });
})