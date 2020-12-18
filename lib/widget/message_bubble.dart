import 'package:chat_flutter/utils/default_colors.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key key;
  final String userName;
  final String message;
  final bool belongsToMe;

  MessageBubble(this.message, this.userName, this.belongsToMe, {this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          alignment: belongsToMe ? Alignment.centerRight : Alignment.centerLeft,
          decoration: BoxDecoration(
              color:
                  belongsToMe ? DefaultColors.TERTIARY : DefaultColors.QUINARY,
              borderRadius: BorderRadius.only(
                topLeft: belongsToMe ? Radius.circular(12) : Radius.circular(0),
                topRight: Radius.circular(12),
                bottomRight:
                    belongsToMe ? Radius.circular(0) : Radius.circular(12),
                bottomLeft: Radius.circular(12),
              )),
          width: MediaQuery.of(context).size.width / 2.1,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment:
                belongsToMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                    fontSize: 16,
                    color: belongsToMe
                        ? DefaultColors.QUINARY
                        : DefaultColors.TERTIARY),
              ),
            ],
          ),
        )
      ],
    );
  }
}
