import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../services/api_services.dart';

class TodoViewModel extends ChangeNotifier {
  List<TodoModel> _todos = [];
  bool _isLoading = false;

  List<TodoModel> get todos => _todos;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> fetchTodos() async {

    _isLoading = true;
    notifyListeners();

    try {
      _todos = await _apiService.fetchTodos();
    } catch (e) {
      print('Error fetching todos: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
