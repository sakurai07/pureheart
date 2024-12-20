import consumer from "./consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    return this.perform("room_select", {room_id: $('#messages').data('room_id')});
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    return $('#messages').append(data['message']);
  },

  speak: function(message, user_id, room_id) {
    return this.perform("speak", {message: message, user_id: user_id, room_id: room_id});
  }
});

$("#message_input").keypress(function(e) {
  if (e.keyCode === 13) {
    appRoom.speak(e.target.value, $("#current_user").data("user_id"), $("#messages").data("room_id"));
    //↓あとで消す
    // alert(e.target.value);
    // alert($("#current_user").data("user_id"));
    // alert($("#messages").data("room_id"));
    //↑あとで消す
    e.target.value = "";
    e.preventDefault();
  }
})
