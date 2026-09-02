import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const DarbApp());
}

class DarbApp extends StatelessWidget {
  const DarbApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'درب - طريقك الأسهل للنجاح',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D1B2A),
        primaryColor: const Color(0xFF1B263B),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF2EC4B6),
          secondary: Color(0xFFFFB703),
          surface: Color(0xFF1B263B),
          background: Color(0xFF0D1B2A),
        ),
        fontFamily: 'Roboto',
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1B263B),
          hintStyle: const TextStyle(color: Colors.white54, fontSize: 13),
          labelStyle: const TextStyle(color: Color(0xFF2EC4B6)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.white12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF2EC4B6), width: 1.8),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFB703),
            foregroundColor: const Color(0xFF0D1B2A),
            elevation: 4,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: AuthDecisionScreen(),
      ),
    );
  }
}

// 1. شاشة تسجيل الدخول وإنشاء الحساب
class AuthDecisionScreen extends StatefulWidget {
  const AuthDecisionScreen({Key? key}) : super(key: key);

  @override
  State<AuthDecisionScreen> createState() => _AuthDecisionScreenState();
}

class _AuthDecisionScreenState extends State<AuthDecisionScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2EC4B6), Color(0xFFFFB703)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2EC4B6).withOpacity(0.35),
                        blurRadius: 20,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.school_rounded, size: 55, color: Color(0xFF0D1B2A)),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'دَرْبْ',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'طريقك الأسهل للنجاح الأكاديمي',
                  style: TextStyle(fontSize: 14, color: Color(0xFF2EC4B6)),
                ),
                const SizedBox(height: 28),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B263B),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isLogin = true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isLogin ? const Color(0xFF2EC4B6) : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isLogin ? const Color(0xFF0D1B2A) : Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isLogin = false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: !isLogin ? const Color(0xFF2EC4B6) : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'إنشاء حساب جديد',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: !isLogin ? const Color(0xFF0D1B2A) : Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: isLogin ? const LoginForm() : const SignUpForm(),
                ),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white24)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('أو المتابعة عبر', style: TextStyle(color: Colors.white54, fontSize: 12)),
                    ),
                    Expanded(child: Divider(color: Colors.white24)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white24),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const MainNavHolder(userName: 'طالب متميز')),
                          );
                        },
                        icon: const Icon(Icons.g_mobiledata, size: 28, color: Colors.white),
                        label: const Text('Google', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white24),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const MainNavHolder(userName: 'طالب متميز')),
                          );
                        },
                        icon: const Icon(Icons.apple, size: 24, color: Colors.white),
                        label: const Text('Apple / iCloud', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _isLoading = false;

  void _login() {
    if (_emailController.text.isEmpty || _passController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إدخال البريد الإلكتروني وكلمة المرور')),
      );
      return;
    }
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _isLoading = false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainNavHolder(userName: _emailController.text.split('@').first)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'البريد الإلكتروني',
            prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF2EC4B6)),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: _passController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'كلمة المرور',
            prefixIcon: Icon(Icons.lock_outline, color: Color(0xFF2EC4B6)),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _login,
            child: _isLoading
                ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2))
                : const Text('دخول'),
          ),
        ),
      ],
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _nameController = TextEditingController();
  final _majorController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String _selectedLevel = 'المستوى الأول';

  final List<String> _levels = [
    'المستوى الأول',
    'المستوى الثاني',
    'المستوى الثالث',
    'المستوى الرابع',
    'المستوى الخامس',
    'دراسات عليا',
  ];

  void _signup() {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى ملء جميع الحقول الأساسية')),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => MainNavHolder(userName: _nameController.text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'الاسم الكامل',
            prefixIcon: Icon(Icons.person_outline, color: Color(0xFF2EC4B6)),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _majorController,
          decoration: const InputDecoration(
            labelText: 'التخصص الجامعي (مثل: علوم الحاسوب)',
            prefixIcon: Icon(Icons.school_outlined, color: Color(0xFF2EC4B6)),
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: _selectedLevel,
          decoration: const InputDecoration(
            labelText: 'المستوى الأكاديمي',
            prefixIcon: Icon(Icons.stairs_outlined, color: Color(0xFF2EC4B6)),
          ),
          dropdownColor: const Color(0xFF1B263B),
          items: _levels.map((lvl) => DropdownMenuItem(value: lvl, child: Text(lvl))).toList(),
          onChanged: (val) => setState(() => _selectedLevel = val ?? _selectedLevel),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'البريد الإلكتروني',
            prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF2EC4B6)),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _passController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'كلمة المرور الجديدة',
            prefixIcon: Icon(Icons.lock_outline, color: Color(0xFF2EC4B6)),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _signup,
            child: const Text('إنشاء الحساب والبدء'),
          ),
        ),
      ],
    );
  }
}

