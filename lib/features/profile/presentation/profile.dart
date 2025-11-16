import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';
import '../widgets/profile_option_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    final user = auth.user;
    final userData = auth.userData;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "User Profile",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      body: auth.loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                children: [

                  // USER CARD ----------------------------
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 32.r,
                          backgroundColor: Colors.grey.shade300,
                          child: Icon(Icons.person, size: 36.sp),
                        ),
                        SizedBox(width: 14.w),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userData?["name"] ?? "Unknown User",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              user?.email ?? "",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // OPTIONS -----------------------------
                  ProfileOptionTile(
                    icon: Icons.shopping_bag_outlined,
                    title: "My Orders (${userData?['totalOrders'] ?? 0})",
                    onTap: () {},
                  ),

                  ProfileOptionTile(
                    icon: Icons.location_on_outlined,
                    title: userData?["address"] != null
                        ? "Address: ${userData?['address']}"
                        : "Add Address",
                    onTap: () {},
                  ),

                  ProfileOptionTile(
                    icon: Icons.phone_outlined,
                    title: userData?["phone"] ?? "Add Phone Number",
                    onTap: () {},
                  ),

                  
                  ProfileOptionTile(
                    icon: Icons.notification_add_outlined,
                    title: "Notifications",
                    onTap: () {},
                  ),

                  ProfileOptionTile(
                    icon: Icons.logout,
                    title: "Logout",
                    onTap: () {
                      auth.logout();
                    },
                  ),

                ],
              ),
            ),
    );
  }
}
