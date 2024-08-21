import 'package:flutter/material.dart';
import '../utils/helper_functions.dart';

//Horizontal Scrollable row showcasing the top moving cryptos.
//used on the HomeScreen
class TopMoversRow extends StatelessWidget {
  const TopMoversRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.white),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            cryptoLogos[cryptoLogos.keys.toList()[index + 1]]!),
                      ),
                      const Spacer(),
                      Text(
                        dummyPercentChange[index + 1],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "${cryptoLogos.keys.toList()[index + 1].substring(0, 3)}  ₹${dummyPrice[index + 1]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
