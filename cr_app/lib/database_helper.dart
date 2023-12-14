// ignore_for_file: prefer_const_constructors

import 'package:cr_app/navigation_drawer.dart';
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

  const AssignmentScreen({super.key, required this.role, required this.id});

  final String role;
  final String id;


  @override
  _AssignmentScreenState createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late List<Map<String, dynamic>> _Assignments = [];

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

        foregroundColor: Colors.cyan.shade100,
        title: const Text("Your Tasks"),
        elevation: 10,
        backgroundColor: Colors.cyan.shade600,

        actions: <Widget>[
          Container(
            child: Image.asset('assets/images/logo.png'),
          ),
        ], 

        shape: const RoundedRectangleBorder(

          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )

        ),

      ),

      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [

                SizedBox(
                  height: 20.0,
                ),


                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Enter Task Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.add_task_sharp)
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),


                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: "Enter Task Deadline",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.more_time_rounded)
                  ),
                ),
                

                SizedBox(
                  height: 20.0,
                ),
                
                
                ElevatedButton(
                  onPressed: () {
                    _addAssignment();
                  },

                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink.shade500, // Change the button's background color here
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0), // Add border radius here
                    ),
                  ),

                  child: Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    
                    child: Text(
                      "Add Task",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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

      drawer: NavigationDrawer(role: widget.role, id: widget.id),
    
    );
  }
}


