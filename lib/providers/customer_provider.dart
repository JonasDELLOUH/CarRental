import 'package:car_rental/services/customer_services.dart';
import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../models/member.dart';

enum CustomerStatus { GettingCustomer, CustomerGot, NoCustomer }

class CustomerProvider extends ChangeNotifier {
  CustomerStatus _customerStatus = CustomerStatus.GettingCustomer;

  @override
  notifyListeners();

  CustomerStatus get customerStatus => _customerStatus;

  set customerStatus(CustomerStatus value) {
    _customerStatus = value;
  }

  notify() {
    notifyListeners();
  }

  CustomerServices customerServices = CustomerServices();

  Future<Customer?> getCustomer({required Member member}) async {
    customerStatus = CustomerStatus.GettingCustomer;
    notify();
    Customer? customer;
    if (await customerServices.isCustomer(member)) {
      customer = await customerServices.getCustomer(member);
      customerStatus = CustomerStatus.CustomerGot;
      notify();
    }
    return customer;
  }
}
