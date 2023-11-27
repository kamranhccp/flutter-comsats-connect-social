import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Simulated list of notifications
    final List<NotificationItem> notifications = [
      NotificationItem(
        appIcon: Icons.notifications,
        title: 'New Notification',
        message: 'Someone like a post you commented on',
        // timestamp: DateTime.now(), format included only  dd/mm/yyyy in case of more
        // than 24 hours otherwise hh:mm
        timestamp: DateTime.now(),
        quickActions: [
          QuickAction(
            label: 'Reply',
            onPressed: () {
              // Handle reply action
            },
          ),
          QuickAction(
            label: 'Mark as Read',
            onPressed: () {
              // Handle mark as read action
            },
          ),
        ],
      ),
      NotificationItem(
        appIcon: Icons.notifications,
        title: 'New Notification',
        message: 'Someone like a post you commented on',
        timestamp: DateTime.now(),
        quickActions: [
          QuickAction(
            label: 'Reply',
            onPressed: () {
              // Handle reply action
            },
          ),
          QuickAction(
            label: 'Mark as Read',
            onPressed: () {
              // Handle mark as read action
            },
          ),
        ],
      ),
      NotificationItem(
        appIcon: Icons.notifications,
        title: 'New Notification',
        message: 'Someone like a post you commented on',
        timestamp: DateTime.now(),
        quickActions: [
          QuickAction(
            label: 'Reply',
            onPressed: () {
              // Handle reply action
            },
          ),
          QuickAction(
            label: 'Mark as Read',
            onPressed: () {
              // Handle mark as read action
            },
          ),
        ],
      ),
      NotificationItem(
        appIcon: Icons.notifications,
        title: 'New Notification',
        message: 'Someone like a post you commented on',
        timestamp: DateTime.now(),
        quickActions: [
          QuickAction(
            label: 'Reply',
            onPressed: () {
              // Handle reply action
            },
          ),
          QuickAction(
            label: 'Mark as Read',
            onPressed: () {
              // Handle mark as read action
            },
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings button
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Container(
                height: 50,
                color: Colors.grey[200],
                child: const Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.search,
                      size: 21,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          // Notifications List
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationCard(notification: notification);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem {
  final IconData appIcon;
  final String title;
  final String message;
  final DateTime timestamp;
  final List<QuickAction> quickActions;

  NotificationItem({
    required this.appIcon,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.quickActions,
  });
}

class QuickAction {
  final String label;
  final Function onPressed;

  QuickAction({
    required this.label,
    required this.onPressed,
  });
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      width: double.infinity,
      child: Card(
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(notification.appIcon),
          title: Row(
            children: [
              Text(notification.title),
              const Spacer(),
              Text(
                notification.timestamp.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          subtitle: Text(notification.message),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          subtitleTextStyle: const TextStyle(
            color: Colors.black,
          ),
          onTap: () {
            // Handle tapping the notification card
          },
        ),
      ),
    );
  }
}
