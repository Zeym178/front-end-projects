class ActivityModel {
  String title;
  int exercises;
  String duration;
  String explanation;
  List<String> tags;

  ActivityModel({
    required this.title,
    required this.exercises,
    required this.duration,
    required this.explanation,
    required this.tags,
  });

  static List<ActivityModel> getActivities() {
    List<ActivityModel> activities = [];

    activities.add(
      ActivityModel(
        title: 'Squats',
        exercises: 10,
        duration: '12 minutes',
        explanation:
            'Stand with feet shoulder-width apart, bend your knees and lower your hips as if sitting in a chair. Keep your chest up and knees behind your toes. Stand back up to the starting position.',
        tags: ['Legs', 'Glutes', 'Quads', 'Hamstrings', 'Core'],
      ),
    );
    activities.add(
      ActivityModel(
        title: 'Planks',
        exercises: 12,
        duration: '10 minutes',
        explanation:
            'Lie face down, then lift your body off the ground, balancing on your toes and forearms. Keep your body in a straight line from head to heels, engaging your core and holding the position.',
        tags: ['Core', 'Shoulders', 'Back', 'Abs', 'Arms'],
      ),
    );
    activities.add(
      ActivityModel(
        title: 'Push-ups',
        exercises: 30,
        duration: '30 minutes',
        explanation:
            'explanationPlace your hands slightly wider than shoulder-width apart on the floor. Lower your body until your chest nearly touches the ground, then push back up to the starting position while keeping your body straight.',
        tags: ['Chest', 'Shoulders', 'Triceps', 'Core', 'Arms'],
      ),
    );
    activities.add(
      ActivityModel(
        title: 'Lunges',
        exercises: 11,
        duration: '11 minutes',
        explanation:
            'Step one foot forward and bend both knees to lower your hips. Keep your back straight and the front knee over the ankle. Push off the front foot to return to the starting position and repeat with the other leg.',
        tags: ['Legs', 'Glutes', 'Quads', 'Hamstrings', 'Core'],
      ),
    );
    activities.add(
      ActivityModel(
        title: 'Burpees',
        exercises: 20,
        duration: '20 minutes',
        explanation:
            'Start in a standing position, squat down, and place your hands on the ground. Jump your feet back to a plank position, do a push-up, then jump your feet forward. Finally, jump up and reach for the sky.',
        tags: ['Full Body', 'Legs', 'Shoulders', 'Core', 'Cardio'],
      ),
    );
    return activities;
  }
}
