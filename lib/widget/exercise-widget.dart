import 'package:advanced_mobile_final_project/model/exercise-model.dart';
import 'package:advanced_mobile_final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class ExerciseWidget extends StatelessWidget {
  ExerciseModel model;

  ExerciseWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: RaisedButton(
        color: Colors.grey.shade100,
        onPressed: () {

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.current.exercise + ": " + this.model.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                )
            ),
            Text(S.current.number_question + ": " + this.model.numberOfQuestion,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true
            ),
          ],
        ),
      ),
    );
  }
}
