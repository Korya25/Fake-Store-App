
import 'package:fake_store_app/core/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'My profile',
          style: AppTextStyle.text.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.grey,
                    child: ClipOval(
                      child: Image.network(
                        'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Matilda Brown',
                          style: AppTextStyle.text.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'matildabrown@mail.com',
                          style: AppTextStyle.descriptiveItems.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Menu Items
            _buildMenuItem(
              icon: Icons.card_giftcard,
              title: 'My orders',
              subtitle: 'Already have 12 orders',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.local_shipping,
              title: 'Shipping addresses',
              subtitle: '3 addresses',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.payment,
              title: 'Payment methods',
              subtitle: 'Visa **34',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.card_giftcard,
              title: 'Promocodes',
              subtitle: 'You have special promocodes',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.star_border,
              title: 'My reviews',
              subtitle: 'Reviews for 4 items',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.settings,
              title: 'Settings',
              subtitle: 'Notifications, password',
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(selectedIndex: 4),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.dark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.white,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.descriptiveItems.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTextStyle.descriptionText.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
