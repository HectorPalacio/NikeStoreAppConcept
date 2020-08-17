import 'package:flutter/material.dart';
import 'package:nike_store_concept/src/entity/nike_shoe.dart';

const _buttonSizeWidth = 160.0;
const _buttonSizeHeight = 60.0;
const _buttonCircularSize = 60.0;
const _finalImageSize = 30.0;
const _imageSize = 160.0;

class NikeShoppingCart extends StatefulWidget {
  final NikeShoes shoes;

  const NikeShoppingCart({Key key, @required this.shoes}) : super(key: key);

  @override
  _NikeShoppingCartState createState() => _NikeShoppingCartState();
}

class _NikeShoppingCartState extends State<NikeShoppingCart>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animationResize;
  Animation _animationMovementIn;
  Animation _animationMovementOut;
  final List<bool> _isSelected = [false, false, false, false, false];

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animationResize = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.2)));
    _animationMovementIn = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.6, curve: Curves.fastLinearToSlowEaseIn)));
    _animationMovementOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0, curve: Curves.bounceIn)));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop();
      }
    });
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final buttonSizeWidth = (_buttonSizeWidth * _animationResize.value)
                .clamp(_buttonCircularSize, _buttonSizeWidth);
            final panelSizeWidth = (size.width * _animationResize.value)
                .clamp(_buttonCircularSize, size.width);
            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      color: Colors.black87,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Stack(
                    children: [
                      if (_animationMovementIn.value != 1)
                        Positioned(
                            top: size.height * 0.4 +
                                (_animationMovementIn.value *
                                    size.height *
                                    0.485),
                            //(size.height * 0.00063)),
                            //0.4644 Pixel, 0.485 Xiaomi
                            left: size.width / 2 - panelSizeWidth / 2,
                            width: panelSizeWidth,
                            child: _buildPanel(context)),
                      Positioned(
                        bottom: 40.0 - (_animationMovementOut.value * 100),
                        left: size.width / 2 - buttonSizeWidth / 2,
                        child: TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                          tween: Tween(begin: 1.0, end: 0.0),
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(0.0, value * size.height * 0.6),
                              child: child,
                            );
                          },
                          child: InkWell(
                            onTap: () {
                              _isSelected.contains(true)
                                  ? _controller.forward()
                                  : null;
                            },
                            child: Container(
                              width: buttonSizeWidth,
                              height: (_buttonSizeHeight *
                                      _animationResize.value)
                                  .clamp(
                                      _buttonCircularSize, _buttonSizeHeight),
                              decoration: BoxDecoration(
                                color: _isSelected.contains(true)
                                    ? Colors.black
                                    : Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                    ),
                                    if (_animationResize.value == 1) ...[
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          'ADD TO CART',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget _buildPanel(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final curretnImageSize = (_imageSize * _animationResize.value)
        .clamp(_finalImageSize, _imageSize);
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0.0, value * size.height * 0.6),
          child: child,
        );
      },
      child: Container(
        height: (size.height * 0.6 * _animationResize.value)
            .clamp(_buttonCircularSize, size.height * 0.6),
        width: (size.width * _animationResize.value)
            .clamp(_buttonCircularSize, size.width),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomLeft: _animationResize.value == 1
                  ? Radius.circular(0)
                  : Radius.circular(30),
              bottomRight: _animationResize.value == 1
                  ? Radius.circular(0)
                  : Radius.circular(30),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Row(
                children: [
                  Image.asset(
                    widget.shoes.images.first,
                    height: curretnImageSize,
                  ),
                  Spacer(),
                  if (_animationResize.value == 1) ...[
                    Column(
                      children: [
                        Text(
                          widget.shoes.model,
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '\$${widget.shoes.currentPrice.toInt().toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            ),
            if (_animationResize.value == 1) ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                child: Divider(),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Text(
                        'SELECT SIZE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: ToggleButtons(
                          children: <Widget>[
                            Text(
                              'US 6',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('US 7',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('US 9',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('US 10',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('US 11',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                          onPressed: (idx) {
                            if (_isSelected.contains(true)) {
                              for (var i = 0; i < _isSelected.length; i++) {
                                _isSelected[i] ? _isSelected[i] = false : null;
                              }
                            }
                            Future.delayed(Duration(milliseconds: 1000))
                                .then((value) => null);
                            setState(() {
                              _isSelected[idx] = !_isSelected[idx];
                            });
                            //0.4644
                          },
                          isSelected: _isSelected,
                          color: Colors.black,
                          selectedColor: Colors.white,
                          fillColor: Colors.black,
                          borderRadius: BorderRadius.circular(30.0),
                          borderWidth: 3,
                          borderColor: Colors.black,
                          selectedBorderColor: Colors.black,
                          splashColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
