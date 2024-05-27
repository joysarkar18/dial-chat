import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/posts_controller.dart';

class PostsView extends GetView<PostsController> {
  const PostsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.kw),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 116,
                  width: 116,
                  decoration: BoxDecoration(
                      color: context.secondaryBlue,
                      borderRadius: BorderRadius.circular(24)),
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: context.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: context.secondaryBlue,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                ),
                40.kwidthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Posts &\nStories",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 24.ksp,
                          fontWeight: FontWeight.w800),
                    ),
                    14.kheightBox,
                    Text(
                      "Click plus sign to add post",
                      style: AppTextStyles.inter14w500(color: context.black),
                    )
                  ],
                ),
              ],
            ),
            30.kheightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 200.kh,
                  width: 43.w,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CommonImageView(
                          height: 200.kh,
                          width: 43.w,
                          url:
                              "https://media.istockphoto.com/id/1479798765/photo/vertical-group-of-happy-friends-posing-for-a-selfie-on-a-spring-day-as-they-party-together.jpg?s=612x612&w=0&k=20&c=3ch9k6zg71DfVtWzf1Q-TgJXPeQyoflY7fCpiPLmoZs=",
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Jane Williams",
                            style:
                                AppTextStyles.inter14w600(color: context.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: context.secondaryBlue),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://img.freepik.com/free-photo/portrait-blonde-woman-looking-photographer_23-2148348970.jpg?size=626&ext=jpg&ga=GA1.1.44546679.1716768000&semt=ais_user",
                                ),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 200.kh,
                  width: 43.w,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CommonImageView(
                          height: 200.kh,
                          width: 43.w,
                          url:
                              "https://media.istockphoto.com/id/1479798765/photo/vertical-group-of-happy-friends-posing-for-a-selfie-on-a-spring-day-as-they-party-together.jpg?s=612x612&w=0&k=20&c=3ch9k6zg71DfVtWzf1Q-TgJXPeQyoflY7fCpiPLmoZs=",
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Jane Williams",
                            style:
                                AppTextStyles.inter14w600(color: context.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: context.secondaryBlue),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://img.freepik.com/free-photo/portrait-blonde-woman-looking-photographer_23-2148348970.jpg?size=626&ext=jpg&ga=GA1.1.44546679.1716768000&semt=ais_user",
                                ),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            30.kheightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 200.kh,
                  width: 43.w,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CommonImageView(
                          height: 200.kh,
                          width: 43.w,
                          url:
                              "https://media.istockphoto.com/id/1479798765/photo/vertical-group-of-happy-friends-posing-for-a-selfie-on-a-spring-day-as-they-party-together.jpg?s=612x612&w=0&k=20&c=3ch9k6zg71DfVtWzf1Q-TgJXPeQyoflY7fCpiPLmoZs=",
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Jane Williams",
                            style:
                                AppTextStyles.inter14w600(color: context.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: context.secondaryBlue),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://img.freepik.com/free-photo/portrait-blonde-woman-looking-photographer_23-2148348970.jpg?size=626&ext=jpg&ga=GA1.1.44546679.1716768000&semt=ais_user",
                                ),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 200.kh,
                  width: 43.w,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CommonImageView(
                          height: 200.kh,
                          width: 43.w,
                          url:
                              "https://media.istockphoto.com/id/1479798765/photo/vertical-group-of-happy-friends-posing-for-a-selfie-on-a-spring-day-as-they-party-together.jpg?s=612x612&w=0&k=20&c=3ch9k6zg71DfVtWzf1Q-TgJXPeQyoflY7fCpiPLmoZs=",
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Jane Williams",
                            style:
                                AppTextStyles.inter14w600(color: context.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: context.secondaryBlue),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://img.freepik.com/free-photo/portrait-blonde-woman-looking-photographer_23-2148348970.jpg?size=626&ext=jpg&ga=GA1.1.44546679.1716768000&semt=ais_user",
                                ),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            30.kheightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 200.kh,
                  width: 43.w,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CommonImageView(
                          height: 200.kh,
                          width: 43.w,
                          url:
                              "https://media.istockphoto.com/id/1479798765/photo/vertical-group-of-happy-friends-posing-for-a-selfie-on-a-spring-day-as-they-party-together.jpg?s=612x612&w=0&k=20&c=3ch9k6zg71DfVtWzf1Q-TgJXPeQyoflY7fCpiPLmoZs=",
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Jane Williams",
                            style:
                                AppTextStyles.inter14w600(color: context.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: context.secondaryBlue),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://img.freepik.com/free-photo/portrait-blonde-woman-looking-photographer_23-2148348970.jpg?size=626&ext=jpg&ga=GA1.1.44546679.1716768000&semt=ais_user",
                                ),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 200.kh,
                  width: 43.w,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CommonImageView(
                          height: 200.kh,
                          width: 43.w,
                          url:
                              "https://media.istockphoto.com/id/1479798765/photo/vertical-group-of-happy-friends-posing-for-a-selfie-on-a-spring-day-as-they-party-together.jpg?s=612x612&w=0&k=20&c=3ch9k6zg71DfVtWzf1Q-TgJXPeQyoflY7fCpiPLmoZs=",
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Jane Williams",
                            style:
                                AppTextStyles.inter14w600(color: context.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: context.secondaryBlue),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://img.freepik.com/free-photo/portrait-blonde-woman-looking-photographer_23-2148348970.jpg?size=626&ext=jpg&ga=GA1.1.44546679.1716768000&semt=ais_user",
                                ),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            30.kheightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 200.kh,
                  width: 43.w,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CommonImageView(
                          height: 200.kh,
                          width: 43.w,
                          url:
                              "https://media.istockphoto.com/id/1479798765/photo/vertical-group-of-happy-friends-posing-for-a-selfie-on-a-spring-day-as-they-party-together.jpg?s=612x612&w=0&k=20&c=3ch9k6zg71DfVtWzf1Q-TgJXPeQyoflY7fCpiPLmoZs=",
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Jane Williams",
                            style:
                                AppTextStyles.inter14w600(color: context.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: context.secondaryBlue),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://img.freepik.com/free-photo/portrait-blonde-woman-looking-photographer_23-2148348970.jpg?size=626&ext=jpg&ga=GA1.1.44546679.1716768000&semt=ais_user",
                                ),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 200.kh,
                  width: 43.w,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CommonImageView(
                          height: 200.kh,
                          width: 43.w,
                          url:
                              "https://media.istockphoto.com/id/1479798765/photo/vertical-group-of-happy-friends-posing-for-a-selfie-on-a-spring-day-as-they-party-together.jpg?s=612x612&w=0&k=20&c=3ch9k6zg71DfVtWzf1Q-TgJXPeQyoflY7fCpiPLmoZs=",
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Jane Williams",
                            style:
                                AppTextStyles.inter14w600(color: context.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: context.secondaryBlue),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://img.freepik.com/free-photo/portrait-blonde-woman-looking-photographer_23-2148348970.jpg?size=626&ext=jpg&ga=GA1.1.44546679.1716768000&semt=ais_user",
                                ),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
