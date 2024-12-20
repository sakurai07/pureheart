import consumer from "./consumer"

const appGroup = consumer.subscriptions.create("GroupChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    return this.perform("group_select", {group_id: $('#messages').data('group_id')});
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    return $('#messages').append(data['message']);
  },

  speak: function(message, user_id, group_id) {
    return this.perform('speak', {message: message, user_id: user_id, group_id: group_id});
  }
});

$("#groupmessage_input").keypress(function(e) {
  if (e.keyCode === 13) {
    appGroup.speak(e.target.value, $("#current_user").data("user_id"),$("#messages").data("group_id"));
    //↓あとで消す
    // alert(e.target.value);
    // alert($("#current_user").data("user_id"));
    // alert($("#messages").data("group_id"));
    //↑あとで消す
    e.target.value = "";
    e.preventDefault();
  }
});

$(".showAnswer").on("click",function(){$(".answer").show();});
