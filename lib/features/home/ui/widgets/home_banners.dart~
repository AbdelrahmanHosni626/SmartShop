import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_app/generated/assets.dart';

class HomeBanners extends StatelessWidget {
  final List<String> banners = [
    Assets.bannersBanner1,
    Assets.bannersBanner2,
  ];

  HomeBanners({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3.h,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        child: Swiper(
          autoplay: true,
          loop: true,
          duration: 1000,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              banners[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: banners.length,
          pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              activeColor: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
