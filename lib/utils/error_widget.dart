import 'package:flutter/material.dart';

import 'app_colors.dart';

class OopsWidget extends StatelessWidget {
  final Function onRetry;

  OopsWidget({Key key, this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.only(top: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Whoops!",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Some Error happened\ncheck your connection and Try Again",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 150,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
                onPressed: () => {onRetry()},
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.replay,
                        size: 12,
                        color: AppColors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Retry",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            .copyWith(color: AppColors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
