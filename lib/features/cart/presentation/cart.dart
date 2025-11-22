import 'package:abb_user_app/shared/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../../../providers/cart_provider.dart';
import 'package:geolocator/geolocator.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text("Your Cart", style: TStyles.title),
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      body: cartProvider.items.isEmpty
          ? Center(
              child: Text(
                "Your cart is empty",
                style: TStyles.subtitle.copyWith(fontSize: 14.sp),
              ),
            )
          : SafeArea(
              bottom: true,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      itemCount: cartProvider.items.length,
                      itemBuilder: (context, index) {
                        final item = cartProvider.items[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(12.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.network(
                                    item.image,
                                    width: 80.w,
                                    height: 80.h,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        width: 80.w,
                                        height: 80.h,
                                        color: Colors.grey.shade200,
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                          strokeWidth: 2,
                                        ),
                                      );
                                    },
                                    errorBuilder:
                                        (context, error, stackTrace) {
                                      return Container(
                                        width: 80.w,
                                        height: 80.h,
                                        color: Colors.grey.shade300,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.broken_image,
                                          size: 30.w,
                                          color: Colors.grey.shade600,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: TStyles.normalTitle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 6.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () =>
                                                    cartProvider.decreaseQty(
                                                        item),
                                                child: Container(
                                                  padding: EdgeInsets.all(4.w),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 16.w,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8.w),
                                              Text(
                                                "${item.quantity}",
                                                style: TStyles.subtitle
                                                    .copyWith(fontSize: 13.sp),
                                              ),
                                              SizedBox(width: 8.w),
                                              GestureDetector(
                                                onTap: () =>
                                                    cartProvider.increaseQty(
                                                        item),
                                                child: Container(
                                                  padding: EdgeInsets.all(4.w),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 16.w,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "₹${item.price * item.quantity}",
                                            style: TStyles.normalTitle.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.accent,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      cartProvider.removeItem(item),
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, -3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal", style: TStyles.subtitle),
                            Text("₹${cartProvider.subtotal}",
                                style: TStyles.subtitle),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery", style: TStyles.subtitle),
                            Text("₹${cartProvider.deliveryFee}",
                                style: TStyles.subtitle),
                          ],
                        ),
                        Divider(height: 18.h, thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total", style: TStyles.normalTitle),
                            Text(
                              "₹${cartProvider.total}",
                              style: TStyles.normalTitle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.accent,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: double.infinity,
                          child: 
                          ReusableButton(title: "Checkout",
                          
                         onTap: () async {
                          print("Checking distance before checkout...");
  // 1. Get user location
  final position = await Geolocator.getCurrentPosition();

  // 2. Shop lat/long (from Firebase)
  double shopLat = 13.0575998;
  double shopLong = 80.2739333;

  // 3. Calculate distance
  double distance = cartProvider.calculateDistance(
    position.latitude,
    position.longitude,
    shopLat,
    shopLong,
  );

  // 4. Check condition
  if (distance <= 5) {
    cartProvider.checkout();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "You are ${distance.toStringAsFixed(1)} KM away from the shop. Order allowed only within 5 KM.",
        ),
      ),
    );
  }
},
                          )


                    
                        ),
                      ],
                
                
                    ),
                  ),
                ],
              ),
              
            ),
    );
  }
}
