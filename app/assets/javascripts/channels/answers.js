App.answers = App.cable.subscriptions.create('ApplicationCable::AnswersChannel', {
  received: function(data) {
    console.log(data.content);
    return document.getElementById('answers').append(data.content + '<br>')
  }
});
