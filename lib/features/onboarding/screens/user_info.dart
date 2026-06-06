import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carbon_tracker/core/config/app_constants.dart';
import 'package:carbon_tracker/features/onboarding/data/onboarding_options.dart' as options;
import 'package:carbon_tracker/features/onboarding/data/privacy_policy_info.dart' as privacy;
import 'package:carbon_tracker/features/onboarding/data/tracking_modes_info.dart' as tracking;
import 'package:carbon_tracker/features/onboarding/widgets/modal.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  // Transport selections
  final Set<String> _selectedTransport = {};

  // Only refresh tracking is available for now, but this allows for easy expansion in the future
  String _selectedTracking = 'Refresh Tracking';

  // Privacy policy agreement
  bool _readPrivacyPolicy = false;

  // Weight controller
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _thoughtsController = TextEditingController();

  @override
  void dispose() {
    _weightController.dispose();
    _thoughtsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 20),
                      _buildTransportSection(),
                      const SizedBox(height: 32),
                      _buildTrackingSection(),
                      const SizedBox(height: 32),
                      _buildWeightSection(),
                      const SizedBox(height: 32),
                      _buildSustainabilitySection(),
                      const SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          if (!_readPrivacyPolicy) {
                            setState(() {
                              _readPrivacyPolicy = true;
                            });
                          }
                          showInfoModal(
                            context,
                            privacy.privacyPolicyInfo["title"] ??
                                "Privacy Policy",
                            privacy.privacyPolicyInfo["description"] ?? "",
                          );
                        },
                        child: Text(
                          "Read our Privacy Policy",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.focusedColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildContinueButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Header section with title and subtitle

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About You',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Personalizing your experience for a healthier\nyou and a greener planet.',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.subtitleText,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // Transport preferences section

  Widget _buildTransportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transport Preferences',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Select all that apply to your weekly routine.',
          style: TextStyle(fontSize: 13, color: AppColors.subtitleText),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: options.transportOptions.map((option) {
            final isSelected = _selectedTransport.contains(option['label']);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedTransport.remove(option['label']);
                  } else {
                    _selectedTransport.add(option['label'] as String);
                  }
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.selectedOptionColor
                      : AppColors.optionBackgroundColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.focusedColor
                        : AppColors.unselectedBorderColor,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      option['icon'] as IconData,
                      size: 17,
                      color: isSelected
                          ? AppColors.focusedColor
                          : AppColors.textDark,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      option['label'] as String,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isSelected
                            ? AppColors.focusedColor
                            : AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Tracking mode selection section

  Widget _buildTrackingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tracking Modes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            GestureDetector(
              onTap: () {
                showInfoModal(
                  context,
                  tracking.trackingModesInfo["title"] ?? "Tracking modes",
                  tracking.trackingModesInfo["description"] ?? "",
                );
              },
              child: Text(
                'What do these mean?',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.focusedColor,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Column(
          children: options.trackingOptions.map((option) {
            final isSelected = _selectedTracking == option['label'];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTracking = option['label'] as String;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 22,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.selectedOptionColor
                      : AppColors.optionBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.focusedColor
                        : AppColors.unselectedBorderColor,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      option['icon'] as IconData,
                      size: 22,
                      color: isSelected
                          ? AppColors.focusedColor
                          : AppColors.textDark,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      option['label'] as String,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: isSelected
                            ? AppColors.focusedColor
                            : AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Weight input section

  Widget _buildWeightSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weight (kg)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.optionBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextStyle(fontSize: 15, color: AppColors.textDark),
            decoration: InputDecoration(
              hintText: 'e.g. 75',
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
              suffixText: 'kg',
              suffixStyle: TextStyle(color: Color(0xFF6B6B6B), fontSize: 15),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            'Used only for carbon footprint calculation',
            style: TextStyle(fontSize: 12, color: AppColors.subtitleText),
          ),
        ),
      ],
    );
  }

  // Sustainability thoughts section

  Widget _buildSustainabilitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sustainability Thoughts',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 130,
          decoration: BoxDecoration(
            color: AppColors.optionBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _thoughtsController,
            maxLines: null,
            style: TextStyle(fontSize: 15, color: AppColors.textDark),
            decoration: InputDecoration(
              hintText: 'What does sustainability mean to you?',
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: _readPrivacyPolicy ? () {} : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.focusedColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: const Text(
          'Continue',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
