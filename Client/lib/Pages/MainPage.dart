import "package:flutter/material.dart";
import "package:business_rules/Enterprise/Task.dart";
import "package:my_first_flutter_application/TaskCard.dart";


class MainPage extends StatefulWidget {

  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {

  List<Task> tasks = [];
  String inputtedTask = "";

  @override
  void initState() {
    super.initState();
    tasks.addAll([
      new Task(title: "Buy milk", description: "Of leading trademark"),
      new Task(title: "Buy batteries", description: "Duracell"),
      new Task(title: "Pay the bills")
    ]);
  }

  void openMenu() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text("Menu")),
          body: Column(
            children: []
          )
        );
      })
    );
  }

  void editTask(int targetTaskIndex) {
    print("edit");
    print(targetTaskIndex);
  }

  void deleteTask(int targetTaskIndex) {
    print("delete");
    print(targetTaskIndex);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("TODO List"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: openMenu
          )
        ]
      ),

      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskCard(
            task: this.tasks[index],
            onPressEditTaskButton: () => { editTask(index) },
            onPressDeleteTaskButton: () => { deleteTask(index) },
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor:  Colors.redAccent,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Add new"),
              content: TextField(
                onChanged: (String value) {
                  /* 〔 理論 〕 利用者に直ぐ表示する必要は無いので、今回はステート無しで良い。 */
                  inputtedTask = value;
                }
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Text("Add")
                )
              ]
            );
          });
        },
        child: Icon(Icons.add_box, color: Colors.white)
      )
    );
  }
}
