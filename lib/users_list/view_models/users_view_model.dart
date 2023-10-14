import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mvvm_test/users_list/models/Users_List_Model.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError _userError;

  bool get Loading => _loading;
  List<UserModel> get UserListModel => _userListModel;
  UserError get UserError => _userError;

  setLoading(bool Loading) async {
    _loading = Loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> UserListModel) {
    _userListModel = UserListModel;
  }

  setUserError(UserError userError) {
    userError = _userError;
  }
}
