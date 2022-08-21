import 'package:flutter/material.dart';

class Dineoutlist {
  var title;
  var subtitle;
  var icon;
  var index;

  Dineoutlist({this.icon, this.subtitle, this.title, this.index});
}

List<Dineoutlist> dineoutlist = [
  Dineoutlist(
      icon: Icon(
        Icons.table_chart,
        color: Colors.brown,
      ),
      title: "Reserve Table",
      subtitle: "",
      index: 0),
];

class PopularList {
  var name;
  var image;

  PopularList({this.image, this.name});
}

List<PopularList> popular = [
  PopularList(
      image:
          "https://media.gettyimages.com/photos/elegant-shopping-mall-picture-id182408547?s=2048x2048",
      name: "V3S mall"),
  PopularList(
      image:
          "https://media.gettyimages.com/photos/cafebar-in-moscow-picture-id1158221681?s=2048x2048",
      name: "The Great Indian Place"),
  PopularList(
      image:
          "https://media.gettyimages.com/photos/cafebar-in-moscow-picture-id1158221681?s=2048x2048",
      name: "M3s"),
  PopularList(
      image:
          "https://media.gettyimages.com/photos/cafebar-in-moscow-picture-id1158221681?s=2048x2048",
      name: "M3s"),
];

var barimages = [
  "https://media.gettyimages.com/photos/wooden-table-in-front-of-abstract-blurred-restaurant-lights-of-bar-picture-id1250327071?k=6&m=1250327071&s=612x612&w=0&h=z_gcxwIlFxPxrPh3XX3maljIx7Nqg4Ct2hA6LKjgYqM=",
  "https://media.gettyimages.com/photos/waiter-serves-beers-at-a-bar-on-the-eve-of-the-mandatory-closure-of-picture-id1228945616?k=6&m=1228945616&s=612x612&w=0&h=d-qVLDUFwS5hZzJuXKGosaY6O0TYEL09T9EXAVyjLJ4="
];

final imageList = [
  "https://media.gettyimages.com/photos/nightclub-picture-id157532720?k=6&m=157532720&s=612x612&w=0&h=oan-SIIOcol4NRhRWpJ_Vd2k6FzFE24Ub4zmK4SjNzM=",
  "https://media.gettyimages.com/photos/interior-of-empty-bar-at-night-picture-id826837298?k=6&m=826837298&s=612x612&w=0&h=-hIbnJFk265RDKqfykcNmKXlge91c0ynk3hDAGvjESI=",
  "https://media.gettyimages.com/photos/empty-nightclub-dance-floor-picture-id1053940970?k=6&m=1053940970&s=612x612&w=0&h=2VsbM5AKs7sLlklQ7m0iN6lTg_7ulDB4jZfdrG5t36M=",
  "https://media.gettyimages.com/photos/bartender-making-cocktails-at-retro-bar-for-mature-couple-picture-id991839156?k=6&m=991839156&s=612x612&w=0&h=nXyZjg1b9XlVeNQUJp3wy3WkiAirt0ZkocsPmBrQe00=",
];

class TimeList {
  bool isSelected = false;
  bool isSelected1 = false;
  var time;

  TimeList({this.time, this.isSelected, this.isSelected1});
}

List<TimeList> breaskfastList = [
  TimeList(isSelected1: true, isSelected: false, time: "9:00 AM"),
  TimeList(isSelected1: false, isSelected: false, time: "9:15 AM"),
  TimeList(isSelected1: false, isSelected: false, time: "9:30 AM"),
  TimeList(isSelected1: false, isSelected: false, time: "9:45 AM"),
  TimeList(isSelected1: false, isSelected: false, time: "10:00 AM"),
  TimeList(isSelected1: false, isSelected: false, time: "10:15 AM"),
  TimeList(isSelected1: false, isSelected: false, time: "10:30 AM"),
  TimeList(isSelected1: false, isSelected: false, time: "10:45 AM"),
  TimeList(isSelected1: false, isSelected: false, time: "11:00 AM"),
];

List<TimeList> lunchlist = [
  TimeList(isSelected1: true, isSelected: false, time: "12:00 PM"),
  TimeList(isSelected1: true, isSelected: true, time: "12:15 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "12:30 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "1:00 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "1:15 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "1:30 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "1:45 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "2:00 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "2:15 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "2:30 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "2:45 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "3:00 PM"),
];

List<TimeList> dinnerlist = [
  TimeList(isSelected1: true, isSelected: false, time: "7:00 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "7:15 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "7:30 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "7:45 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "8:00 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "8:15 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "8:30 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "8:45 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "9:00 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "9:15 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "9:30 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "9:45 PM"),
  TimeList(isSelected1: true, isSelected: false, time: "10:00 PM"),
];
