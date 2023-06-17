import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/message_model.dart';

class MessageController extends GetxController {
  RxList<MessageModel> _list = <MessageModel>[].obs;

  RxList<MessageModel> get list => _list;

  @override
  void onInit() {
    super.onInit();

    // Initialize the list with some data
    _list.addAll([
      MessageModel(
        msg: "Hello I am Farjad",
        toID: "user1",
        read: "false",
        type: MsgType.text,
        fromID: "user2",
        sent: "1681932499129",
      ),
      MessageModel(
        msg: "we will make it together",
        toID: "user1",
        read: "false",
        type: MsgType.text,
        fromID: "user2",
        sent: "1681932499129",
      ),
      MessageModel(
        msg: "we will make it together",
        toID: "user1",
        read: "false",
        type: MsgType.text,
        fromID: "user2",
        sent: "1681932499129",
      ),
      MessageModel(
        msg: "we will make it together",
        toID: "user1",
        read: "false",
        type: MsgType.text,
        fromID: "user2",
        sent: "1681932499129",
      ),
      MessageModel(
        msg: "we will make it together",
        toID: "user1",
        read: "false",
        type: MsgType.text,
        fromID: "user2",
        sent: "1681932499129",
      ),
      MessageModel(
        msg: "we will make it together",
        toID: "user1",
        read: "false",
        type: MsgType.text,
        fromID: "user2",
        sent: "1681932499129",
      ),
      MessageModel(
        msg: "we will make it together",
        toID: "user1",
        read: "false",
        type: MsgType.text,
        fromID: "user2",
        sent: "1681932499129",
      ),
      MessageModel(
        msg:
            "Hello! my name is Farjad what can I do for you, if you want any kind of assistance then do lemme know",
        toID: "user2",
        read: "true",
        type: MsgType.text,
        fromID: "user1",
        sent: "1681932499129",
      ),
      MessageModel(
        msg: "Hi How are you",
        toID: "user1",
        read: "false",
        type: MsgType.text,
        fromID: "user3",
        sent: "1681932499129",
      ),
      // Add more MessageModel objects as needed
    ]);
  }

  void addMessage(MessageModel message) {
    _list.add(message);
    update(); // Notify the UI that the list has been updated
    log('offer added');
  }
}
