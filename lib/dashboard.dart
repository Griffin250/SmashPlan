import 'package:flutter/material.dart';

void main() {
  runApp(const BurgerShopApp());
}

class BurgerShopApp extends StatelessWidget {
  const BurgerShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smashed AS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 225, 208, 23)),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2937),
        title: const Text('SmashPlan'),
        titleTextStyle: const TextStyle(color: Color.fromARGB(255, 230, 186, 9), fontSize: 28, fontWeight: FontWeight.bold),
        
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.help_outline)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.mail_outline)),
              const CircleAvatar(backgroundImage: AssetImage('assets/user.png')), // Replace with your asset
              const SizedBox(width: 16)
            ],
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: const Color.fromARGB(207, 236, 170, 4),
            child: Row(
              children: [
                const SizedBox(width: 16),
                _NavItem(title: 'Home'),
                _NavItem(title: 'Schedule'),
                _NavItem(title: 'People'),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      _Card(
                        title: 'Pending actions',
                        child: Column(
                          children: [
                            Image.asset('assets/pending.png', height: 100),
                            const SizedBox(height: 12),
                            const Text('No data to display'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      _Card(
                        title: 'Events',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('See the latest events shared with you'),
                            SizedBox(height: 8),
                            Text('Go to events', style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: _Card(
                    title: 'News',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Check out the latest news posts'),
                        SizedBox(height: 8),
                        Text('Go to news', style: TextStyle(color: Colors.blue, )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  const _NavItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final Widget child;

  const _Card({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}
