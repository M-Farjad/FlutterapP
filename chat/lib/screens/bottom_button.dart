import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';
import '../main.dart';
import '../widgets/custom_amount_button.dart';

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
  final _textEditingController = TextEditingController();
  int _selectedButtonIndex = 0;
  void _updateAmount(String amount, int index) {
    setState(() {
      _textEditingController.text = amount;
      _selectedButtonIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _textEditingController.text = '45000';
    // _textEditingController.addListener(_updateAmount());   //in case of void func() no argue
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateAmount(_textEditingController.text, _selectedButtonIndex);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textEditingController.dispose();
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
        title: const Text('Button with Bottom Container'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!_isExpanded)
            MaterialButton(
              onPressed: _toggleContainer,
              child: const Text('Open Container'),
            ),
          if (_isExpanded) const SizedBox(height: 16),
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
                    _iscatBtnToggled
                        ? Container(
                            margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                            width: mq.width * .9,
                            height: mq.height * .4,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 13,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    width: mq.width * .9,
                                    height: mq.height * .3,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kofferColor),
                                      color: kWhiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Make an Offer',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: kTextColor),
                                              ),
                                              Text(
                                                'Shadi Package',
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CustomAmountButton(
                                              amount: '45000',
                                              index: 0,
                                              selectedButtonIndex:
                                                  _selectedButtonIndex,
                                              onPressed: _updateAmount,
                                            ),
                                            SizedBox(width: mq.width * .01),
                                            CustomAmountButton(
                                              amount: '35000',
                                              index: 1,
                                              selectedButtonIndex:
                                                  _selectedButtonIndex,
                                              onPressed: _updateAmount,
                                            ),
                                            SizedBox(width: mq.width * .01),
                                            CustomAmountButton(
                                              amount: '30000',
                                              index: 2,
                                              selectedButtonIndex:
                                                  _selectedButtonIndex,
                                              onPressed: _updateAmount,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: mq.height * .05),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'RS',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: kTextColor),
                                            ),
                                            SizedBox(width: mq.width * .01),
                                            SizedBox(
                                              width: mq.width * .2,
                                              child: TextFormField(
                                                controller:
                                                    _textEditingController,
                                                decoration:
                                                    const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 5),
                                                  isCollapsed: true,
                                                  hintText: 'Amount in Rs',
                                                  hintStyle:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  backgroundColor: kofferColor),
                                              child: const Text(
                                                'Next',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // group34225V6b (3:263)
                                  left: mq.width * .4,
                                  top: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: const Color(0xff4285f4)),
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          _toggleContainer();
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
