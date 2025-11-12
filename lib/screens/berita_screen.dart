import 'package:flutter/material.dart';

class NewsItem {
  final String title;
  final String description;
  final String date;
  final String category;
  final String imageUrl;

  NewsItem({
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    required this.imageUrl,
  });
}

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({super.key});

  @override
  State<BeritaScreen> createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'Semua';

  static final List<String> _categories = [
    'Semua',
    'Teknologi',
    'Ekonomi',
    'Iklim',
    'Hiburan',
    'Olahraga',
  ];

  static final List<NewsItem> _newsItems = [
    NewsItem(
      title: 'BERITA TERKINI: PERISTIWA PENTING TERJADI',
      description:
          'Ringkasan singkat dan menarik dari berita utama untuk menarik pembaca mempelajari lebih lanjut tentang perkembangan penting ini.',
      date: '4 Nov 2025',
      category: 'Breaking',
      imageUrl: 'assets/news1.jpg',
    ),
    NewsItem(
      title: 'Dunia Teknologi: Peluncuran Gadget Baru',
      description: 'Berita teknologi terbaru tentang peluncuran gadget baru.',
      date: '26 Okt 2023',
      category: 'Teknologi',
      imageUrl: 'assets/news2.jpg',
    ),
    NewsItem(
      title: 'Pasar Global Mengalami Pergeseran Tak Terduga',
      description: 'Analisis pasar saham dan pembaruan ekonomi.',
      date: '26 Okt 2023',
      category: 'Ekonomi',
      imageUrl: 'assets/news3.jpg',
    ),
    NewsItem(
      title: 'KTT Iklim Mencapai Kesepakatan Penting',
      description: 'Berita lingkungan dari KTT iklim terbaru.',
      date: '25 Okt 2023',
      category: 'Iklim',
      imageUrl: 'assets/news4.jpg',
    ),
    NewsItem(
      title: 'Hiburan: Film Blockbuster Tayang di Bioskop',
      description: 'Rilis film baru dan berita hiburan.',
      date: '24 Okt 2023',
      category: 'Hiburan',
      imageUrl: 'assets/news5.jpg',
    ),
  ];

  List<NewsItem> get _filteredNews {
    List<NewsItem> filtered = _newsItems;

    if (_selectedCategory != 'Semua') {
      filtered = filtered
          .where((news) => news.category == _selectedCategory)
          .toList();
    }

    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((news) {
        return news.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            news.description.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FFF0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF5936B4), Color(0xFF362A84)],
                  ),
                  border: Border.all(color: const Color(0xFF222222), width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF000000),
                      offset: Offset(4, 4),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.campaign, color: Colors.white, size: 32),
                    const SizedBox(width: 12),
                    const Text(
                      'BERITA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Search Bar
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF222222), width: 4),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF000000),
                      offset: Offset(4, 4),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search for news...',
                    hintStyle: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Category Chips
              Container(
                height: 50,
                padding: const EdgeInsets.only(bottom: 6),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    final isSelected = category == _selectedCategory;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategory = category;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF5936B4)
                                : Colors.white,
                            border: Border.all(
                              color: const Color(0xFF222222),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFF000000),
                                offset: Offset(2, 2),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              category,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // News List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 90),
                  itemCount: _filteredNews.length,
                  itemBuilder: (context, index) {
                    final news = _filteredNews[index];

                    // First item is featured
                    if (index == 0) {
                      return _buildFeaturedCard(news);
                    }

                    // Other items are list items
                    return _buildNewsListItem(news);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedCard(NewsItem news) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF222222), width: 4),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(4, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF5936B4), Color(0xFF362A84)],
              ),
              border: Border.all(color: const Color(0xFF222222), width: 2),
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF000000),
                  offset: Offset(4, 4),
                  blurRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.image,
                size: 80,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Title
          Text(
            news.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          // Description
          Text(
            news.description,
            style: const TextStyle(
              color: Color(0xFF666666),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),
          // Button
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                _showNewsDetail(news);
              },
              child: Container(
                width: 128,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF007BFF),
                  border: Border.all(color: const Color(0xFF222222), width: 2),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF000000),
                      offset: Offset(4, 4),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Read More',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsListItem(NewsItem news) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFACD),
        border: Border.all(color: const Color(0xFF222222), width: 4),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(4, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          _showNewsDetail(news);
        },
        child: Row(
          children: [
            // Thumbnail
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF5936B4), Color(0xFF362A84)],
                ),
                border: Border.all(color: const Color(0xFF222222), width: 2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 32,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    news.date,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showNewsDetail(NewsItem news) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: Color(0xFF222222), width: 4),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF000000),
                offset: Offset(6, 6),
                blurRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                news.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF5936B4), Color(0xFF362A84)],
                  ),
                  border: Border.all(color: const Color(0xFF222222), width: 2),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Icon(
                    Icons.image,
                    size: 80,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                news.description,
                style: const TextStyle(fontSize: 16, color: Color(0xFF666666)),
              ),
              const SizedBox(height: 8),
              Text(
                news.date,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF5936B4), Color(0xFF362A84)],
                    ),
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
                  child: const Center(
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
