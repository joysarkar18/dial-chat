const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

const firestore = admin.firestore();


exports.sendCallNotification = functions.firestore
    .document('rooms/{callId}')
    .onCreate(async (snapshot, context) => {
        const callData = snapshot.data();
        if (!callData) {
            console.log('No data found in call document.');
            return;
        }

        const receiverId = callData.receiverId;
        const callerId = callData.callerId;
        const callId = context.params.callId;

        // Get the receiver's FCM token from Firestore
        const userSnapshot = await firestore.collection('users').doc(receiverId).get();
        const callerSnapshot = await firestore.collection('users').doc(callerId).get();
        const fcmToken = userSnapshot.get('fcmToken');
        const name = callerSnapshot.get("name");

        if (!fcmToken) {
            console.error('Receiver FCM token not found.');
            return;
        }

        // Send notification
        const message = {
            notification: {
                title: "Incoming Call",
                body: `${name} is video calling you! Tap to answer`,
            },
            data: {
                click_action: "FLUTTER_NOTIFICATION_CLICK",
                status: 'recived',
                callId: callId,
                callerId,
                receiverId,
                callType: "video",
            },
            token: fcmToken,
            android: {
                notification: {
                    sound: "default",
                },
            },
        };
        admin
            .messaging()
            .send(message)
            .then((response) => {
                console.log("Successfully sent message:", response);
                return;
            })
            .catch((error) => {
                // eslint-disable-next-line no-console
                console.log("Error sending message:", error);
                return;
            });
    });




exports.sendVoiceNotification = functions.firestore
    .document('voiceRooms/{callId}')
    .onCreate(async (snapshot, context) => {
        const callData = snapshot.data();
        if (!callData) {
            console.log('No data found in call document.');
            return;
        }

        const receiverId = callData.receiverId;
        const callerId = callData.callerId;
        const callId = context.params.callId;

        // Get the receiver's FCM token from Firestore
        const userSnapshot = await firestore.collection('users').doc(receiverId).get();
        const callerSnapshot = await firestore.collection('users').doc(callerId).get();
        const fcmToken = userSnapshot.get('fcmToken');
        const name = callerSnapshot.get("name");

        if (!fcmToken) {
            console.error('Receiver FCM token not found.');
            return;
        }

        // Send notification
        const message = {
            notification: {
                title: "Incoming Call",
                body: `${name} is calling you! Tap to answer`,
            },
            data: {
                click_action: "FLUTTER_NOTIFICATION_CLICK",
                status: 'recived',
                callId: callId,
                callerId,
                receiverId,
                callType: "audio",
            },
            token: fcmToken,
            android: {
                notification: {
                    sound: "default",
                },
            },
        };
        admin
            .messaging()
            .send(message)
            .then((response) => {
                console.log("Successfully sent message:", response);
                return;
            })
            .catch((error) => {
                // eslint-disable-next-line no-console
                console.log("Error sending message:", error);
                return;
            });
    });