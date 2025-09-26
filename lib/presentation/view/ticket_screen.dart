import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(),
              const SizedBox(height: 20),

              // Search Bar
              _buildSearchBar(),
              const SizedBox(height: 30),

              // Filter Chips
              _buildFilterChips(),
              const SizedBox(height: 20),

              // Tickets List
              Expanded(child: _buildTicketsList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'My Tickets',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF196EEE).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.notifications_outlined,
            color: Color(0xFF196EEE),
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffA8CCF0).withAlpha(50),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black38),
          hintText: 'Search tickets...',
          hintStyle: TextStyle(
            color: Colors.black38,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Upcoming', 'Past', 'Cancelled'];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF196EEE) : Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              filters[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTicketsList() {
    final tickets = _getSampleTickets();

    return ListView.separated(
      itemCount: tickets.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final ticket = tickets[index];
        return _buildTicketCard(ticket);
      },
    );
  }

  Widget _buildTicketCard(Map<String, dynamic> ticket) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with status and price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _getStatusColor(ticket['status']).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  ticket['status'],
                  style: TextStyle(
                    color: _getStatusColor(ticket['status']),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                ticket['price'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF196EEE),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Flight/Route Info
          Row(
            children: [
              Expanded(
                child: _buildLocationInfo(
                  ticket['from'],
                  ticket['fromCode'],
                  ticket['departureTime'],
                  Icons.flight_takeoff,
                ),
              ),
              const SizedBox(width: 16),
              _buildFlightIcon(),
              const SizedBox(width: 16),
              Expanded(
                child: _buildLocationInfo(
                  ticket['to'],
                  ticket['toCode'],
                  ticket['arrivalTime'],
                  Icons.flight_land,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Divider
          Container(height: 1, color: Colors.grey[200]),

          const SizedBox(height: 16),

          // Flight Details
          Row(
            children: [
              _buildDetailItem('Flight', ticket['flightNumber']),
              const SizedBox(width: 20),
              _buildDetailItem('Class', ticket['class']),
              const SizedBox(width: 20),
              _buildDetailItem('Seat', ticket['seat']),
            ],
          ),

          const SizedBox(height: 16),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  'View Details',
                  const Color(0xFF196EEE),
                  () {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionButton('Download', Colors.grey[600]!, () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationInfo(
    String city,
    String code,
    String time,
    IconData icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: const Color(0xFF196EEE)),
            const SizedBox(width: 8),
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          city,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Text(code, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }

  Widget _buildFlightIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF196EEE).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.flight, color: Color(0xFF196EEE), size: 20),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  List<Map<String, dynamic>> _getSampleTickets() {
    return [
      {
        'status': 'Confirmed',
        'price': '\$299',
        'from': 'New York',
        'fromCode': 'NYC',
        'to': 'Aspen',
        'toCode': 'ASE',
        'departureTime': '08:30',
        'arrivalTime': '11:45',
        'flightNumber': 'AA1234',
        'class': 'Economy',
        'seat': '12A',
      },
      {
        'status': 'Pending',
        'price': '\$450',
        'from': 'Los Angeles',
        'fromCode': 'LAX',
        'to': 'Aspen',
        'toCode': 'ASE',
        'departureTime': '14:20',
        'arrivalTime': '17:35',
        'flightNumber': 'UA5678',
        'class': 'Business',
        'seat': '3B',
      },
      {
        'status': 'Confirmed',
        'price': '\$199',
        'from': 'Chicago',
        'fromCode': 'ORD',
        'to': 'Denver',
        'toCode': 'DEN',
        'departureTime': '10:15',
        'arrivalTime': '12:30',
        'flightNumber': 'DL9012',
        'class': 'Economy',
        'seat': '8C',
      },
    ];
  }
}
