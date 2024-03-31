import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lla/core/theme/app_pallete.dart';
import 'package:lla/features/dashboard/pages/lessons_screen.dart';
import 'package:lla/features/dashboard/widgets/circle_button.dart';
import 'package:lla/features/dashboard/widgets/search_field.dart';
import 'package:lla/models/language_model.dart';
import 'package:lla/providers/language_provider.dart';
import 'package:lla/providers/user_provider.dart';
import 'package:provider/provider.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [AppBar(), Body()],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<LanguageProvider>(context, listen: false)
          .getLanguagesFromService();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        final languageList = languageProvider.languages;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Explore Languages",
                    style: TextStyle(
                      color: AppPallete.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppPallete.primaryColor),
                    ),
                  )
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 24,
              ),
              itemBuilder: (context, index) {
                return LanguageCard(
                  language: languageList[index],
                );
              },
              itemCount: languageList.length,
            ),
          ],
        );
      },
    );
  }
}

class LanguageCard extends StatelessWidget {
  final Language language;

  const LanguageCard({
    Key? key,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LessonScreen(
            map: {'courseId': language.course, 'courseImage': language.image},
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                language.image,
                height: 100.0, // Set the height of the image container
                width: double.infinity, // Set the width of the imagecontainer
                fit: BoxFit.cover, // Adjusts the size of the image
              ),
            ),
            const SizedBox(height: 10),
            Text(
              language.name,
              style: const TextStyle(
                color: AppPallete.textColor, // Set text color to black
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              language.description,
              style: const TextStyle(
                color: AppPallete.textColor, // Set text color to black
                fontSize: 14, // Adjust the font size
              ),
              maxLines: 2, // Limit the number of lines
              overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 240,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [AppPallete.primaryColor, AppPallete.gradient4],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello 👋,\n${user.username} ",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchTextField()
        ],
      ),
    );
  }
}
