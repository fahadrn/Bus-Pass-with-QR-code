// ignore_for_file: prefer_final_fields, unused_field, unused_local_variable, prefer_const_constructors, use_key_in_widget_constructors, sort_child_properties_last, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class User {
  final String name;
  final String phone;
  final String age;

  User({
    required this.name,
    required this.phone,
    required this.age,
  });
}

class Bus {
  final String from;
  final String to;
  final String departureTime;
  final String duration;
  final String busName;

  Bus({
    required this.from,
    required this.to,
    required this.departureTime,
    required this.duration,
    required this.busName,
  });
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isAdmin = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (username == 'admin' && password == 'admin123') {
      // Admin login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AdminScreen(),
        ),
      );
    } else if (username == 'user' && password == 'user123') {
      // User login
      User user = User(
        name: 'John Doe',
        phone: '1234567890',
        age: '25',
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => UserScreen(user: user),
        ),
      );
    } else {
      // Invalid login
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid credentials. Please try again.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  void _handleRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            child: Text('Login'),
            onPressed: _handleLogin,
          ),
          TextButton(
            child: Text('Register'),
            onPressed: _handleRegistration,
          ),
        ],
      ),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleRegistration() {
    final String name = _nameController.text.trim();
    final String phone = _phoneController.text.trim();
    final String age = _ageController.text.trim();
    final String password = _passwordController.text.trim();

    // Perform registration logic here
    // You can store the user details in your database or any other storage mechanism

    // Example validation: Check if all fields are filled
    if (name.isNotEmpty &&
        phone.isNotEmpty &&
        age.isNotEmpty &&
        password.isNotEmpty) {
      User user = User(
        name: name,
        phone: phone,
        age: age,
      );
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Registration Successful'),
          content: Text('User registered successfully!'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Go back to the login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserScreen(user: user),
                  ),
                );
              },
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please fill all the fields.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Register'),
              onPressed: _handleRegistration,
            ),
          ],
        ),
      ),
    );
  }
}

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    UserManagementPage(),
    PassManagementPage(),
    BusManagementPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User Management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Pass Management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert),
            label: 'Bus Management',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class UserManagementPage extends StatefulWidget {
  @override
  _UserManagementPageState createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  List<User> _users = [
    User(name: 'John Doe', phone: '1234567890', age: '25'),
    User(name: 'Jane Smith', phone: '9876543210', age: '30'),
    // Add more users here
  ];

  void _removeUser(User user) {
    setState(() {
      _users.remove(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users '),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text('Phone: ${user.phone}, Age: ${user.age}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeUser(user),
            ),
          );
        },
      ),
    );
  }
}

class PassManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pass Management Page',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class BusManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Bus Management Page',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class UserScreen extends StatefulWidget {
  final User user;

  UserScreen({required this.user});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    ProfilePage(user: User(name: 'John Doe', phone: '1234567890', age: '25')),
    PassDetailsPage(),
    BookingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _editProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(user: widget.user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _editProfile,
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Pass Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online_rounded),
            label: 'Booking',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final User user;

  ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              user.name,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Phone:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              user.phone,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Age:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              user.age,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  final User user;

  EditProfileScreen({required this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.user.name;
    _phoneController.text = widget.user.phone;
    _ageController.text = widget.user.age;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final String name = _nameController.text.trim();
    final String phone = _phoneController.text.trim();
    final String age = _ageController.text.trim();

    // Update the user object or save changes to the database

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Changes Saved'),
        content: Text('Profile updated successfully!'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Go back to the profile page
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Save Changes'),
              onPressed: _saveChanges,
            ),
          ],
        ),
      ),
    );
  }
}

class PassDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Bus> buses = [
      Bus(
        busName: 'Bus 1',
        from: 'Calicut',
        to: 'Thrisur',
        departureTime: '9:00 AM',
        duration: '3 hours',
      ),
      Bus(
        busName: 'Bus 2',
        from: 'Thrisur',
        to: 'Calicut',
        departureTime: '12:00 PM',
        duration: '2 hours',
      ),
      Bus(
        busName: 'Bus 3',
        from: 'Kannur',
        to: 'Kochi',
        departureTime: '3:00 PM',
        duration: '4 hours',
      ),
      Bus(
        busName: 'Bus 4',
        from: 'Kochi',
        to: 'Palakkad',
        departureTime: '8:00 PM',
        duration: '4 hours',
      ),
      Bus(
        busName: 'Bus 5',
        from: 'Palakkad',
        to: 'Calicut',
        departureTime: '10:00 AM',
        duration: '4 hours',
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0),
            Text(
              'Bus Details',
              style: TextStyle(fontSize: 24.0),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Bus Name')),
                DataColumn(label: Text('From')),
                DataColumn(label: Text('To')),
                DataColumn(
                  label: Text('Departure Time'),
                  numeric: true,
                ),
                DataColumn(
                  label: Text('Duration'),
                  numeric: true,
                ),
              ],
              rows: buses.map((bus) {
                return DataRow(
                  cells: [
                    DataCell(Text(bus.busName)),
                    DataCell(Text(bus.from)),
                    DataCell(Text(bus.to)),
                    DataCell(Text(bus.departureTime)),
                    DataCell(Text(bus.duration)),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 100.0),
            Center(
              child: ElevatedButton(
                child: Text('Go to Booking'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String _selectedFrom = '';
  String _selectedTo = '';
  String _selectedTime = '';
  DateTime? _selectedDate;
  bool _paymentSuccess = false;

  final List<String> from = [
    'Calicut',
    'Thrisur',
    'Kannur',
    'Palakkad',
    'Kochi'
  ];
  final List<String> to = ['Kochi', 'Palakkad', 'Kannur', 'Thrisur', 'Calicut'];
  final List<String> times = [
    '9:00 AM',
    '12:00 PM',
    '3:00 PM',
    '8:00 PM',
    '10:00 AM'
  ];

  void _selectFrom() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Departure'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.generate(from.length, (index) {
              return ListTile(
                title: Text(from[index]),
                onTap: () {
                  setState(() {
                    _selectedFrom = from[index];
                  });
                  Navigator.pop(context);
                },
              );
            }),
          ),
        );
      },
    );
  }

  void _selectTo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Destination'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.generate(to.length, (index) {
              return ListTile(
                title: Text(to[index]),
                onTap: () {
                  setState(() {
                    _selectedTo = to[index];
                  });
                  Navigator.pop(context);
                },
              );
            }),
          ),
        );
      },
    );
  }

  void _selectTime() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Time'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.generate(times.length, (index) {
              return ListTile(
                title: Text(times[index]),
                onTap: () {
                  setState(() {
                    _selectedTime = times[index];
                  });
                  Navigator.pop(context);
                },
              );
            }),
          ),
        );
      },
    );
  }

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _makePayment() {
    if (_selectedTime.isNotEmpty &&
        _selectedFrom.isNotEmpty &&
        _selectedTo.isNotEmpty &&
        _selectedDate != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(
            time: _selectedTime,
            from: _selectedFrom,
            to: _selectedTo,
            date: _selectedDate!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BOOK YOUR TICKETS',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Select Departure'),
                onPressed: _selectFrom,
              ),
              SizedBox(height: 16.0),
              Text(
                'From: ${_selectedFrom.isNotEmpty ? _selectedFrom : 'Not selected'}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Select Destination'),
                onPressed: _selectTo,
              ),
              SizedBox(height: 16.0),
              Text(
                'To: ${_selectedTo.isNotEmpty ? _selectedTo : 'Not selected'}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Select Time'),
                onPressed: _selectTime,
              ),
              SizedBox(height: 16.0),
              Text(
                'Time: ${_selectedTime.isNotEmpty ? _selectedTime : 'Not selected'}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Select Date'),
                onPressed: _selectDate,
              ),
              SizedBox(height: 16.0),
              Text(
                'Date: ${_selectedDate?.toString() ?? 'Not selected'}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Make Payment'),
                onPressed: (_selectedTime.isNotEmpty &&
                        _selectedFrom.isNotEmpty &&
                        _selectedTo.isNotEmpty &&
                        _selectedDate != null)
                    ? _makePayment
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final String from;
  final String to;
  final String time;
  final DateTime date;

  PaymentPage({
    required this.from,
    required this.to,
    required this.time,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'From: $from',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'To: $to',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Time: $time',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Date: ${date.toString()}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Make Payment'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Payment'),
                      content: Text('Payment successful!'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(
                                context); // Go back to the booking page
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