// 2. شريط التنقل السفلي والتحكم
class MainNavHolder extends StatefulWidget {
  final String userName;
  const MainNavHolder({Key? key, required this.userName}) : super(key: key);

  @override
  State<MainNavHolder> createState() => _MainNavHolderState();
}

class _MainNavHolderState extends State<MainNavHolder> {
  int _currentIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(userName: widget.userName),
      const FavoritesScreen(),
      const OtherMajorsScreen(),
      ProfileScreen(userName: widget.userName),
      const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: const Color(0xFF2EC4B6).withOpacity(0.2),
            labelTextStyle: MaterialStateProperty.resolveWith(
              (states) => TextStyle(
                fontSize: 11,
                fontWeight: states.contains(MaterialState.selected) ? FontWeight.bold : FontWeight.normal,
                color: states.contains(MaterialState.selected) ? const Color(0xFFFFB703) : Colors.white60,
              ),
            ),
            iconTheme: MaterialStateProperty.resolveWith(
              (states) => IconThemeData(
                color: states.contains(MaterialState.selected) ? const Color(0xFFFFB703) : Colors.white60,
              ),
            ),
          ),
          child: NavigationBar(
            backgroundColor: const Color(0xFF14213D),
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) => setState(() => _currentIndex = index),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
              NavigationDestination(icon: Icon(Icons.bookmark_outline), selectedIcon: Icon(Icons.bookmark), label: 'المفضلة'),
              NavigationDestination(icon: Icon(Icons.category_outlined), selectedIcon: Icon(Icons.category), label: 'تخصصات أخرى'),
              NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'الملف الشخصي'),
              NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'الإعدادات'),
            ],
          ),
        ),
      ),
    );
  }
}

// 3. الصفحة الرئيسية
class HomeScreen extends StatelessWidget {
  final String userName;
  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 4 && hour < 12) {
      return 'صباح الخير والهمة،';
    } else if (hour >= 12 && hour < 17) {
      return 'طاب يومك بنجاح،';
    } else {
      return 'مساء الخير والتفوق،';
    }
  }

  @override
  Widget build(BuildContext context) {
    final greeting = _getGreeting();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF2EC4B6).withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.auto_stories, color: Color(0xFF2EC4B6), size: 22),
            ),
            const SizedBox(width: 10),
            const Text('منصة دَرْبْ الذكية', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1B263B), Color(0xFF0D1B2A)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF2EC4B6).withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        greeting,
                        style: const TextStyle(fontSize: 14, color: Color(0xFF2EC4B6), fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        userName.isNotEmpty ? userName : 'يا بطل المستقبل',
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'خطوتك اليوم تصنع تفوقك غداً. ماذا سننجز معاً الآن؟',
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFB703).withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.lightbulb_outline, color: Color(0xFFFFB703), size: 30),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2EC4B6), Color(0xFF0E7C7B)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.format_quote, color: Colors.white, size: 28),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '"النجاح لا يتطلب أن تكون عبقرياً، بل يحتاج إلى الاستمرار والسير في الدرب الصحيح كل يوم."',
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('الخدمات والأدوات الذكية', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 14),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.15,
            children: [
              _buildServiceCard(
                context,
                title: 'بحث عن كتاب',
                subtitle: 'أفضل الكتب وتفاصيلها',
                icon: Icons.search_rounded,
                badgeColor: const Color(0xFF2EC4B6),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BookSearchScreen())),
              ),
              _buildServiceCard(
                context,
                title: 'التلخيص الذكي',
                subtitle: 'رفع ملازم واقتراح اختبارات',
                icon: Icons.summarize_rounded,
                badgeColor: const Color(0xFFFFB703),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SummarizerScreen())),
              ),
              _buildServiceCard(
                context,
                title: 'آخر التطورات',
                subtitle: 'أحدث المصادر والأخبار',
                icon: Icons.trending_up_rounded,
                badgeColor: const Color(0xFF48CAE4),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LatestUpdatesScreen())),
              ),
              _buildServiceCard(
                context,
                title: 'مناقشة AI',
                subtitle: 'توجيه وفهم احتياجاتك',
                icon: Icons.forum_rounded,
                badgeColor: const Color(0xFFE76F51),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DiscussionScreen())),
              ),
              _buildServiceCard(
                context,
                title: 'المعادلات الرياضية',
                subtitle: 'تبسيط وتصوير وحلول',
                icon: Icons.functions_rounded,
                badgeColor: const Color(0xFF9B5DE5),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MathEquationsScreen())),
              ),
              _buildServiceCard(
                context,
                title: 'اختبر ذكائك',
                subtitle: 'امتحانات ملفات مخصصة',
                icon: Icons.quiz_rounded,
                badgeColor: const Color(0xFFF15BB5),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizEngineScreen())),
              ),
            ],
          ),
          const SizedBox(height: 14),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FeedbackScreen())),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1B263B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFB703).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.rate_review_rounded, color: Color(0xFFFFB703), size: 26),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('الاقتراحات والآراء', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        SizedBox(height: 3),
                        Text('شاركنا رأيك، تصفح تجارب زملائك، وساعدنا في تطوير درب', style: TextStyle(fontSize: 12, color: Colors.white60)),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.white38),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, {required String title, required String subtitle, required IconData icon, required Color badgeColor, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1B263B),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: badgeColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: badgeColor, size: 24),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                const SizedBox(height: 3),
                Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.white54), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 4. الخدمات السبع
