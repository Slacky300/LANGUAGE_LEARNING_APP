import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lla/core/theme/app_pallete.dart';
import 'package:lla/models/lessons_model.dart';
import 'package:lla/providers/lesson_provider.dart';
import 'package:provider/provider.dart';

class LessonScreen extends StatefulWidget {
  final String courseId;
  final String? courseImage;

  LessonScreen({Key? key, required Map<dynamic, String> map})
      : courseId = map['courseId']!,
        courseImage = map['courseImage'],
        super(key: key);

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late LessonProvider _lessonProvider;

  @override
  void initState() {
    super.initState();
    _lessonProvider = Provider.of<LessonProvider>(context, listen: false);
    _loadLessons();
  }

  void _loadLessons() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _lessonProvider.getLessonsFromService(widget.courseId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Spanish Course',
          style: TextStyle(
            color:
                AppPallete.textColor, // Set text color to AppPallete.textColor
            fontSize: 20, // Increase text size
            fontWeight: FontWeight.bold, // Make text bold
          ),
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: Body(),
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LessonProvider>(
      builder: (context, lessonProvider, _) {
        final lessonList = lessonProvider.lessons;
        return Column(
          children: [
          
          const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Spanish Lessons',

                  style: TextStyle(
                    color: AppPallete.textColor,
                    fontSize: 20.0, // Set text color to AppPallete.textColor
                    fontWeight: FontWeight.bold, // Make text bold
                  )
                ),
                
              ),

              const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: lessonList.length,
                itemBuilder: (context, index) {
                  return LessonTile(
                    lesson: lessonList[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
      decoration:  BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppPallete.primaryColor, AppPallete.gradient4],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
        ),
        borderRadius: BorderRadius.circular(7)
      ),
      child: ElevatedButton(
        onPressed:  () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.transparentColor,
          fixedSize: const Size(395, 55),
          shadowColor: AppPallete.transparentColor
        ),
        child:  const Text(
           'Enroll Now',
           style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppPallete.whiteColor
           ),
        ),
      ),
    )
            ),
          ],
        );
      },
    );
  }
}

class LessonTile extends StatelessWidget {
  final Lessons lesson;

  const LessonTile({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://www.mezzoguild.com/static/f23bf13500bfd416e9b9ab7e58464f7a/25b16/spanish-n.jpg'),
            ),
          ),
        ),
      ),
      title: Text(
        lesson.name,
        style: const TextStyle(
          color: AppPallete.textColor,
          fontSize: 20.0, // Set text color to AppPallete.textColor
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.end, // Align icons to the right
            children: [
              // Add your level indicator icon here based on the lesson.level
              if (lesson.level == 'beginner')
                const Icon(Icons.star_border, color: Colors.black),
              if (lesson.level == 'intermediate')
                const Icon(Icons.star_half, color: Colors.black),
              if (lesson.level == 'advanced')
                const Icon(Icons.star, color: Colors.black),
            ],
          ),
          Text(
            lesson.description,
            style: const TextStyle(
              color: AppPallete.textColor,
              fontSize: 16.0, // Set text color to AppPallete.textColor
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
