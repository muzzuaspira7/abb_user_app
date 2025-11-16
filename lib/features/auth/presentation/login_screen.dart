import 'package:abb_user_app/core/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../shared/styles/text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../../../shared/widgets/inputs/custom_text_field.dart';
import '../../../providers/auth_provider.dart';
import '../../main/main_navigation.dart';
import 'register_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF6),
      body: 
      SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                 mainAxisSize: MainAxisSize.min,
                  children: [
                                            Image.asset(AppImages.logo, height: 50.h),
                                            SizedBox(height: 10.h),

                    Text(
                      'Welcome Back!',
                      style: TStyles.title.copyWith(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 30.sp),
                    ),
                      Text(
                      'Ambur Bandaari Biryani',
                      style: TStyles.smallText.copyWith(color: AppColors.white,),
                    ),
                    SizedBox(height: 20.h),
                
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.h),
                
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(height: 24.h),
                
                  ReusableButton(
                  title: authProvider.loading ? 'Logging in...' : 'Login',
                  onTap: () {
                    () async {
                      try {
                        await authProvider.login(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                        if (authProvider.user != null) {
                        Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (_) => const MainNavigation()),
);
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    }(); 
                  },
                ),
                
                    SizedBox(height: 16.h),
                    GestureDetector(
                      onTap: () {
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TStyles.smallText.copyWith(color: AppColors.primary),
                      ),
                    ),
                    SizedBox(height: 12.h),
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TStyles.smallText.copyWith(color: AppColors.background),
                          
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TStyles.smallText.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
 
 
 
  }
}
