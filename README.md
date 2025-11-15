# abb_user_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Folder Structure 

lib/
│
├── core/                      // Shared utilities, theme, constants
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_theme.dart
│   │
│   ├── constants/
│   │   └── app_images.dart
│   │
│   └── routes/
│       └── app_routes.dart
│
├── shared/                    // Shared widgets & styles
│   ├── widgets/
│   │   ├── buttons/
│   │   │   ├── primary_button.dart
│   │   │   └── outline_button.dart
│   │   ├── inputs/
│   │   │   ├── custom_text_field.dart
│   │   │   └── search_field.dart
│   │   ├── cards/
│   │   │   ├── product_card.dart
│   │   │   └── category_card.dart
│   │   ├── layout/
│   │   │   ├── app_padding.dart
│   │   │   ├── gap.dart
│   │   │   └── section_title.dart
│   │   └── common/
│   │       ├── loading_widget.dart
│   │       ├── empty_state.dart
│   │       └── error_widget.dart
│   │
│   └── styles/
│       └── text_styles.dart
│
├── features/                  // All screens grouped by feature
│   ├── auth/
│   │   ├── presentation/
│   │   │   ├── login_screen.dart
│   │   │   └── register_screen.dart
│   │   └── widgets/
│   │       └── auth_header.dart
│   │
│   ├── home/
│   │   ├── presentation/
│   │   │   └── home_screen.dart
│   │   └── widgets/
│   │       ├── home_banner.dart
│   │       ├── categories_list.dart
│   │       └── biryani_list.dart
│   │
│   ├── product/
│   │   ├── presentation/
│   │   │   └── product_details_screen.dart
│   │   └── widgets/
│   │       ├── image_slider.dart
│   │       └── add_to_cart_section.dart
│   │
│   ├── cart/
│   │   ├── presentation/
│   │   │   └── cart_screen.dart
│   │   └── widgets/
│   │       └── cart_item_tile.dart
│   │
│   ├── checkout/
│   │   └── presentation/
│   │       └── checkout_screen.dart
│   │
│   ├── orders/
│   │   ├── presentation/
│   │   │   ├── order_tracking_screen.dart
│   │   │   └── order_success_screen.dart
│   │   └── widgets/
│   │       └── order_status_tile.dart
│   │
│   ├── profile/
│   │   └── presentation/
│   │       └── profile_screen.dart
│   │
│   └── address/
│       └── presentation/
│           └── address_screen.dart
│
├── models/                     // Data models
│   ├── user_model.dart
│   ├── product_model.dart
│   ├── order_model.dart
│   └── delivery_boy_model.dart
│
├── providers/                  // State management
│   ├── auth_provider.dart
│   ├── cart_provider.dart
│   ├── product_provider.dart
│   └── order_provider.dart
│
├── services/                   // Firebase / API services
│   ├── firebase_auth_service.dart
│   ├── firestore_service.dart
│   ├── storage_service.dart
│   ├── order_service.dart
│   └── menu_service.dart
│
└── main.dart
