import 'package:flutter/material.dart';

class PaginationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageSelected;

  PaginationBar({
    required this.currentPage,
    required this.totalPages,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: (currentPage > 1) ? () => onPageSelected(currentPage - 1) : null,
        ),
        if (currentPage > 3) ...[
          _buildPageButton(1),
          if (currentPage > 4) _buildDots(),
        ],
        if (currentPage > 2) _buildPageButton(currentPage - 2),
        if (currentPage > 1) _buildPageButton(currentPage - 1),
        _buildPageButton(currentPage),
        if (currentPage < totalPages) _buildPageButton(currentPage + 1),
        if (currentPage < totalPages - 1) _buildPageButton(currentPage + 2),
        if (currentPage < totalPages - 2) ...[
          if (currentPage < totalPages - 3) _buildDots(),
          _buildPageButton(totalPages),
        ],
        IconButton(
          icon: Icon(Icons.chevron_right),
          onPressed: (currentPage < totalPages) ? () => onPageSelected(currentPage + 1) : null,
        ),
      ],
    );
  }

  Widget _buildPageButton(int page) {
    return IconButton(
      icon: Text(
        page.toString(),
        style: TextStyle(
          color: (page == currentPage) ? Colors.blue : Colors.black,
        ),
      ),
      onPressed: () => onPageSelected(page),
    );
  }

  Widget _buildDots() {
    return IconButton(
      icon: Icon(Icons.more_horiz),
      onPressed: null,
    );
  }
}
