importScripts('https://www.gstatic.com/firebasejs/8.1.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.1.1/firebase-messaging.js');

firebase.initializeApp({
    apiKey: "AIzaSyBVyjlJuzy9Qd41-v2meIh79Ti7OEm0TSc",
    authDomain: "my-project-a3614.firebaseapp.com",
    databaseURL: 'https://project-id.firebaseio.com',
    projectId: "my-project-a3614",
    storageBucket: "my-project-a3614.appspot.com",
    messagingSenderId: "337911613778",
    appId: "1:337911613778:web:707752d0cacb5e27eed28b",
    measurementId: "G-D28J07Z2PH"
});

const messaging = firebase.messaging();

//백그라우드로 수신(브라우저를 닫거나 다른 사이트로 이동시)
//테스트시 크롬 닫고 다시 열어야 알림창이 뜬다
/*
messaging.onBackgroundMessage((payload) => 
{
  console.log('[firebase-messaging-sw.js] Received background message ', payload);
  const notificationTitle = payload.notification.title;
  const notificationOptions = {
		  body: payload.notification.body,
		  icon: payload.notification.icon 
	  };
  return self.registration.showNotification(notificationTitle,notificationOptions);
});
*/
//알림창 클릭시
self.addEventListener('notificationclick', event => {   
  const url = "http://localhost:9090/";
  event.notification.close();
  event.waitUntil(clients.openWindow(url))
});
/*
//webpush 예약 시간 설정
var dts = new Date('July 22, 2023, 19:40:00'); //Math.floor(Date.now());

var options = {
  body: '7시 40분',
  timestamp: dts
}

var n = new Notification('예약 알림',options);

console.log(n.timestamp) // 원래 타임 스탬프를 기록해야합니다.
*/
