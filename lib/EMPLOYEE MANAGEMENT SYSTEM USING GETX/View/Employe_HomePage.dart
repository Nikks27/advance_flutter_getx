import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/Employe_Controller.dart';
import '../Modal/Employe_Modal.dart';

EmpController empController = Get.put(EmpController());
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Employee Details',style: TextStyle(fontSize: 20,),),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: empController.empList.length,
          itemBuilder: (context, index) => Card(
            color: Colors.grey.shade700,
            child: ListTile(
              leading: Text(
                empController.empList[index].empId.toString(),
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              title: Text(
                empController.empList[index].name,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: Colors.white),
              ),
              subtitle: Text(
                empController.empList[index].workTitle,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      empController.editData(index);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Update employee detail'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: empController.txtId,
                                decoration: InputDecoration(
                                    hintText: 'Enter your employee id'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: empController.txtName,
                                decoration: InputDecoration(
                                    hintText: 'Enter your name'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: empController.txtWorkTitle,
                                decoration: InputDecoration(
                                    hintText: 'Enter your workTitle'),
                              ),
                            ],
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancle',
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                                empController.saveEditData(index);
                              },
                              child: Text('Save'),
                            )
                          ],
                        ),
                      );
                    },
                    icon: Icon(Icons.edit, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      empController.deleteData(index);
                    },
                    icon: Icon(Icons.delete, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade500,
        onPressed: () {
          empController.txtId.clear();
          empController.txtName.clear();
          empController.txtWorkTitle.clear();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add employee detail'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: empController.txtId,
                    decoration:
                    InputDecoration(hintText: 'Enter your Employee id'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: empController.txtName,
                    decoration: InputDecoration(hintText: 'Enter your name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: empController.txtWorkTitle,
                    decoration:
                    InputDecoration(hintText: 'Enter your workTitle'),
                  ),
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancle'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    EmpModel emp = EmpModel(
                        int.parse(empController.txtId.text),
                        empController.txtName.text,
                        empController.txtWorkTitle.text);
                    empController.addData(emp);
                  },
                  child: Text('Save'),
                )
              ],
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
