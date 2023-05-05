import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as paths;
import 'dart:core';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;

  DatabaseHelper._instance();

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db!;
  }

  Future<Database> _initDb() async {
    final String dbPath = await getDatabasesPath();
    final String path = paths.join(dbPath, 'assignment.db');
    final Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE assignment(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT)',
        );
      },
    );
    return db;
  }

  Future<List<Map<String, dynamic>>> getAllAssignments() async {
    final Database db = await instance.db;
    final List<Map<String, dynamic>> maps = await db.query('assignment');
    return maps;
  }

  Future<int> insertAssignment(Map<String, dynamic> row) async {
    final Database db = await instance.db;
    return await db.insert('assignment', row);
  }

  Future<int> updateAssignment(Map<String, dynamic> row, int id) async {
    final Database db = await instance.db;
    return await db.update('assignment', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAssignment(int id) async {
    final Database db = await instance.db;
    return await db.delete('assignment', where: 'id = ?', whereArgs: [id]);
  }
}

class AssignmentScreen extends StatefulWidget {
  @override
  _AssignmentScreenState createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late List<Map<String, dynamic>> _Assignments;

  @override
  void initState() {
    super.initState();
    _getAllAssignments();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _getAllAssignments() async {
    _Assignments = await DatabaseHelper.instance.getAllAssignments();
    setState(() {});
  }

  Future<void> _addAssignment() async {
    Map<String, dynamic> row = {
      'name': _nameController.text,
      'description': _descriptionController.text,
    };
    await DatabaseHelper.instance.insertAssignment(row);
    _nameController.clear();
    _descriptionController.clear();
    await _getAllAssignments();
  }

  Future<void> _updateAssignment(Map<String, dynamic> row, int id) async {
    Map<String, dynamic> row = {
      'name': _nameController.text,
      'description': _descriptionController.text,
    };
    await DatabaseHelper.instance.updateAssignment(row, id);
    _nameController.clear();
    _descriptionController.clear();
    await _getAllAssignments();
  }

  Future<void> _deleteAssignment(int id) async {
    await DatabaseHelper.instance.deleteAssignment(id);
    await _getAllAssignments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFlite Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Enter name'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(hintText: 'Enter description'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addAssignment();
                  },
                  child: Text('Add Assignment'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _Assignments.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> Assignment = _Assignments[index];
                return ListTile(
                  title: Text(Assignment['name']),
                  subtitle: Text(Assignment['description']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteAssignment(Assignment['id']);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'Assignment have been deleted successfully!!!')));
                    },
                  ),
                  onTap: () {
                    _nameController.text = Assignment['name'];
                    _descriptionController.text = Assignment['description'];
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Edit Assignment'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: _nameController,
                                decoration:
                                    InputDecoration(hintText: 'Enter name'),
                              ),
                              TextField(
                                controller: _descriptionController,
                                decoration: InputDecoration(
                                    hintText: 'Enter description'),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                _updateAssignment(Assignment, Assignment['id']);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Assignment have been updated successfully!!!')));

                                Navigator.pop(context);
                              },
                              child: Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}