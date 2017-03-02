document.addEventListener("DOMContentLoaded", function() {
  var question_id = document.querySelector('#answer_question_id').value;

  App.answers = App.cable.subscriptions.create({ channel: 'ApplicationCable::QuestionsChannel', question_id: question_id }, {
    received: function(data) {
      var node = document.createElement('p');
      nodeChild = document.createTextNode(data.content);
      node.appendChild(nodeChild);
      return document.querySelector('#answers').appendChild(node)
    }
  });
});
