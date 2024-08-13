import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../Modal/Employe_Modal.dart';

class EmpController extends GetxController
{
  RxList empList = [].obs;
  TextEditingController txtId = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtWorkTitle = TextEditingController();

  void addData(EmpModel emp)
  {
    empList.add(emp);
  }

  void deleteData(int index)
  {
    empList.removeAt(index);
  }

  void editData(int index)
  {
    txtId.text = empList[index].empId.toString();
    txtName.text = empList[index].name;
    txtWorkTitle.text = empList[index].workTitle;
  }

  void saveEditData(int index)
  {
    empList[index].empId = int.parse(txtId.text);
    empList[index].name = txtName.text;
    empList[index].workTitle = txtWorkTitle.text;
    empList.refresh();
  }
}