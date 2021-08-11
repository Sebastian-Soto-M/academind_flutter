import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoContentFound extends StatelessWidget {
  final String objName;
  const NoContentFound(this.objName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'We Couldn\'t Find Any $objName',
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: Theme.of(context).primaryColorLight),
            textAlign: TextAlign.center,
          ),
          SvgPicture.asset(
            'assets/icons/empty-white-box.svg',
            color: Theme.of(context).primaryColorLight,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
    );
  }
}
