import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/models/user_model.dart';
import 'package:dial_chat/app/modules/selectContact/controllers/select_contact_controller.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateGroupChat extends StatefulWidget {
  const CreateGroupChat({super.key});

  @override
  _CreateGroupChatState createState() => _CreateGroupChatState();
}

class _CreateGroupChatState extends State<CreateGroupChat> {
  final TextEditingController _groupNameController = TextEditingController();
  final SelectContactController _selectContactController = Get.find();

  // List to store selected users
  List<UserModel> _selectedUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create New Group',
          style: AppTextStyles.inter15w500(color: context.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await _selectContactController.pickGroupLogo();
                setState(() {}); // Refresh the UI after picking an image
              },
              child: Obx(() {
                return CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      _selectContactController.groupLogoUrl.value.isNotEmpty
                          ? NetworkImage(
                              _selectContactController.groupLogoUrl.value)
                          : null,
                  child: _selectContactController.groupLogoUrl.value.isEmpty
                      ? const Icon(Icons.camera_alt, size: 40)
                      : null,
                );
              }),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _groupNameController,
              decoration: const InputDecoration(
                labelText: 'Group Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Select Users',
              style: AppTextStyles.inter15w500(color: context.black),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: _selectContactController.availableUsers.length,
                  itemBuilder: (context, index) {
                    final userContact =
                        _selectContactController.availableUsers[index];
                    final isSelected =
                        _selectedUsers.contains(userContact.userModel);

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              _selectedUsers.remove(userContact.userModel);
                            } else {
                              _selectedUsers.add(userContact.userModel);
                            }
                          });
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CommonImageView(
                                height: 40,
                                width: 40,
                                url: userContact.userModel.imageUrl,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userContact.contact.givenName ??
                                      userContact.userModel.name,
                                  style: AppTextStyles.inter15w500(
                                      color: context.black),
                                ),
                                Text(
                                  'Tap to select',
                                  style: AppTextStyles.inter12w400(
                                      color: context.grey),
                                ),
                              ],
                            ),
                            const Spacer(),
                            if (isSelected)
                              const Icon(Icons.check_circle,
                                  color: Colors.green),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createGroupChat,
              child: const Text('Create Group'),
            ),
          ],
        ),
      ),
    );
  }

  void _createGroupChat() async {
    if (_groupNameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a group name');
      return;
    }

    if (_selectedUsers.isEmpty) {
      Get.snackbar('Error', 'Please select at least one user');
      return;
    }

    final groupName = _groupNameController.text.trim();
    final adminId = FirebaseAuth.instance.currentUser!.uid;

    final chatId = await _selectContactController.createChatGroup(
      groupName: groupName,
      users: _selectedUsers,
      adminId: adminId,
    );

    Get.toNamed(Routes.GROUP_CHAT, arguments: [
      {
        "name": groupName,
        "chatID": chatId,
        "isGroup": true,
        "groupImage": Get.find<SelectContactController>().groupLogoUrl.value
      }
    ]);
  }
}