class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({Key? key}) : super(key: key);
  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  final _searchController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'isAi': true, 'text': 'أهلاً بك! اكتب اسم أي كتاب أو مرجع علمي وسأزودك بتفاصيله وتقييماته فوراً.'}
  ];

  void _search() {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;
    setState(() {
      _messages.add({'isAi': false, 'text': query});
      _messages.add({'isAi': true, 'isBookResult': true, 'query': query, 'text': 'عثرت لك على أفضل المراجع ذات الصلة بـ "$query":'});
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('البحث عن كتاب ومرجع'), backgroundColor: const Color(0xFF1B263B)),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(14),
                itemCount: _messages.length,
                itemBuilder: (context, idx) {
                  final msg = _messages[idx];
                  if (msg['isBookResult'] == true) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBubble(msg['text'], true),
                        _buildBookCard('مرجع شامل في ${msg['query']}', 'د. روبرت مارتن', 4.8, 450, 'كتاب شامل يقدم أساسيات ومفاهيم متقدمة مع أمثلة تطبيقية.'),
                      ],
                    );
                  }
                  return _buildBubble(msg['text'], msg['isAi']);
                },
              ),
            ),
            _buildInputBar(_searchController, 'ابحث عن عنوان كتاب أو مؤلف...', _search),
          ],
        ),
      ),
    );
  }

  Widget _buildBubble(String text, bool isAi) {
    return Align(
      alignment: isAi ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.78),
        decoration: BoxDecoration(
          color: isAi ? const Color(0xFF1B263B) : const Color(0xFF2EC4B6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text, style: TextStyle(color: isAi ? Colors.white : const Color(0xFF0D1B2A), fontSize: 14)),
      ),
    );
  }

  Widget _buildBookCard(String title, String author, double rating, int pages, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFF14213D), borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFFFFB703))),
          const SizedBox(height: 4),
          Text('المؤلف: $author | عدد الصفحات: $pages', style: const TextStyle(fontSize: 12, color: Colors.white60)),
          const SizedBox(height: 8),
          Text(desc, style: const TextStyle(fontSize: 13, color: Colors.white70)),
        ],
      ),
    );
  }
}

class SummarizerScreen extends StatefulWidget {
  const SummarizerScreen({Key? key}) : super(key: key);
  @override
  State<SummarizerScreen> createState() => _SummarizerScreenState();
}

class _SummarizerScreenState extends State<SummarizerScreen> {
  String? uploadedFileName;
  bool isUploading = false;
  bool showOptions = false;
  final TextEditingController _msgController = TextEditingController();
  final List<String> chatLogs = ['قم برفع ملزمتك (PDF أو Word) للبدء في استخلاص النقاط وفهم المادة.'];

