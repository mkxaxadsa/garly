import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:project4/features/splash/splash_page.dart';
import '../../../core/config/app_colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(height: 32),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.settingsGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settinger(
                        data:
                            'https://docs.google.com/document/d/1WyKHFy6rTbfMHbTKtLbFR9RukLMiJBu366ySJ3K5e2M/edit?usp=sharing'),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.zero,
                child: Row(
                  children: const [
                    SizedBox(width: 12),
                    Icon(
                      Icons.newspaper_outlined,
                      color: Colors.white,
                    ),
                    Spacer(),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 36),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.settingsGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settinger(
                        data:
                            'https://docs.google.com/document/d/1xbtJZVoDDDVOsWzExnc9Q2TotrVwrLkqpX6BlfMETQs/edit?usp=sharing'),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.zero,
                child: Row(
                  children: const [
                    SizedBox(width: 12),
                    Icon(
                      CupertinoIcons.book,
                      color: Colors.white,
                    ),
                    Spacer(),
                    Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 36),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.settingsGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settinger(
                        data: 'https://forms.gle/eGDEYgDVb79ixxor8'),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.zero,
                child: Row(
                  children: const [
                    SizedBox(width: 12),
                    Icon(
                      Icons.support_agent_outlined,
                      color: Colors.white,
                    ),
                    Spacer(),
                    Text(
                      'Write Support',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 36),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.settingsGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                InAppReview.instance.openStoreListing(appStoreId: '6505102258');
              },
              child: Container(
                padding: EdgeInsets.zero,
                child: Row(
                  children: const [
                    SizedBox(width: 12),
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.white,
                    ),
                    Spacer(),
                    Text(
                      'Rate app',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 36),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfilePhoto extends StatelessWidget {
  const _ProfilePhoto();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.settingsGrey,
        borderRadius: BorderRadius.circular(75),
      ),
    );
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: CupertinoButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Edit profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(width: 8),
            Image.asset('assets/icons/edit.png', height: 20),
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.title,
    this.asset = '',
    this.image = '',
    required this.onTap,
  });
  final VoidCallback onTap;
  final String title;
  final String asset;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.settingsGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              const SizedBox(width: 12),
              image.isNotEmpty
                  ? Image.asset('assets/icons/$image', height: 24)
                  : SvgPicture.asset('assets/icons/$asset.svg'),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              const Spacer(),
              const SizedBox(width: 36),
            ],
          ),
        ),
      ),
    );
  }
}
