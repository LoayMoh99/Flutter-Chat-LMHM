import 'package:flutter/material.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.user.name,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
           IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      body:GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
          child: Column(
          children: <Widget>[
            Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                 ),
              child: ClipRRect(
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                ),
                child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.only(top:15),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                      final msg = messages[index];
                      final bool isMe = (msg.sender.id==currentUser.id);
                      return _buildMessage(msg,isMe);
                      },
                    ),
                    ),
                  ),
              ),
              Container(
                child: _buildComposer(),
                color: Colors.white,
                ),
            ],
          ),
      ),
      );
    }
  Widget _buildComposer()
  {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(
        left:10,right:10,
        top:10,bottom:10,
        ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Theme.of(context).accentColor,
      ),
      height: MediaQuery.of(context).size.width*0.12,
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.photo),onPressed: (){},),
          Expanded(
              child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (changedValue){},
                decoration:InputDecoration.collapsed(hintText:'Type your message..'),
            ),
          ),
          IconButton(icon:Icon(Icons.send),onPressed: (){},),
        ],
      ),
    );
  }
  Widget _msgContainerBuild(Message msg, bool isMe)
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.75,
          margin: isMe
          ?EdgeInsets.only(
            top:8,
            bottom:8,
            left:MediaQuery.of(context).size.width*0.25,
          )
          :EdgeInsets.only(
            top:8,
            bottom:8,
          ),
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                msg.time,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                msg.text,
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 0.8
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: isMe
              ? Theme.of(context).accentColor
              :Colors.yellow[100],
            borderRadius: isMe
              ?BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ):BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
            ),
          ),
         // width: MediaQuery.of(context).size.width*0.55,
        );
  }              
  Widget _buildMessage(Message msg, bool isMe) {
    if(!isMe)
    return Row(
      children: <Widget>[
        _msgContainerBuild(msg,isMe),
        IconButton(
          onPressed: (){},
          iconSize: 30,
          icon: msg.isLiked 
          ? Icon(Icons.favorite)
          : Icon(Icons.favorite_border),
          color: msg.isLiked 
          ? Theme.of(context).primaryColor
          : Colors.blueGrey,
        ),
      ],
    );
    else return Row(
      children: <Widget>[
        _msgContainerBuild(msg,isMe),
      ],
    );
  }
}
