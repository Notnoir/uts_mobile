import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'dashboard_screen.dart';

class FloatingIcon {
  String iconPath;
  double left;
  double top;
  double size;
  double duration;
  double delay;

  FloatingIcon({
    required this.iconPath,
    required this.left,
    required this.top,
    required this.size,
    required this.duration,
    required this.delay,
  });
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;
  late List<AnimationController> _floatingControllers;
  late List<Animation<double>> _floatingAnimations;
  late List<FloatingIcon> _floatingIcons;

  @override
  void initState() {
    super.initState();

    // Initialize floating icons with random positions
    final random = Random();
    final iconPaths = [
      'public/icons/Photo.png',
      'public/icons/Video.png',
      'public/icons/Message.png',
      'public/icons/Folder.png',
      'public/icons/CreditCard.png',
      'public/icons/Menu.png',
      'public/icons/Pause.png',
    ];

    _floatingIcons = List.generate(12, (index) {
      return FloatingIcon(
        iconPath: iconPaths[random.nextInt(iconPaths.length)],
        left: random.nextDouble() * 100, // 0-100%
        top: random.nextDouble() * 100, // 0-100%
        size: 30 + random.nextDouble() * 30, // 30-60
        duration: 3 + random.nextDouble() * 4, // 3-7 seconds
        delay: random.nextDouble() * 2, // 0-2 seconds delay
      );
    });

    // Initialize floating animations
    _floatingControllers = List.generate(
      _floatingIcons.length,
      (index) => AnimationController(
        duration: Duration(
          milliseconds: (_floatingIcons[index].duration * 1000).toInt(),
        ),
        vsync: this,
      ),
    );

    _floatingAnimations = _floatingControllers.map((controller) {
      return Tween<double>(
        begin: -20,
        end: 20,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();

    // Start floating animations with delays
    for (int i = 0; i < _floatingControllers.length; i++) {
      Future.delayed(
        Duration(milliseconds: (_floatingIcons[i].delay * 1000).toInt()),
        () {
          if (mounted) {
            _floatingControllers[i].repeat(reverse: true);
          }
        },
      );
    }

    _progressController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeOut),
    );

    _progressController.forward();

    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    for (var controller in _floatingControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: Stack(
        children: [
          // Floating Icons
          ...List.generate(_floatingIcons.length, (index) {
            final icon = _floatingIcons[index];
            return Positioned(
              left: (screenWidth * icon.left / 100) - (icon.size / 2),
              top: (screenHeight * icon.top / 100) - (icon.size / 2),
              child: AnimatedBuilder(
                animation: _floatingAnimations[index],
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      _floatingAnimations[index].value,
                      _floatingAnimations[index].value * 0.5,
                    ),
                    child: Opacity(
                      opacity: 0.15,
                      child: Container(
                        width: icon.size,
                        height: icon.size,
                        decoration: BoxDecoration(
                          color: const Color(0xFF5936B4).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          _getIconData(index),
                          size: icon.size * 0.6,
                          color: const Color(0xFF5936B4),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),

          // Main Content
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Title Box
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF5113EC),
                          border: Border.all(
                            color: const Color(0xFF222222),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFF000000),
                              offset: Offset(4, 4),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: const Text(
                          'UTS PEMROGRAMAN MOBILE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                            shadows: [
                              Shadow(offset: Offset(2, 2), color: Colors.black),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Profile Picture
                      Container(
                        width: 144,
                        height: 144,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF222222),
                            width: 4,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFF000000),
                              offset: Offset(4, 4),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'public/riza.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade300,
                                child: Icon(
                                  Icons.person,
                                  size: 80,
                                  color: Colors.grey.shade600,
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // User Info
                      const Text(
                        'RIZA MAULANA TAMSIRIN',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF131118),
                          letterSpacing: -0.3,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        '152023109',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF131118),
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 48),

                      // Progress Bar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9999),
                            border: Border.all(
                              color: const Color(0xFF222222),
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: AnimatedBuilder(
                              animation: _progressAnimation,
                              builder: (context, child) {
                                return FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: _progressAnimation.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF5936B4),
                                          Color(0xFF362A84),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(9999),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconData(int index) {
    final icons = [
      Icons.photo_camera,
      Icons.videocam,
      Icons.message,
      Icons.folder,
      Icons.credit_card,
      Icons.menu,
      Icons.pause,
      Icons.favorite,
      Icons.star,
      Icons.settings,
      Icons.person,
      Icons.notifications,
    ];
    return icons[index % icons.length];
  }
}
