import 'package:abb_user_app/features/home/widgets/home_banner.dart';
import 'package:abb_user_app/features/home/widgets/special_orders.dart';
import 'package:abb_user_app/features/home/widgets/category_chip.dart';
import 'package:abb_user_app/features/home/widgets/product_widget.dart';
import 'package:abb_user_app/providers/auth_provider.dart';
import 'package:abb_user_app/providers/product_provider.dart';
import 'package:abb_user_app/shared/styles/text_styles.dart';
import 'package:abb_user_app/core/theme/app_colors.dart';
import 'package:abb_user_app/shared/widgets/heading/section_title.dart';
import 'package:abb_user_app/shared/widgets/layout/gap.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../models/cart_model.dart';
import '../../../providers/banner_provider.dart';
import '../../../providers/cart_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ProductProvider>(context, listen: false);
      provider.fetchRecommended();
      provider.fetchAllProducts();

        final bannerProvider = Provider.of<BannerProvider>(context, listen: false);
  bannerProvider.fetchBanners();
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final userName = auth.userData?["name"] ?? "User";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Hi, ",
                  style: TStyles.title.copyWith(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userName,
                  style: TStyles.title.copyWith(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
              ],
            ),
            AppGap.v4,
            Text(
              "Get your favourite biryani",
              style: TStyles.subtitle.copyWith(fontSize: 12.sp),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: AppColors.black.withOpacity(0.6),
            ),
          ),
          AppGap.h8,
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppGap.v14,
        
              // ----------------- BANNER CAROUSEL ---------------------
          Consumer<BannerProvider>(
          builder: (context, bannerProvider, _) {
            if (bannerProvider.banners.isEmpty) {
        return SizedBox(
          height: 150.h,
          child: Center(child: CircularProgressIndicator()),
        );
            }
        
            return CarouselSlider.builder(
        itemCount: bannerProvider.banners.length,
        itemBuilder: (context, index, realIdx) {
          final banner = bannerProvider.banners[index];
          return SingleBanner(
            imageUrl: banner.imageUrl,
            title: banner.title,
            subtitle: banner.subtitle,
          );
        },
        options: CarouselOptions(
          height: 150.h,
          viewportFraction: 0.75,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
        ),
            );
          },
        ),
        
              AppGap.v26,
        
              // ----------------- SPECIAL ORDERS SCROLL ---------------
              SizedBox(
                height: 110.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SpecialOrders(
                      imageUrl: "assets/images/birthday.png",
                      title: "Birthday Parties",
                    ),
                    AppGap.h14,
                    SpecialOrders(
                      imageUrl: "assets/images/wedding.png",
                      title: "Wedding Orders",
                    ),
                    AppGap.h14,
                    SpecialOrders(
                      imageUrl: "assets/images/corporate.png",
                      title: "Corporate Events",
                    ),
                    AppGap.h14,
                    SpecialOrders(
                      imageUrl: "assets/images/bulk.png",
                      title: "Family Pack",
                    ),
                  ],
                ),
              ),
        
              AppGap.v20,
        
              // ----------------- CATEGORY CHIPS --------------------
              SizedBox(
                height: 45.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryChip(
                      icon: Icons.category,
                      label: "All",
                      selected: context.select<ProductProvider, bool>(
                          (p) => p.selectedCategory == "All"),
                      onTap: () =>
                          context.read<ProductProvider>().selectCategory("All"),
                    ),
                    CategoryChip(
                      icon: Icons.category,
                      label: "Chicken",
                      selected: context.select<ProductProvider, bool>(
                          (p) => p.selectedCategory == "Chicken"),
                      onTap: () =>
                          context.read<ProductProvider>().selectCategory("Chicken"),
                    ),
                    CategoryChip(
                      icon: Icons.category,
                      label: "Mutton",
                      selected: context.select<ProductProvider, bool>(
                          (p) => p.selectedCategory == "Mutton"),
                      onTap: () =>
                          context.read<ProductProvider>().selectCategory("Mutton"),
                    ),
                    CategoryChip(
                      icon: Icons.rice_bowl,
                      label: "Biryani",
                      selected: context.select<ProductProvider, bool>(
                          (p) => p.selectedCategory == "Biryani"),
                      onTap: () =>
                          context.read<ProductProvider>().selectCategory("Biryani"),
                    ),
                    CategoryChip(
                      icon: Icons.rice_bowl_rounded,
                      label: "Kushka",
                      selected: context.select<ProductProvider, bool>(
                          (p) => p.selectedCategory == "Kushka"),
                      onTap: () =>
                          context.read<ProductProvider>().selectCategory("Kushka"),
                    ),
                    CategoryChip(
                      icon: Icons.local_dining,
                      label: "Sweets",
                      selected: context.select<ProductProvider, bool>(
                          (p) => p.selectedCategory == "Sweets"),
                      onTap: () =>
                          context.read<ProductProvider>().selectCategory("Sweets"),
                    ),
                    CategoryChip(
                      icon: Icons.local_drink,
                      label: "Drinks",
                      selected: context.select<ProductProvider, bool>(
                          (p) => p.selectedCategory == "Drinks"),
                      onTap: () =>
                          context.read<ProductProvider>().selectCategory("Drinks"),
                    ),
                  ],
                ),
              ),
        
              AppGap.v20,
        
              // ----------------- RECOMMENDED DISHES -----------------
              SectionTitle("Recommended Dishes"),
              Consumer<ProductProvider>(builder: (context, provider, child) {
                if (provider.loadingRecommended) {
                  return const Center(child: CircularProgressIndicator());
                } else if (provider.error != null) {
                  return Text("Error: ${provider.error}");
                } else if (provider.filteredProducts.isEmpty) {
                  return const Center(child: Text("No products found"));
                }
        
                return SizedBox(
                  height: 260.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.recommendedFilteredProducts.length,
                    itemBuilder: (context, index) {
                      final p = provider.recommendedFilteredProducts[index];
                      return Padding(
                         padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5),
                        child: SizedBox(
                          width: 145.w,
                          child: ProductCard(
                            title: p.name,
                            price: p.price,
                            image: p.imageUrl,
                            serves: p.serves,
                            onAdd: () {
                               context.read<CartProvider>().addToCart(
            CartItem(
        id: p.id,
        name: p.name,
        price: p.price,
        image: p.imageUrl,
        serves: p.serves,
            ),
          );
           ScaffoldMessenger.of(context).hideCurrentSnackBar();

             ScaffoldMessenger.of(context).showSnackBar(
              
            SnackBar(content: Text("${p.name} added to cart!"), duration: Duration(seconds: 1),),
          );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
        
              AppGap.v20,
        
              // ----------------- ALL PRODUCTS -------------
              SectionTitle("All Dishes"),
              Consumer<ProductProvider>(builder: (context, provider, child) {
                if (provider.loadingAll) {
                  return const Center(child: CircularProgressIndicator());
                } else if (provider.error != null) {
                  return Text("Error: ${provider.error}");
                } else if (provider.filteredProducts.isEmpty) {
                  return const Center(child: Text("No products found"));
                }
        
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.filteredProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                    final p = provider.filteredProducts[index];
                    return ProductCard(
                      title: p.name,
                      price: p.price,
                      image: p.imageUrl,
                      serves: p.serves,
                      onAdd: () {
                 ScaffoldMessenger.of(context).hideCurrentSnackBar();

             ScaffoldMessenger.of(context).showSnackBar(
              
            SnackBar(content: Text("${p.name} added to cart!"), duration: Duration(seconds: 1),),
          );
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
