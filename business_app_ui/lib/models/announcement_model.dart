class Announcement {
  String announcement;
  String amount;
  String iconPath;

  Announcement({
    required this.announcement,
    required this.amount,
    required this.iconPath,
  });

  static List<Announcement> getAnnouncements() {
    List<Announcement> announcements = [];

    announcements.add(
      Announcement(
        announcement: 'Companies Joined us',
        amount: '300 +',
        iconPath: 'assets/icons/people.svg',
      ),
    );

    announcements.add(
      Announcement(
        announcement: 'Exclusive Budget 55,000',
        amount: '45M',
        iconPath: 'assets/icons/chart.svg',
      ),
    );

    announcements.add(
      Announcement(
        announcement: 'Investing the future of design',
        amount: '200K',
        iconPath: 'assets/icons/design.svg',
      ),
    );

    return announcements;
  }
}
