import 'package:flutter/material.dart';
import 'json/user.dart';
import 'json/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'parcial 3 - 25-6588-2012',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('parcial 3 - 25-6588-2012'),
          leading: Icon(Icons.star),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'REQRES.IN',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'API trae por medio de json lista de personas con sus caracteristicas',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<User>>(
                future: fetchUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    usersList = snapshot.data!;
                    return ListView.builder(
                      itemCount: usersList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Color.fromARGB(255, 112, 112, 112),
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(usersList[index].avatar),
                                  radius:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      usersList[index].firstName +
                                          ' ' +
                                          usersList[index].lastName,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    SizedBox(height: 8),
                                    Text(usersList[index].email),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
