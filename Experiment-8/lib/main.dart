import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const FirestoreSearchApp());
}

class FirestoreSearchApp extends StatelessWidget {
  const FirestoreSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Student Search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const StudentSearchPage(),
    );
  }
}

class StudentSearchPage extends StatefulWidget {
  const StudentSearchPage({super.key});

  @override
  State<StudentSearchPage> createState() =>
      _StudentSearchPageState();
}

class _StudentSearchPageState
    extends State<StudentSearchPage> {
  final TextEditingController searchController =
      TextEditingController();

  List<Map<String, dynamic>> students = [];
  bool isLoading = false;
  String message = 'Enter a student name or registration number.';

  Future<void> searchStudents() async {
    final String searchText =
        searchController.text.trim();

    if (searchText.isEmpty) {
      setState(() {
        students = [];
        message = 'Please enter a search value.';
      });
      return;
    }

    setState(() {
      isLoading = true;
      students = [];
      message = '';
    });

    try {
      final collection =
          FirebaseFirestore.instance.collection('students');

      // Search by exact registration number.
      final registrationQuery = await collection
          .where(
            'registrationNumber',
            isEqualTo: searchText,
          )
          .get();

      // Search by exact student name.
      final nameQuery = await collection
          .where(
            'name',
            isEqualTo: searchText,
          )
          .get();

      // Combine results without duplicating documents.
      final Map<String, Map<String, dynamic>> results = {};

      for (final document in registrationQuery.docs) {
        results[document.id] = document.data();
      }

      for (final document in nameQuery.docs) {
        results[document.id] = document.data();
      }

      if (!mounted) return;

      setState(() {
        students = results.values.toList();
        message = students.isEmpty
            ? 'No matching student found.'
            : 'Search completed successfully.';
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        students = [];
        message = 'Search failed. Please check your '
            'internet connection and Firestore permissions.';
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Student Search'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.search,
                  size: 65,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Search Student Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    labelText: 'Name or Registration Number',
                    hintText: 'Enter student details',
                    prefixIcon: Icon(Icons.person_search),
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (_) => searchStudents(),
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed:
                      isLoading ? null : searchStudents,
                  icon: const Icon(Icons.search),
                  label: const Text('Search Student'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),
                ),
                const SizedBox(height: 20),
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (!isLoading && message.isNotEmpty)
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15),
                  ),
                const SizedBox(height: 12),
                ...students.map((student) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            student['name']?.toString()
                                ?? 'N/A',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          _buildDetail(
                            'Registration Number',
                            student['registrationNumber'],
                          ),
                          _buildDetail(
                            'Department',
                            student['department'],
                          ),
                          _buildDetail(
                            'Marks',
                            student['marks'],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value?.toString() ?? 'N/A'),
          ),
        ],
      ),
    );
  }
}