import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_remit/ui/authentication/widgets/welcome_top_section.dart';
import 'package:e_remit/utils/static_data.dart';
import 'package:flutter/material.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
//top section with logo
        const WelcomeTopSection(),
//carouselSlider section
        getCarousalBody(context),

        Flexible(child: customCarouselIndicator(context)),
      ],
    );
  }

  getCarousalBody(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.57,
      child: CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            disableCenter: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            viewportFraction: 1,
            autoPlay: true,
            enlargeCenterPage: false,
            aspectRatio: 4 / 5,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
    );
  }

  customCarouselIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 10.0,
            height: 10.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : _current == entry.key
                            ? Colors.red
                            : Colors.grey)
                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}
