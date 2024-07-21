import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled/API/Models/orders_model.dart';
import 'package:untitled/Widgest/custom_textfiled.dart';
import 'package:untitled/API/Services/updata_orders.dart';


class UpdateOrderScreen extends StatefulWidget {
  UpdateOrderScreen({super.key});

  static String id = 'UpdateOrder';

  @override
  State<UpdateOrderScreen> createState() => _UpdateOrderScreenState();
}

class _UpdateOrderScreenState extends State<UpdateOrderScreen> {
  int? orderId;
  String? status, message;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    OrdersModel order = ModalRoute.of(context)!.settings.arguments as OrdersModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Order Update',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  inputtype: TextInputType.number,
                  onChanged: (data) {
                    orderId = int.parse(data);
                  },
                  hintText: 'Enter Order Id',
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: (data) {
                    status = data;
                  },
                  hintText: 'Enter Status',
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: (data) {
                    message = data;
                  },
                  hintText: 'Enter Message',
                  obscureText: false,
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    isLoading = true;
                    setState(() {});

                    try {
                      print('Done');
                      updateOrder(order);
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(350, 50),
                      fixedSize: Size(400, 50),
                      backgroundColor: Colors.lightBlueAccent),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateOrder(OrdersModel order) {
    UpdateOrder().updateorder(
      order_id: orderId == null ? order.order_id: orderId !,
      status: status == null ? order.status: status !,
      message: message == null ? order.message: message !,
    );
  }
}
