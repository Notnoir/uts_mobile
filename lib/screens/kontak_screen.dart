import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String avatarUrl;
  final Color bgColor;

  Contact({
    required this.name,
    required this.phone,
    required this.avatarUrl,
    required this.bgColor,
  });
}

class KontakScreen extends StatefulWidget {
  const KontakScreen({super.key});

  @override
  State<KontakScreen> createState() => _KontakScreenState();
}

class _KontakScreenState extends State<KontakScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  static final List<Contact> _contacts = [
    Contact(
      name: 'Ahmad Rizki',
      phone: '+62 812-3456-7890',
      avatarUrl: 'A',
      bgColor: const Color(0xFFA8E6CF),
    ),
    Contact(
      name: 'Budi Santoso',
      phone: '+62 813-4567-8901',
      avatarUrl: 'B',
      bgColor: const Color(0xFFF9E2AF),
    ),
    Contact(
      name: 'Citra Dewi',
      phone: '+62 814-5678-9012',
      avatarUrl: 'C',
      bgColor: const Color(0xFFA8E6CF),
    ),
    Contact(
      name: 'Dian Permata',
      phone: '+62 815-6789-0123',
      avatarUrl: 'D',
      bgColor: const Color(0xFFF9E2AF),
    ),
    Contact(
      name: 'Eko Prasetyo',
      phone: '+62 816-7890-1234',
      avatarUrl: 'E',
      bgColor: const Color(0xFFA8E6CF),
    ),
    Contact(
      name: 'Fitri Handayani',
      phone: '+62 817-8901-2345',
      avatarUrl: 'F',
      bgColor: const Color(0xFFF9E2AF),
    ),
  ];

  List<Contact> get _filteredContacts {
    if (_searchQuery.isEmpty) {
      return _contacts;
    }
    return _contacts.where((contact) {
      return contact.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          contact.phone.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header - sama dengan biodata
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9D5FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF222222), width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF222222),
                      offset: Offset(4, 4),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: const Text(
                  'Daftar Kontak',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF222222),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF222222), width: 4),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF222222),
                    offset: Offset(4, 4),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Icon(
                      Icons.search,
                      size: 28,
                      color: Color(0xFF222222),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF222222),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Cari kontak...',
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Contact List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
              itemCount: _filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = _filteredContacts[index];
                final buttonColor = index % 2 == 0
                    ? const Color(0xFFFFD3B6)
                    : const Color(0xFFFFADAD);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: contact.bgColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF222222),
                        width: 4,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFF222222),
                          offset: Offset(4, 4),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Avatar with shadow
                        Stack(
                          children: [
                            // Shadow circle
                            Positioned(
                              top: 4,
                              left: 4,
                              child: Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue.shade300,
                                  border: Border.all(
                                    color: Colors.blue.shade500,
                                    width: 4,
                                  ),
                                ),
                              ),
                            ),
                            // Main circle
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.shade400,
                                border: Border.all(
                                  color: Colors.blue.shade500,
                                  width: 4,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  contact.avatarUrl,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),

                        // Contact Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF222222),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                contact.phone,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF888888),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Action Buttons
                        Row(
                          children: [
                            _buildActionButton(
                              icon: Icons.mail,
                              color: buttonColor,
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                            _buildActionButton(
                              icon: Icons.call,
                              color: buttonColor,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF5936B4), Color(0xFF362A84)],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF222222), width: 4),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF222222),
              offset: Offset(6, 6),
              blurRadius: 0,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // Add contact action
            },
            borderRadius: BorderRadius.circular(12),
            child: const Center(
              child: Icon(Icons.add, size: 40, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTapDown: (_) => setState(() {}),
      onTapUp: (_) {
        setState(() {});
        onPressed();
      },
      onTapCancel: () => setState(() {}),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF222222), width: 2),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF222222),
              offset: Offset(4, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: Icon(icon, size: 24, color: const Color(0xFF222222)),
      ),
    );
  }
}
