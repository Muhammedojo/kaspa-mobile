// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CropCalendarPage extends StatefulWidget {
  const CropCalendarPage({super.key});

  @override
  _CropCalendarPageState createState() => _CropCalendarPageState();
}

class _CropCalendarPageState extends State<CropCalendarPage> {
  ScrollController _scrollController = ScrollController();
  bool _showFixedTabs = false;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 200 && !_showFixedTabs) {
      setState(() {
        _showFixedTabs = true;
      });
    } else if (_scrollController.offset <= 200 && _showFixedTabs) {
      setState(() {
        _showFixedTabs = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // App Bar
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                floating: false,
                pinned: false,
                title: Text(
                  'Crop Calendar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.calendar_today_outlined, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
              
              // Calendar Section
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Month Navigation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.chevron_left),
                            onPressed: () {},
                          ),
                          Text(
                            'May 2025',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.chevron_right),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      
                      // Calendar Days
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildCalendarDay('Thu', '22', false),
                          _buildCalendarDay('Fri', '23', true),
                          _buildCalendarDay('Sat', '24', false),
                          _buildCalendarDay('Sun', '25', false),
                          _buildCalendarDay('Mon', '26', false),
                          _buildCalendarDay('Tue', '27', false),
                        ],
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              
              // Section Title
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    'Crops currently in season',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              
              // Tab Bar (when not fixed)
              if (!_showFixedTabs)
                SliverToBoxAdapter(
                  child: _buildTabBar(),
                ),
              
              // Crops List
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildCropItem('Maize', 'Suwan-1', 'Planting Stage', Colors.orange),
                  _buildCropItem('Potato', 'Irish Cobbler', 'Growing Stage', Colors.green),
                  _buildCropItem('Rice', 'NERICA 8', 'Harvesting Stage', Colors.orange),
                  _buildCropItem('Tomato', 'Moneymaker', 'Planting Stage', Colors.orange),
                  _buildCropItem('Onion', 'Red Creole', 'Harvesting Stage', Colors.orange),
                  _buildCropItem('Maize', 'Oba Super 2', 'Growing Stage', Colors.green),
                  _buildCropItem('Potato', 'Russet Burbank', 'Planting Stage', Colors.orange),
                  _buildCropItem('Rice', 'FARO 44 (SIPI)', 'Growing Stage', Colors.green),
               
                _buildCropItem('Onion', 'Red Creole', 'Harvesting Stage', Colors.orange),
                  _buildCropItem('Maize', 'Oba Super 2', 'Growing Stage', Colors.green),
                  _buildCropItem('Potato', 'Russet Burbank', 'Planting Stage', Colors.orange),
                  _buildCropItem('Rice', 'FARO 44 (SIPI)', 'Growing Stage', Colors.green),
               
               
                ]),
              ),
            ],
          ),
          
          // Fixed Tab Bar
          if (_showFixedTabs)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: SafeArea(
                  child: Column(
                    children: [
                      // Header with back button and user avatar
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(Icons.chevron_left, size: 24),
                            ),
                            SizedBox(width: 16),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.green,
                              child: Text(
                                'K',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'ps currently in season',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildTabBar(),
                    ],
                  ),
                ),
              ),
            ),
       
        ],
      ),
    );
  }

  Widget _buildCalendarDay(String day, String date, bool isSelected) {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTab('All', 0),
            SizedBox(width: 12),
            _buildTab('Planting Stage', 1),
            SizedBox(width: 12),
            _buildTab('Growing Stage', 2),
            SizedBox(width: 12),
            _buildTab('Harvesting Stage', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green[600] : Colors.grey[100],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildCropItem(String name, String variety, String stage, Color stageColor) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Crop Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _getCropColor(name),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              _getCropIcon(name),
              color: Colors.white,
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          
          // Crop Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  variety,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          
          // Stage Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: stageColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: stageColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              stage,
              style: TextStyle(
                color: stageColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getCropColor(String cropName) {
    switch (cropName.toLowerCase()) {
      case 'maize':
        return Colors.amber[700]!;
      case 'potato':
        return Colors.brown[400]!;
      case 'rice':
        return Colors.yellow[700]!;
      case 'tomato':
        return Colors.red[600]!;
      case 'onion':
        return Colors.purple[700]!;
      default:
        return Colors.green[600]!;
    }
  }

  IconData _getCropIcon(String cropName) {
    switch (cropName.toLowerCase()) {
      case 'maize':
        return Icons.grass;
      case 'potato':
        return Icons.circle;
      case 'rice':
        return Icons.grain;
      case 'tomato':
        return Icons.circle;
      case 'onion':
        return Icons.circle;
      default:
        return Icons.eco;
    }
  }

}