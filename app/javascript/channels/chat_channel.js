import consumer from "./consumer"

consumer.subscriptions.create(
    { channel: "ChatChannel"}, 
    {
        received(data) {
            console.log(data);
            const chat = document.querySelector("#messages");
            chat.insertAdjacentHTML("beforeend", `<p>${(data.username) ?  `${data.username} :` : ""} ${data.message}</p>`);
            chat.scrollTo(0, chat.scrollHeight);
        }
    }
)