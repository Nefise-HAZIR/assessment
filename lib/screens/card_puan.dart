import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardPuan extends StatefulWidget {
  final String name;
  const CardPuan({super.key, required this.name});
  @override
  State<CardPuan> createState() => _CardPuanState();
}

class _CardPuanState extends State<CardPuan> {
  int _selectedRating = 1;
  int totalPuan = 0;
  bool button_clicked = false;

  void addRatingToFirestore(String name, int rating) {
    FirebaseFirestore.instance.collection('ratings').add({
      'name': name,
      'rating': rating,
    });
  }

  Future<int> getTotalRatings(String name) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('ratings').where('name', isEqualTo: name).get();
    List<DocumentSnapshot> documents = querySnapshot.docs;
    int total = 0;

    documents.forEach((doc) {
      total += (doc['rating'] as num).toInt();
    });
    setState(() {
      totalPuan = total;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.59,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 181, 181, 181),
          offset: Offset(0, 6),
          blurRadius: 6.0,
        )
      ]),
      child: Column(
        children: [
          Text(
            widget.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          for (int i = 1; i <= 5; i++)
            Row(
              children: <Widget>[
                Radio<int>(
                  value: i,
                  groupValue: _selectedRating,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedRating = value!;
                    });
                  },
                ),
                Text('$i puan'),
              ],
            ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "$_selectedRating",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (button_clicked == false) {
                      addRatingToFirestore(widget.name, _selectedRating);
                      button_clicked = true;
                    }
                    getTotalRatings("${widget.name}");
                  },
                  child: const Text("Kaydet"))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Total : $totalPuan",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          )
        ],
      ),
    );
  }
}
