import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:radius/widgets/layout/auth/avatars/row_avatar.dart';

import '../../../../constants/assets.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Transform.translate(
            offset: Offset(8,18),
            child: Container(
              width: MediaQuery.of(context).size.width - 65,
              height: 547.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                      color: Colors.white
                  ),
                  color: Colors.white.withOpacity(.05)
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 50,
                      child: Row(
                        children: [
                          const RowAvatar(),
                          const Spacer(),
                          Transform.translate(
                            offset: Offset(8,0),
                            child: Row(
                              children: [
                                SvgPicture.asset(loveSvg, color: Colors.white),
                                Icon(Icons.more_vert_outlined),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: Offset(-8,0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                'https://picsum.photos/1080',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width - 60,
                height: 500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
