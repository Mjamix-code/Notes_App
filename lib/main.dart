import"package:flutter/material.dart";
import "package:flutter_glow/flutter_glow.dart";
void main()=>runApp(MaterialApp(
  home:NotesApp()
));
class NotesApp extends StatefulWidget{
  NotesApp({super.key});
  @override
  State<NotesApp>createState()=>NotesAppState();
}
class NotesAppState extends State<NotesApp>{
  String input="";
  List<String>notes=[];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text("NotesApp", style:TextStyle(fontSize:25,fontWeight:FontWeight.w900)),
        centerTitle:true
      ),
      body:Column(
        children:[
          Expanded(
            child:ListView.builder(
              itemCount:notes.length,
              itemBuilder:(BuildContext context,int index){
                return GlowContainer(
                  margin:EdgeInsets.all(14.0),
                  width:double.infinity,
                  color:Colors.white,
                  spreadRadius:5.0,
                  borderRadius:BorderRadius.circular(40),
                  glowColor:Colors.amber[700],
                  padding:EdgeInsets.all(2.0),
                  child:ListTile(
                    title:Text(notes[index],
                      style:TextStyle(
                        fontSize:18.0,
                        color:Colors.black
                      )
                    ),
                    trailing:IconButton(
                      onPressed:(){
                        setState((){
                          notes.removeAt(index);
                        });
                      },
                      icon:Icon(Icons.delete_forever_rounded,color:Colors.red)
                    )
                  )


                );

              }
            )
          )
        ]
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:(){
          showDialog(
            context:context,
            builder:(BuildContext context){
              return AlertDialog(
                //backgroundColor:Colors.amber[100],
                title:Text("Add notes",
                  style:TextStyle(color:Colors.amber[700],fontWeight:FontWeight.w900)
                ),
                content:TextField(
                  decoration:InputDecoration(
                    hintText:"Add your notes"
                  ),
                  onChanged:(String value){
                    input=value;
                  }
                ),
                actions:[
                  TextButton(
                    onPressed:(){
                      setState((){
                        notes.add(input);
                      });
                      Navigator.of(context).pop();
                    },
                    child:Text("ADD", style:TextStyle(color:Colors.amber[700],fontWeight:FontWeight.w900,fontSize:16))
                  )
                ]
              );
            }
          );
        },
        backgroundColor:Colors.amber[700],
        child:Icon(Icons.add,color:Colors.white)
      )
    );
  }
}