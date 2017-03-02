self.addEventListener('install', function(event) {
  event.waitUntil(self.skipWaiting()); //will install the serviceworker
});

self.addEventListener('activate', function(event) {
  event.waitUntil(self.clients.claim()); //will activate the serviceworker
});

// Register event listener for the 'push' event.
self.addEventListener('push', function(event) {

  // Retrieve the textual payload from event.data (a PushMessageData object).
  // var payload = JSON.parse(event.data.text());
  var payload = { title: 'Title', body: 'Body', data: { link: '/questions' } };
  var clickUrl = payload.url;

  // Keep the service worker alive until the web push notification is created.
  event.waitUntil(
      // Show a notification
      self.registration.showNotification(payload.title, {
        body: payload.body,
        data: payload.data
      })
  );
});

// Register event listener for the 'notificationclick' event.
self.addEventListener('notificationclick', function(event) {
  var link = event.notification.data.link;
  event.notification.close(); //Close the notification

  event.waitUntil(
    clients.openWindow(link)
  );
});
