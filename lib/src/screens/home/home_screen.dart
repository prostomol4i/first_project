import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/constants/padding_constants.dart';
import '../../common/widgets/cupertino_search_box.dart';
import '../../common/widgets/shopping_centre.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List shops = [
    {
      "image": "esentai mall",
      "name": "Esentai Mall",
      "description":
          'Единственный в Центральной Азии люкcовый молл, который предлагает особую атмосферу для шопинга и развлечений. В Esentai Mall эксклюзивно представлены такие бренды, как Louis Vuitton, Prada, Dior, Moncler, а также трехуровневый магазин Saks Fifth Avenue и ювелирная галерея.',
      "street": 'ул. Аль-Фараби',
    },
    {
      "image": "mega center",
      "name": "Mega Center",
      "description":
          'Первый ТРЦ сети MEGA открыт в Алматы с 2006 года. Вторая очередь MEGA Alma-Ata введена в эксплуатацию в 2013 году. Спустя год распахнул свои двери MEGA Park. Теперь MEGA Alma-Ata и MEGA Park — градообразующие объекты делового, финансового, научно-образовательного, культурного центра страны — Алматы.',
      "street": 'ул. Розыбакиева',
    },
    {
      "image": "dostyk plaza",
      "name": "Dostyk Plaza",
      "description":
          'Светлый просторный дизайн и высокий уровень сервиса дают посетителям все необходимое для приятного шопинга и комфортного отдыха.',
      "street": 'ул. ул. Жолдасбекова и пр. Достык',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // resizeToAvoidBottomInset: false,
      child: SafeArea(
        child: Padding(
          padding: AppPaddings.horizontal,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const CupertinoSearchBox(),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: shops.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 20),
                itemBuilder: (BuildContext context, int index) {
                  return ShoppingCentre(
                    image: shops[index]["image"],
                    name: shops[index]["name"],
                    description: shops[index]["description"],
                    street: shops[index]["street"],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