  void _simulateUpload() {
    setState(() => isUploading = true);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isUploading = false;
        uploadedFileName = 'ملزمة_هياكل_البيانات.pdf';
        chatLogs.add('تم رفع "$uploadedFileName" بنجاح!');
        showOptions = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('التلخيص الذكي للملازم'), backgroundColor: const Color(0xFF1B263B)),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              color: const Color(0xFF14213D),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: isUploading ? null : _simulateUpload,
                    icon: const Icon(Icons.upload_file_rounded),
                    label: Text(uploadedFileName == null ? 'إضافة ملف ملزمة' : 'تغيير الملف'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      uploadedFileName ?? 'لم يتم اختيار ملف بعد',
                      style: TextStyle(fontSize: 12, color: uploadedFileName != null ? const Color(0xFFFFB703) : Colors.white54),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: chatLogs.length,
                itemBuilder: (ctx, i) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: const Color(0xFF1B263B), borderRadius: BorderRadius.circular(12)),
                  child: Text(chatLogs[i], style: const TextStyle(fontSize: 14, height: 1.4)),
                ),
              ),
            ),
            if (showOptions)
              Container(
                padding: const EdgeInsets.all(14),
                child: Wrap(
                  spacing: 8,
                  children: [
                    ActionChip(
                      label: const Text('تلخيص أهم النقاط'),
                      onPressed: () => setState(() => chatLogs.add('ملخص سريع للملزمة:\n1. المفاهيم الأساسية.\n2. النظريات والتعريفات الهامة.')),
                    ),
                    ActionChip(
                      label: const Text('اختبر ذكائك بالملزمة الآن'),
                      backgroundColor: const Color(0xFFE76F51),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => QuizEngineScreen(preloadedPdf: uploadedFileName)));
                      },
                    ),
                  ],
                ),
              ),
            _buildInputBar(_msgController, 'اكتب سؤالك حول الملزمة...', () {
              if (_msgController.text.isNotEmpty) {
                setState(() {
                  chatLogs.add('أنت: ${_msgController.text}');
                  _msgController.clear();
                });
              }
            }),
          ],
        ),
      ),
    );
  }
}

class LatestUpdatesScreen extends StatelessWidget {
  const LatestUpdatesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('آخر التطورات والأخبار الأكاديمية'), backgroundColor: const Color(0xFF1B263B)),
      body: const Center(child: Text('قسم أحدث المقررات والأخبار العلمية والكتب المستجدة')),
    );
  }
}

class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المناقشة والتوجيه الذكي'), backgroundColor: const Color(0xFF1B263B)),
      body: const Center(child: Text('حوار ذكي لتوجيه الطالب نحو الخدمة المناسبة')),
    );
  }
}

class MathEquationsScreen extends StatelessWidget {
  const MathEquationsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('شرح وحل المعادلات الرياضية'), backgroundColor: const Color(0xFF1B263B)),
      body: const Center(child: Text('حل المعادلات الرياضية خطوة بخطوة بالصور أو الكتابة')),
    );
  }
}

class QuizEngineScreen extends StatefulWidget {
  final String? preloadedPdf;
  const QuizEngineScreen({Key? key, this.preloadedPdf}) : super(key: key);
  @override
  State<QuizEngineScreen> createState() => _QuizEngineScreenState();
}

class _QuizEngineScreenState extends State<QuizEngineScreen> {
  bool qDirect = true;
  bool qMcq = true;
  bool qTrueFalse = true;
  bool qAll = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('اختبر ذكائك'), backgroundColor: const Color(0xFF1B263B)),
        body: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            const Text('أنماط الأسئلة المطلوبة (Checkbox):', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2EC4B6))),
            CheckboxListTile(
              title: const Text('الكل'),
              value: qAll,
              onChanged: (v) => setState(() => qAll = qDirect = qMcq = qTrueFalse = v ?? false),
            ),
            CheckboxListTile(
              title: const Text('أسئلة مباشرة'),
              value: qDirect,
              onChanged: (v) => setState(() => qDirect = v ?? false),
            ),
            CheckboxListTile(
              title: const Text('اختيارات متعددة (MCQ)'),
              value: qMcq,
              onChanged: (v) => setState(() => qMcq = v ?? false),
            ),
            CheckboxListTile(
              title: const Text('صح وخطأ'),
              value: qTrueFalse,
              onChanged: (v) => setState(() => qTrueFalse = v ?? false),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الاقتراحات والآراء'), backgroundColor: const Color(0xFF1B263B)),
      body: const Center(child: Text('آراء الطلاب وتقييماتهم للتطبيق')),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center(child: Text('قائمة المفضلة والمراجع'));
}

class OtherMajorsScreen extends StatelessWidget {
  const OtherMajorsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center(child: Text('تخصصات أكاديمية أخرى'));
}

class ProfileScreen extends StatelessWidget {
  final String userName;
  const ProfileScreen({Key? key, required this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) => Center(child: Text('الملف الشخصي للطالب: $userName'));
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center(child: Text('الإعدادات والخصوصية'));
}

Widget _buildInputBar(TextEditingController controller, String hint, VoidCallback onSend) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: const BoxDecoration(color: Color(0xFF14213D)),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: hint),
            onSubmitted: (_) => onSend(),
          ),
        ),
        IconButton(icon: const Icon(Icons.send, color: Color(0xFFFFB703)), onPressed: onSend),
      ],
    ),
  );
}
