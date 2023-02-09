import 'package:flutter/material.dart';
import 'package:funk_me/model/funk_audio.dart';
import 'package:funk_me/view/funk_pad_view_model.dart';
import 'package:provider/provider.dart';

typedef FunkButtonClicked = Function(FunkAudio audio);

class FunkPad extends StatefulWidget {
  FunkPad({super.key});

  @override
  State<FunkPad> createState() => _FunkPadState();
}

class _FunkPadState extends State<FunkPad> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<FunkPadViewModel>(context, listen: false).prepare();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<FunkPadViewModel>(context);
    List<FunkAudio> audioList = viewModel.funkAudios;

    return GridView.count(
      padding: const EdgeInsets.all(5.0),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 3,
      scrollDirection: Axis.horizontal,
      children: List.generate(audioList.length, (index) {
        return FunkButton(
            audio: audioList[index],
            onTap: (audio) {
              print("Index = $index");
              viewModel.updateAudio(index);
            });
      }),
    );
  }
}

class FunkButton extends StatefulWidget {
  final FunkAudio audio;
  FunkButtonClicked onTap;

  FunkButton({required this.audio, required this.onTap, super.key});

  @override
  State<FunkButton> createState() => _FunkButtonState();
}

class _FunkButtonState extends State<FunkButton> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    upperBound: 0.7,
    lowerBound: 0.0,
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  controllerListener() {
    setState(() {});
  }

  @override
  void didUpdateWidget(FunkButton button) {
    updateController();
    super.didUpdateWidget(button);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateController() {
    if (widget.audio.isPlaying) {
      _controller.addListener(controllerListener);
      _controller.repeat(reverse: true);
    } else {
      _controller.removeListener(controllerListener);
      _controller.stop();
      _controller.value = 0.0;
    }
  }

  void _onButtonTapped() {
    widget.onTap(widget.audio);
    updateController();
  }

  AssetImage _getIcon() {
    switch (widget.audio.type) {
      case FunkType.repeat:
        return const AssetImage('assets/ic_repeat.png');
      case FunkType.voice:
        return const AssetImage('assets/ic_voice.png');
      case FunkType.sound:
        return const AssetImage('assets/ic_sound.png');
    }
  }

  Color _getColor() {
    switch (widget.audio.type) {
      case FunkType.repeat:
        return const Color(0xFFF7CB45);
      case FunkType.voice:
        return const Color(0xFFF0922B);
      case FunkType.sound:
        return const Color(0xFFEC5C29);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color = _getColor();
    return GestureDetector(
      onTap: _onButtonTapped,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: color,
                border: Border.all(color: color),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            width: 250,
            height: 250,
          ),
          FadeTransition(
            opacity: _animation,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              width: 250,
              height: 250,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.bottomRight,
            child: ImageIcon(_getIcon()),
          )
        ],
      ),
    );
  }
}
