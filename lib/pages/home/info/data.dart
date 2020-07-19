// 资讯数据准备,注意下面的格式

class InfoItem {
  final String title;
  final String imageUrl;
  final String source;
  final String time;
  final String navigateUrl;
  const InfoItem(
      {this.title, this.imageUrl, this.source, this.time, this.navigateUrl});
}

const List<InfoItem> infoData = [
  const InfoItem(
      title: '置业选择 | 三室一厅 河间的古雅别院',
      imageUrl:
          'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l4obbj305v04fjsw.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: 'login'),
  const InfoItem(
      title: '置业佳选 | 大理王宫 苍山洱海间的古雅别院',
      imageUrl:
          'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l6hnsj305v04fab7.jpg',
      source: "新华网",
      time: "一周前",
      navigateUrl: 'login'),
  const InfoItem(
      title: '置业选择 | 安居小屋 花园洋房 清新别野',
      imageUrl:
          'https://wx4.sinaimg.cn/mw1024/005SQLxwly1g6f89l5jlyj305v04f75q.jpg',
      source: "新华网",
      time: "一周前",
      navigateUrl: 'login'),
  const InfoItem(
      title: '置业选择 | 安居小屋 花园洋房 清新别野 山清水秀',
      imageUrl:
          'https://wx4.sinaimg.cn/mw1024/005SQLxwly1g6f89l5jlyj305v04f75q.jpg',
      source: "新华网",
      time: "一周前",
      navigateUrl: 'login'),
  const InfoItem(
      title: '置业选择 | 安居小屋 花园洋房 清新别野',
      imageUrl:
          'https://wx4.sinaimg.cn/mw1024/005SQLxwly1g6f89l5jlyj305v04f75q.jpg',
      source: "新华网",
      time: "一周前",
      navigateUrl: 'login'),
];
