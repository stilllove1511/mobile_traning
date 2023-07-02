import 'package:flutter/material.dart';
import 'package:mobile_traning/constants/color.dart';

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
        Container(
          decoration: BoxDecoration(
            //backgound color white
            color: AppColors().secondaryBackgroundColor,
            //shape circle
            shape: BoxShape.circle,
          ),
          margin: EdgeInsets.only(right: 16),
          child: IconButton(
            //color blue
            color: Colors.blue,
            icon: Icon(Icons.chevron_left),
            onPressed: (currentPage > 1)
                ? () => onPageSelected(currentPage - 1)
                : () => null,
          ),
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
        Container(
          decoration: BoxDecoration(
            color: AppColors().secondaryBackgroundColor,
            shape: BoxShape.circle,
          ),
          margin: EdgeInsets.only(left: 16),
          child: IconButton(
            color: Colors.blue,
            icon: Icon(Icons.chevron_right),
            onPressed: (currentPage < totalPages)
                ? () => onPageSelected(currentPage + 1)
                : () => null,
          ),
        ),
      ],
    );
  }

  Widget _buildPageButton(int page) {
    return Container(
      decoration: BoxDecoration(
        color: (page == currentPage) ? Colors.blue : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Text(
          page.toString(),
          style: TextStyle(
            color: (AppColors().textPrimaryColor),
          ),
        ),
        onPressed: () => onPageSelected(page),
      ),
    );
  }

  Widget _buildDots() {
    return IconButton(
      color: AppColors().textPrimaryColor,
      icon: Icon(Icons.more_horiz),
      onPressed: () => null,
    );
  }
}
