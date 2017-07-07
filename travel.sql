/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-07-07 15:01:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `tipid` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `user` varchar(255) NOT NULL,
  `contenttime` datetime NOT NULL,
  KEY `tipid` (`tipid`),
  CONSTRAINT `content_ibfk_1` FOREIGN KEY (`tipid`) REFERENCES `tipstop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', '周致达好帅啊', 'zzd', '2017-01-01 07:06:12');
INSERT INTO `content` VALUES ('1', '张涛也好帅啊', '周致达', '2017-06-30 21:18:36');
INSERT INTO `content` VALUES ('1', '郑明峰也好帅啊！！！', '周致达', '2017-06-30 18:36:00');
INSERT INTO `content` VALUES ('1', '喻钰坤也好帅啊！', '周致达', '2017-06-30 09:12:03');
INSERT INTO `content` VALUES ('1', '周龙喜最丑了', 'a', '2017-06-30 11:15:10');
INSERT INTO `content` VALUES ('1', '我周龙喜就是个大傻逼', '郑明峰', '2017-06-30 20:20:09');
INSERT INTO `content` VALUES ('1', '我郑明峰就是个小傻逼', '郑明峰', '2017-06-30 21:02:00');
INSERT INTO `content` VALUES ('1', '大家好，我叫周龙喜，我周龙喜就是个傻逼，每天早晨热爱吃屎', '周龙喜', '2017-06-30 05:00:09');
INSERT INTO `content` VALUES ('1', '我周致达最帅，有人不服吗？', '周龙喜', '2017-06-30 17:10:03');
INSERT INTO `content` VALUES ('1', '我周龙喜是傻逼！！！', 'zt', '2017-07-01 12:00:08');
INSERT INTO `content` VALUES ('1', '我周致达最帅啦', '周致达', '2017-07-01 19:18:59');
INSERT INTO `content` VALUES ('2', '想去！', '周致达', '2017-07-04 21:21:21');
INSERT INTO `content` VALUES ('1', '楼上我儿子', '周致达', '2017-07-05 18:56:30');
INSERT INTO `content` VALUES ('4', '好美啊！', '周致达', '2017-07-06 12:59:00');
INSERT INTO `content` VALUES ('1', '哈哈哈', '周致达', '2017-07-06 12:00:00');
INSERT INTO `content` VALUES ('1', '楼上好帅啊', '周致达', '2017-07-05 14:29:39');
INSERT INTO `content` VALUES ('1', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '周致达', '2017-07-06 12:12:13');
INSERT INTO `content` VALUES ('1', '我是第16楼！', '周致达', '2017-07-06 19:00:05');
INSERT INTO `content` VALUES ('1', '我是17楼', '周致达', '2017-07-06 13:26:09');
INSERT INTO `content` VALUES ('1', '我是18楼', '周致达', '2017-07-06 16:38:31');
INSERT INTO `content` VALUES ('1', '我是19楼\r\n', 'zzd', '2017-07-06 16:45:59');
INSERT INTO `content` VALUES ('1', '周致达是智障', '周致达', '2017-07-07 12:10:09');

-- ----------------------------
-- Table structure for indexmiddle
-- ----------------------------
DROP TABLE IF EXISTS `indexmiddle`;
CREATE TABLE `indexmiddle` (
  `captain` varchar(50) NOT NULL,
  `content1` varchar(300) NOT NULL,
  `content2` varchar(500) NOT NULL,
  `image` varchar(50) NOT NULL,
  `showflag` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indexmiddle
-- ----------------------------
INSERT INTO `indexmiddle` VALUES ('红瓦绿树，碧海蓝天。', '人生要有一次说走就走的旅行和一次奋不顾身的爱情 一直想去青岛看看。', '青岛是中国首批优秀旅游城市，位于山东半岛南端，是中国东部沿海地区重要的交通枢纽和海外游客入出中国的主要口岸。青岛三面环海、气候宜人，加上特殊的历史积淀，使青岛早在20世纪初就成为中国著名的旅游胜地。 旖旎壮美的海滨风景线；起伏跌宕的海上仙山——崂山；“红瓦绿树，碧海蓝天”的城市风景；典型欧陆风格的多国建筑；浓缩近现代历史文化的名人故居；现代化的度假、会展条件，这一切的一切都使青岛这座中西合璧，山、海、城相融相拥的城市，成为中国最优美的海滨风景带。 大海使你的心胸开阔，崂山让你体会清虚与幽静。每年7、8月份时值青岛啤酒节和海洋节，丰富多彩的活动等着你的参与。高挑的青岛小嫚（方言对姑娘的称呼），豪爽的青岛小伙会让你体味北方人的人性魅力。', 'indeximages/qingdao.jpg', '1', '1');
INSERT INTO `indexmiddle` VALUES ('浓情北海，情迷涠洲。', '对于夏天，除了大海和夕阳，还有什么事更珍贵的呢？\r\n银滩、海鲜总是让人意犹未尽。在海边打望、冲浪，没人会介意你光着膀子沿着海滩荡来荡去。', '涠洲岛位于广西北海市正南面21海里的海面上，距北海市区36海里，是中国最年轻的火山岛，也是广西最大的海岛。从高空鸟瞰，涠洲岛象一枚弓型翡翠浮在大海中。这里夏无酷暑，冬无严寒，年平均气温23℃，雨量1863毫米，是广西最多雨的地方之一；活动积温8，265℃，是广西热量最丰富的地方。四周烟波浩淼，岛上植被茂密，风光秀美，尤以奇特的海蚀、海积地貌，火山熔岩及绚丽多姿的活珊瑚为最，素有南海“蓬莱岛”之称。涠洲岛与火山喷发堆积和珊瑚沉积融为一体，使岛南部的高峻险奇与北部的开阔平缓形成鲜明对比，其沿海海水碧蓝见底，海底活珊瑚、名贵海产瑰丽神奇，种类繁多。堪称人间天堂、蓬莱宝岛！', 'indeximages/weizhoudao.jpg', '1', '2');
INSERT INTO `indexmiddle` VALUES ('九江', '美', '美亚美', 'indeximages/qingdao.jpg', '0', '3');

-- ----------------------------
-- Table structure for indexmiddle2
-- ----------------------------
DROP TABLE IF EXISTS `indexmiddle2`;
CREATE TABLE `indexmiddle2` (
  `captain` varchar(20) NOT NULL,
  `content` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `imagecontent` varchar(1000) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` int(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indexmiddle2
-- ----------------------------
INSERT INTO `indexmiddle2` VALUES ('北京', '一生必去一次', 'views/bj.jpg', '北京，中国首都。每个人心中，都有一个“我爱北京天安门”的北京情结，都曾梦想着生活在传说中的紫禁城；也梦想着爬上万里长城，大喊：我是好汉！在每个人心中，都一个人属于自己的北京。北京是一座包容万象、海纳百川的城市。北京文化底蕴深厚，是一个古典与现代结合的城市。旅游资源十分丰富，景色都很宏伟壮观。', '1', '1');
INSERT INTO `indexmiddle2` VALUES ('上海', '中国魔都', 'views/sh.jpg', '被誉为东方明珠的上海在黄浦江两岸正在展翅翱翔。古老的石库门、外滩旁的各国租借地，浦东的现代化摩天大楼，让这里成了建筑展览馆。上海还是美食城，是金融中心，是购物天堂，是浪漫者的情调场所，是旅游者的心仪都市。', '2', '1');
INSERT INTO `indexmiddle2` VALUES ('厦门', '小清新的聚集地', 'views/xm.jpg', '厦门又称“鹭岛”，是白鹭栖息之地。海中之城，城中存海。厦门是一个秀丽清新的城市，空气和阳光都很好。厦门大学的校园整洁优美，鼓浪屿有很多特色店铺，都是可以去看看的。厦门的街道很干净，慢节奏的生活很惬意。海鲜不错，当地小吃很棒。', '3', '1');
INSERT INTO `indexmiddle2` VALUES ('大理', '感受风花雪月', 'views/yndl.jpg', '大理州，全名大理白族自治州，地处云南省中部偏西，东邻楚雄州，南靠普洱。大理州历史悠久，素有“文献名邦”的美称。风花雪月的大理相比丽江更安静，民风更淳朴，适合长住。崇圣寺三塔特别漂亮，苍山洱海也是很好的自然景观。大理有很多白族特色风格的建筑，历史悠久。小吃很好吃，推荐喜洲粑粑。', '4', '1');
INSERT INTO `indexmiddle2` VALUES ('成都', '去成都的街头走一走', 'views/cd.jpg', '“蓉城”成都，自古便有“天府之国”的美誉。“九天开出一成都，万户千门入画图”，在中国偌大的历史版图上，成都是惟一建城以来城址以及名称从未更改的城市。成都是很悠闲的城市，文化底蕴深厚，生活节奏慢，周边有很多好玩的景点。成都的美食实在是让人流连忘返，最最最推荐的就是吃，宽窄巷子很多好吃的，走饿了可以吃吃小吃和正宗的川菜。', '5', '1');
INSERT INTO `indexmiddle2` VALUES ('拉萨', '一个人的朝拜', 'views/ls.jpg', '拉萨，藏语里的意思是神居住的地方。它是西藏自治区首府，海拔3700米，被称为“日光城”。他是藏族人心中的圣城，如今也成为四方游客的“圣城”。“日光之城”拉萨是多少人心灵的家园，在3700多米的海拔上，浓厚的宗教氛围和悠久的历史遗迹让人激动的眩晕。', '6', '1');
INSERT INTO `indexmiddle2` VALUES ('巴黎', '塞纳河畔，埃菲尔塔', 'views/bl.jpg', '巴黎是法国的首都，也是这个国家的心脏。法国的公路里程从巴黎圣母院开始，一块小小的石碑标志着这个国家的中心。法国人有两种，一种是“巴黎人”，另一种是“住在巴黎以外的人”。今天的巴黎人依然走在十九世纪的碎石路上，在这条大道的沿线，点缀着这些名字：协和广场、凯旋门、卢浮宫、巴黎圣母院……在这条大道上走过的是雨果、波德莱尔、居里夫人、毕加索、乔伊斯…… 大多数游客心中向往的，是一个古老而浪漫的巴黎，一个极具历史感的巴黎', '7', '2');
INSERT INTO `indexmiddle2` VALUES ('马尔代夫', '散落在印度洋上的一串珍珠', 'views/medf.jpg', '看过《麦兜故事》的人很难不和麦兜一起爱上这个岛国：“椰林树影，水清沙幼。”马尔代夫的国家旅游局如此评价自己的祖国：“如果你一生中有很多次出国旅游的机会，那你一定要来马尔代夫；如果你一生中只有一次出国旅游的机会，那你更要来马尔代夫。”马尔代夫位于南亚，是印度洋上的一个岛国，由1200余个小珊瑚岛屿组成，其中202个岛屿有人居住，是亚洲最小的国家。那么，在这座伊甸园涅槃之前，你是否也要安排一次美丽的邂逅，在马代，和恋人，把浪漫与快乐永远铭刻在内心深处的某个角落？', '8', '2');
INSERT INTO `indexmiddle2` VALUES ('巴塞罗那', '伊比利亚半岛的明珠', 'views/bsln.jpg', '巴塞罗那位于西班牙东北部的地中海岸，是西班牙第二大城市、最大的工业中心。这里气候宜人、风光旖旎、古迹遍布，素有“伊比利亚半岛的明珠”之称，是西班牙最著名的旅游胜地。它是西班牙的文化古城，有地中海曼哈顿之称。带有哥特风格的古老建筑与高楼大厦交相辉映，共同构成了巴塞罗那令人迷醉的天际线。', '9', '2');
INSERT INTO `indexmiddle2` VALUES ('伦敦', '魅力横生的欧洲风情', 'views/ld.jpg', '伦敦是英国的首都，同时也是欧盟区内最大的城市。融入伦敦自身的迷人文化，使其成为旅游揽胜和感受世界各地文化的绝妙佳处。伦敦的文化变化万千而又丰富多元，绝不乏新景可观、新物可玩。同时，伦敦还保留着其魅力横生的历史风情。英国的风景名胜大都云集伦敦，238处风景名胜可免费参观，以如此少的花费，游览如此多的景点，世界上唯有伦敦一处。', '10', '2');
INSERT INTO `indexmiddle2` VALUES ('圣托里尼', '最美的日落，最壮阔的海景', 'views/stln.jpg', '圣托里尼是爱琴海最璀璨的一颗明珠，柏拉图笔下的自由之地，这里有世界上最美的日落，最壮阔的海景，这里蓝白相知的色彩天地是艺术家的聚集地，是摄影家的天堂，在这里，你可以作诗人，也可以作画家，彩绘出你心目中圣托里尼最蓝的天空。', '11', '2');
INSERT INTO `indexmiddle2` VALUES ('巴厘岛', '度假天堂', 'views/bld.jpg', '巴厘岛是印度尼西亚岛屿，位于小巽他群岛西端，大致呈菱形，主轴为东西走向。巴厘岛因历史上受印度文化宗教的影响，居民大都信奉印度教，是印尼唯一信仰印度教的地方。海非常美丽，很有名的一个地方。超美的金色海滩，透明清澈的海水。游人如织啊，晚上非常的热闹。', '12', '2');

-- ----------------------------
-- Table structure for indexmiddle3
-- ----------------------------
DROP TABLE IF EXISTS `indexmiddle3`;
CREATE TABLE `indexmiddle3` (
  `city` varchar(15) NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indexmiddle3
-- ----------------------------
INSERT INTO `indexmiddle3` VALUES ('上海', '70');
INSERT INTO `indexmiddle3` VALUES ('东京', '52');
INSERT INTO `indexmiddle3` VALUES ('南昌', '30');
INSERT INTO `indexmiddle3` VALUES ('厦门', '90');
INSERT INTO `indexmiddle3` VALUES ('大理', '50');
INSERT INTO `indexmiddle3` VALUES ('成都', '60');

-- ----------------------------
-- Table structure for indextop
-- ----------------------------
DROP TABLE IF EXISTS `indextop`;
CREATE TABLE `indextop` (
  `captain` varchar(20) NOT NULL,
  `content` varchar(50) NOT NULL,
  `linkname` varchar(15) NOT NULL,
  `href` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indextop
-- ----------------------------
INSERT INTO `indextop` VALUES ('Travels', '致力于热爱旅行并乐于分享的你', '加入Travels', 'login.jsp', '1');
INSERT INTO `indextop` VALUES ('毕业去哪', '阳光、沙滩？还是草地？Travels给你最全攻略', 'More', 'tips.jsp', '2');
INSERT INTO `indextop` VALUES ('最新活动', '在Travels发表你的攻略，就有机会免费获得马尔代夫七日游！', '活动已结束', '#', '3');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('zt', '131@qq.com', '123');
INSERT INTO `manager` VALUES ('周致达', '1311234375@qq.com', ',.,.,,..');

-- ----------------------------
-- Table structure for tipstop
-- ----------------------------
DROP TABLE IF EXISTS `tipstop`;
CREATE TABLE `tipstop` (
  `image` varchar(50) NOT NULL,
  `captain` varchar(50) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` date DEFAULT NULL,
  `showflag` int(11) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipstop
-- ----------------------------
INSERT INTO `tipstop` VALUES ('tipsimages/xgll.jpg', '从丽江到香格里拉', '旅行的意义大概就是离开熟悉的地方，带着不安又充满好奇心向新的世界迈出第一步，这不是我的第一步，也不会是最后一步。并不是第一次去云南，27下午到达丽江，时隔多年后，丽江还是那个样子，古镇还是那个古镇，只是越发的商业，下午接待的朋友开车带着去了拉市海。这个在出发前一天我才知道的地方，到达的时候真的被美到了，所有的不安都变成平静。云南的天空太纯净，云南的冬天也太美丽，与其去抱怨那些不是在最美的季节出发，不如去享受去发现它的独特美好。云南的冬天，就是金色和蓝色组成的吧。', '周致达', '1168', '1', '2017-06-14', '1', '丽江');
INSERT INTO `tipstop` VALUES ('tipsimages/dl.jpg', '跟着你 到天边', '五月，是个让人怀念与憧憬的季节。\r\n五月的天，我随着学校的实习，踏上了我许久想念的云南。\r\n初见大理，一切都如照片中那样美好。\r\n碧蓝的天，碧蓝的洱海，以及那触手可及的云层。\r\n我翻阅千山万水，走到了洱海边，仿佛走到了天边。\r\n跟着你走到天边，挽着手，直到永远。\r\n沿着岁月留下的路，相会在如烟的昨天 大理。大理古城，安静祥和的坐落在这里\r\n她的美，像是春天的风轻轻拂过脸庞\r\n白天熙熙攘攘的人群穿梭在古老的街道\r\n夜晚拥挤的少男少女迷离在大理城下昏黄的夜色中\r\n街道口弹琴唱歌的艺人，以及身旁卖艺作画的小姑娘。', '周致达', '7', '2', '2017-06-14', '1', '大理');
INSERT INTO `tipstop` VALUES ('tipsimages/nbs.jpg', '牛背山——梦开始的地方', '攀登牛背山的梦做了很久。一直以来没有合适的人，合适的时间去欣赏它的美。今年清明节后跟我最好的朋友一起徒步攀登 虽然路途艰辛，但当登顶的那一刻就觉得一切都就值了。站在山上彷佛进入了另一个结界“腾云驾雾，手可摘星”一点也不夸张。生活给予我们美好，我们也应适时回敬生活。', '周致达', '3', '3', '2017-06-14', '1', '牛背山');
INSERT INTO `tipstop` VALUES ('tipsimages/tt.jpg', '元阳哈尼梯田，上帝的五线谱', '时间定格在2012年12月31日。清晨我还在沐浴洱海的晨光，本来可以在双廊享受阳光，配合双廊的氛围，让脚步不那么赶。怎奈此行云南的终极目的是元阳，是哈尼梯田，唯有日行千里，狂奔至元阳老县城新街镇。一路上听托马斯说到元阳糟糕的天气，让我心里顿时宽慰下来，至少我没有错失美景。\r\n昆明朋友的车子送我到达新街镇时，已是晚上八点多，大雾弥漫着新街镇中心广场。托马斯早早的在酒店门口等我了，立马让我有了找到组织的感觉。和朋友道别后，去六军饭店炒了几个菜，胡乱填饱肚子。因为托马斯事先已经发挥十八搭的特长，给我找了个车子，司机是个黑牡丹，所以在元阳的出行我已无忧，便回房洗洗睡去。', 'zmf', '39', '4', '2017-06-14', '1', '元阳');
INSERT INTO `tipstop` VALUES ('tipsimages/yd.jpg', '稻城亚丁——遇见最美的秋天', '没有人知道我在想什么？甚至连我自己都不知道那时我在想什么？只知道亚丁的美让我无法抗拒，于是毅然决然的出发了···\r\n我始终坚信，每个人的心中都曾经坐落过一个地方。它或许在每个人的理想中，由于人之间的不同，那么它们也必将是不一样的，但那个地方里，必然会有自由和年轻人向往的浪漫。雅家埂两河口地带的红石滩是世界上规模较大的红石滩之一，石头上生长的呈铁锈红的物质是一种极稀有的藻类(地衣的复合体)，在湿度、温度、气候适宜的情况下，这种植物就会在岩石的表面自然生长，大概四五年后就会死亡，然后再生。', 'zmf', '0', '5', '2017-06-14', '1', '亚丁');
INSERT INTO `tipstop` VALUES ('tipsimages/xj.jpg', '七月新疆行', '很庆幸爸妈都是热爱旅游的，将我熏陶成了说着玩儿，什么皆可抛的一个娃儿。可是这样的人生才是充满色彩的，充满着新奇，死守学习死守工作，不放任自己去看看世界的人生对我来说一定就是荒废的。从小就被带着去了很多地方，虽然目前为止仍没有出过国，但是祖国的大疆土也够人观赏很久的了。\r\n高中毕业之后就再也没有写过文章，什么大学论文都是百度一下你就知道的，害怕自己写出来会亵渎了这次完美旅程，但是又觉得没有分享的旅程总是少了点什么，所以在时隔半年之后终于下笔了，可能是一篇标准的流水账，希望大家不要介意。\r\n2012年年初自驾游去了西双版纳之后我们一家对自驾游的热情就高涨起来，原定暑假去新疆，一直找不到同行的人，差一点就准备一辆车就出发，结果在网上认识了一对夫妇，这次旅行下来非常庆幸和他们一起旅游结实成为朋友，都是很善良的人。', 'zt', '3', '6', '2017-06-14', '1', '新疆');
INSERT INTO `tipstop` VALUES ('tipsimages/xbly.jpg', '那场拥入怀里的西伯利亚寒风', '人的眼睛，\r\n有5.76亿像素，\r\n理论上可以看清世上所有的事物，\r\n可是我们却时常看不清彼此的心思。\r\n也许心是无法用眼睛来洞察的，\r\n就如同灵魂只能依偎着灵魂，\r\n思想只能拥抱着思想，\r\n所以心只能透过心才能揣摩。\r\n我的相机，\r\n有1200万像素，\r\n理论上能记录上很多景色，\r\n可它无法代替与挚爱共享那一刻的幸福。\r\n那些旅行攻略上的陌生名字，\r\n也许你我无法一一驱身前往，\r\n但不管身处何方，\r\n旅行的最终要义，\r\n就是了解自己要回归的地方，和思念的人。', 'zt', '0', '7', '2017-06-14', '1', '西伯利亚');
INSERT INTO `tipstop` VALUES ('tipsimages/djd.jpg', '后会无期之东极岛', '赶在岳父的《后会无期》上映前踏上了东极岛\r\n准确地说叫东极诸岛，包括：庙子湖、青浜岛、 东福山，黄兴岛\r\n位于浙江舟山的东部海域\r\n先坐车到沈家门码头，坐船至东极岛的庙子湖，再转船至东福山，总共大概需要大半天时间\r\n东福山是新世纪第一缕曙光出现的地方\r\n但这并不重要\r\n重要的是它确实很漂亮\r\n一望无际的水面，若隐若现的岛屿\r\n带你一起感受，感受太平洋的风\r\n一行4人\r\n出发地：杭州\r\n目的地：东极岛（东福山）\r\n3天2夜\r\n人均：914元', 'zt', '2', '8', '2017-06-14', '1', '东极岛');
INSERT INTO `tipstop` VALUES ('tipsimages/ylxs.jpg', '离天空最近的那刻', '踏上玉龙雪山的那一刻是我离天空最近的时候.坐着缆车里,慢慢的向天空靠近.那些飘渺云雾围绕在自己的周边.那是一种很奇妙的感觉.随着海拔越来越高,一座座平时在我们眼里的高山,变得越来越矮小.而视野却愈发的开阔.当登顶到最高点的时候,天地之间的一切都显得那么的渺茫.心境豁然开朗,无论多纠结的事情.在那一刻都显得那么的微不足道.', '周致达', '6', '9', '2017-06-14', '1', '玉龙雪山');
INSERT INTO `tipstop` VALUES ('tipsimages/sqs.jpg', '云里雾里三清山', '每次出杭州去外地爬山运气都还算不错，这次去三清山运气更是好到爆棚。第一天的天气很差，大雾且又有雨，当时以为第二天是看不到什么景色了，结果到晚上9点的时候，发现天空繁星闪烁，甚至能隐隐看到银河的模样。我掐指一算，知道明天肯定能看到我们想看到的景色。于是第二天3点半就起床了，经常1个多小时的摸黑爬山，到达了三清山的最高峰：玉京峰。此时已经能看到浩瀚的云海流动在我们的脚下，当时的心情无法用言语来替代，只能重复的说：太美了，太美了，像是仙境一样。随着太阳的升起，站在顶峰看云海显得更加的漂亮。如果还有机会，我还是会再去一趟三清山的。', 'zzd', '1', '10', '2017-06-14', '1', '三清山');
INSERT INTO `tipstop` VALUES ('tipsimages/gg.jpg', '我去故宫晃了一圈', '出游北京并没有计划很久，也是一时兴起。想着北京有着自己的小伙伴，似乎那个城市就变得生动起来，而不显得这么的陌生。', 'zzd', '0', '11', '2017-06-14', '1', '北京');
INSERT INTO `tipstop` VALUES ('tipsimages/gn.jpg', '在那遥远的地方', '陪某人散心，从西安出发自驾到甘南，来回四天1860公里，时间紧就到夏河没在往南走。一路天气甚好，意外地避开了黄金周熙熙攘攘的人群，到那个离天很近的地方撒撒野。之前也走遍了全部藏区，总的来说甘南是一个收获大于预期的地方，即便是淡季秋天也有别致的景色。值得一提的是甘南的美食在藏区里算很好了，可能因为靠近中土又有回羌注血吧', 'zzd', '1', '12', '2017-06-13', '1', '甘南');
INSERT INTO `tipstop` VALUES ('tipsimages/qhh.jpg', '青海湖', '对于很多没有去过青海湖的人来说，青海湖在很远的地方，我曾经也是这样以为的，忙于学业，准备工作，梦想却在一步步远去，不过当我踏上旅途的那一刻，路就在脚下了，我圆了自己的一个梦想：在青海湖畔骑自行车，从零三年开始到现在，青海湖应该是我最接近海的地方了，这不是结束，而是一个开始，我想很多人都会慢慢的变成背包客，或沙发客的，虽然沙发客在中国还很少，希望喜欢旅行的朋友，加入我。其实，青海湖没有想象的那么远，也不用花费太多的钱，如果你有五天的假期，1000左右的流动资金，就可以圆自己一个梦了。\r\n摄影/煮咖啡的猫', 'zzd', '0', '13', '2017-06-14', '0', '青海');
INSERT INTO `tipstop` VALUES ('tipsimages/qhh.jpg', '七月江理', '美如画', '张涛', '0', '14', '2017-06-12', '0', '江理');
INSERT INTO `tipstop` VALUES ('tipsimages/65.jpg', '猜猜我是谁', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '匿名', '0', '43', '2017-07-04', '0', '南昌');
INSERT INTO `tipstop` VALUES ('tipsimages/ls87.jpg', '湄洲岛', '啦啦啦啦啦', '周致达', '0', '47', '2017-07-07', '0', '湄洲岛');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `userpassword` varchar(20) NOT NULL,
  `useremail` varchar(20) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registtime` date DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('aa', 'aa', '123456@qq.com', '1', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('5', '5', '123456@qq.com', '2', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('6', '6', '123456@qq.com', '3', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('66', '6', '123456@qq.com', '4', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('a', 'a', '123456@qq.com', '5', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('aa', 'a', '123456@qq.com', '6', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('aaa', 'aaa', '123456@qq.com', '7', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('aaaa', 'a', '123456@qq.com', '8', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('aaaaaaaaaa', 'a', '123456@qq.com', '9', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('ab', 'ab', '123456@qq.com', '10', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('abc', 'abc', '123456@qq.com', '11', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('d', 'd', '123456@qq.com', '12', '2017-06-28', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('dd', 'dd', '123456@qq.com', '13', '2017-06-28', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('dddddd', 'dddddd', '123456@qq.com', '14', '2017-06-28', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('ddddddd', 'd', '123456@qq.com', '15', '2017-06-28', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('ddddddddd', 'd', '123456@qq.com', '16', '2017-06-28', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('f', 'f', '123456@qq.com', '17', '2017-06-25', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('g', 'g', '123456@qq.com', '18', '2017-06-25', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('rfghregnm ', '123', '123456@qq.com', '19', '2017-06-25', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('v', 'v', '123456@qq.com', '20', '2017-06-25', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('zmf', '111', '123456@qq.com', '21', '2017-06-25', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('zt', 'zt', '123456@qq.com', '22', '2017-06-25', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('zzd', '123', '123456@qq.com', '23', '2017-06-25', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('周致达', ',.,.,,..', '123456@qq.com', '24', '2017-06-15', 'userphoto/154.jpg');
INSERT INTO `user` VALUES ('周龙喜', '980107', '123456@qq.com', '25', '2017-07-01', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('喻钰坤', '123456', '123456@qq.com', '26', '2017-07-01', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('张涛', '123456', '123456@qq.com', '27', '2017-07-01', 'userphoto/2.jpg');
INSERT INTO `user` VALUES ('郑明峰', 'root', '123456@qq.com', '28', '2017-07-01', 'userphoto/4.jpg');
INSERT INTO `user` VALUES ('zhouzhida', '123', '123456@qq.com', '29', '2017-07-05', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('庄嘉双', '123', '250@250.com', '30', '2017-07-06', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('张三', '123', '131@qq.com', '31', '2017-07-06', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('韩志文', '123', '1311234375@qq.com', '32', '2017-07-06', 'userphoto/1.jpg');
INSERT INTO `user` VALUES ('李四', '123', '1311234375@qq.com', '33', '2017-07-06', 'userphoto/1.jpg');

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit` (
  `visitcount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visit
-- ----------------------------
INSERT INTO `visit` VALUES ('268');
