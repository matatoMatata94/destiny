import 'package:destiny/story_brain.dart';
import 'package:flutter/material.dart';

const double storyTextsize = 25;
const double buttonTextsize = 20;
const double heightBetweenButtons = 20;
const MaterialColor bottomButtonColor = Colors.blue;
const MaterialColor topButtonColor = Colors.red;

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background.png'),
        )),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: const TextStyle(
                      fontSize: storyTextsize,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(choiceNumber: 1);
                    });
                  },
                  color: topButtonColor,
                  child: Text(
                    storyBrain.getChoice1(),
                    style: const TextStyle(
                      fontSize: buttonTextsize,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: heightBetweenButtons,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(choiceNumber: 2);
                      });
                    },
                    color: bottomButtonColor,
                    child: Text(
                      storyBrain.getChoice2(),
                      style: const TextStyle(
                        fontSize: buttonTextsize,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
