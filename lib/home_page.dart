import 'package:flutter/material.dart';

class Course {
  final String name;
  final String duration;
  final String tuition;

  const Course({
    required this.name,
    required this.duration,
    required this.tuition,
  });
}

class Program {
  final String title;
  final List<Course> courses;

  const Program({
    required this.title,
    required this.courses,
  });
}

final List<Program> programs = [
  const Program(
    title: 'Certification Programs',
    courses: [
      Course(name: 'Data Science', duration: '9 Months', tuition: '350,000 FRS'),
      Course(name: 'DevOps', duration: '9 Months', tuition: '350,000 FRS'),
      Course(name: 'Industrial Web Design', duration: '6 Months', tuition: '300,000 FRS'),
      Course(name: 'Digital Marketing and SEO', duration: '6 Months', tuition: '350,000 FRS'),
    ],
  ),
  const Program(
    title: 'Engineering & Technology — HND (2 Years)',
    courses: [
      Course(name: 'Software Engineering', duration: '2 Years', tuition: '250,000 FRS'),
      Course(name: 'Web and Graphics Design', duration: '2 Years', tuition: '250,000 FRS'),
      Course(name: 'Digital Marketing and E-Commerce', duration: '2 Years', tuition: '250,000 FRS'),
      Course(name: 'Network and Maintenance', duration: '2 Years', tuition: '250,000 FRS'),
    ],
  ),
  const Program(
    title: 'Engineering & Technology — ND (1 Year)',
    courses: [
      Course(name: 'Computer Engineering', duration: '1 Year', tuition: '150,000 FRS'),
      Course(name: 'ICT', duration: '1 Year', tuition: '150,000 FRS'),
      Course(name: 'Web Design', duration: '1 Year', tuition: '150,000 FRS'),
      Course(name: 'Graphics Design and Printing', duration: '1 Year', tuition: '150,000 FRS'),
      Course(name: 'Basic Computer', duration: '1 Year', tuition: '150,000 FRS'),
      Course(name: 'Office Automation Secretaryship', duration: '1 Year', tuition: '150,000 FRS'),
      Course(name: 'Computerized Accounting', duration: '1 Year', tuition: '150,000 FRS'),
    ],
  ),
  const Program(
    title: 'Business & Management — HND (2 Years)',
    courses: [
      Course(name: 'Accounting', duration: '2 Years', tuition: '250,000 FRS'),
      Course(name: 'Management', duration: '2 Years', tuition: '250,000 FRS'),
      Course(name: 'Marketing', duration: '2 Years', tuition: '250,000 FRS'),
      Course(name: 'Digital Marketing', duration: '2 Years', tuition: '250,000 FRS'),
      Course(name: 'Human Resource Management', duration: '2 Years', tuition: '250,000 FRS'),
    ],
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B4C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D1B4C),
        elevation: 0,
        title: const Text('Liah Academy'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Welcome!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Explore our programs and register for courses.',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 24),
          ...programs.map((program) => _ProgramCard(program: program)),
        ],
      ),
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final Program program;

  const _ProgramCard({required this.program});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF15205C),
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        iconColor: Colors.amber,
        collapsedIconColor: Colors.amber,
        title: Text(
          program.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        children: program.courses.map((course) {
          return ListTile(
            title: Text(
              course.name,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '${course.duration} • ${course.tuition}',
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Registered for ${course.name} (placeholder)')),
                );
              },
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}