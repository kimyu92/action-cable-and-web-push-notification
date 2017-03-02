document.addEventListener("DOMContentLoaded", function() {
  var question_id = document.getElementById('answer_question_id').value;

  App.answers = App.cable.subscriptions.create({ channel: 'ApplicationCable::QuestionsChannel', question_id: question_id }, {
    received: function(data) {
      console.log(data.content);
      return document.getElementById('answers').append(data.content + '<br>')
    }
  });
});
