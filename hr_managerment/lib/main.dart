import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmployeeList(),
    );
  }
}

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: isGridView ? EmployeeGrid() : EmployeeListView(),
    );
  }
}

class EmployeeCardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset('assets/Card - Albums.png'), // Tên hình ảnh dựa vào index
          Text('Employee Name'),
          Text('Age: 30'),
          Text('Position: Developer'),
        ],
      ),
    );
  }
}


class EmployeeCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(
            'assets/Card - Albums.png',
            width: 80.0, // Đặt kích thước của hình ảnh
            height: 80.0,
          ),
          SizedBox(width: 16.0), // Khoảng cách giữa hình ảnh và thông tin nhân viên
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Đảm bảo thông tin nằm bên phải của hình ảnh
            children: [
              Text('Employee Name'),
              Text('Age: 30'),
              Text('Position: Developer'),
            ],
          ),
        ],
      ),
    );
  }
}


class EmployeeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.0, // Khoảng cách giữa các hàng
        crossAxisSpacing: 16.0, // Khoảng cách giữa các cột
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return EmployeeCardGrid();
      },
    );
  }
}

class EmployeeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return EmployeeCardList();
      },
    );
  }
}

