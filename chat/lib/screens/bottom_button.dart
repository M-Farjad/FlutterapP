import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';
import '../main.dart';

class ButtonWithBottomContainer extends StatefulWidget {
  @override
  _ButtonWithBottomContainerState createState() =>
      _ButtonWithBottomContainerState();
}

class _ButtonWithBottomContainerState extends State<ButtonWithBottomContainer>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  bool _iscatBtnToggled = true;
  bool _isCustomBtnToggled = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleOffer() {
    setState(() {
      _iscatBtnToggled = !_iscatBtnToggled;
      _isCustomBtnToggled = !_iscatBtnToggled;
    });
  }

  void _toggleCustom() {
    setState(() {
      _isCustomBtnToggled = !_isCustomBtnToggled;
      _iscatBtnToggled = !_isCustomBtnToggled;
    });
  }

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button with Bottom Container'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (!_isExpanded)
            MaterialButton(
              onPressed: _toggleContainer,
              child: Text('Open Container'),
            ),
          if (_isExpanded) SizedBox(height: 16),
          SizeTransition(
            sizeFactor: _animation,
            child: Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: mq.width * .04),
                    padding: EdgeInsets.symmetric(vertical: mq.width * .02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            _toggleOffer();
                          },
                          icon: SvgPicture.asset(_iscatBtnToggled
                              ? 'assets/icons/make_offer_selected.svg'
                              : 'assets/icons/make_offer_unselected.svg'),
                          label: Text(
                            'Make an offer',
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  _iscatBtnToggled ? Colors.white : kofferColor,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _iscatBtnToggled ? kofferColor : Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: mq.width * .08,
                                vertical: mq.height * .01),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: kofferColor),
                            ),
                          ),
                        ),
                        SizedBox(width: mq.width * .02),
                        ElevatedButton.icon(
                          onPressed: () {
                            _toggleCustom();
                          },
                          icon: SvgPicture.asset(_isCustomBtnToggled
                              ? 'assets/icons/customize_offer_selected.svg'
                              : 'assets/icons/customize_offer_unselected.svg'),
                          label: Text(
                            'Customization Details',
                            style: TextStyle(
                              fontSize: 16,
                              color: _isCustomBtnToggled
                                  ? Colors.white
                                  : kPrimaryColor,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isCustomBtnToggled
                                ? kPrimaryColor
                                : Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: mq.width * .01,
                                vertical: mq.height * .01),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: kPrimaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_isExpanded)
                    IconButton(
                      onPressed: _toggleContainer,
                      icon: Icon(Icons.keyboard_arrow_down_rounded),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
