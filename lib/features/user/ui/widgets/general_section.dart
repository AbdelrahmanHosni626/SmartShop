import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/features/user/ui/widgets/custom_list_tiles.dart';
import 'package:smartshop/generated/assets.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'General',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        CustomListTiles(
          imageUrl: Assets.bagOrderSvg,
          title: 'All Orders',
          onTap: () {
            context.pushNamed(Routes.allOrders);
          },
        ),
        CustomListTiles(
          imageUrl: Assets.bagWishlistSvg,
          title: 'Wishlist',
          onTap: () {
            context.pushNamed(Routes.wishlist);
          },
        ),
        CustomListTiles(
          imageUrl: Assets.profileRecent,
          title: 'Viewed recently',
          onTap: () {
            context.pushNamed(Routes.viewedRecently);
          },
        ),
        CustomListTiles(
          imageUrl: Assets.profileAddress,
          title: 'Address',
          onTap: () {},
        ),
      ],
    );
  }
}
