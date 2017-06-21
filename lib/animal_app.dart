import 'package:flutter/material.dart';

class AnimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new AnimalList());
  }
}

class AnimalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Builds the widget for one animal.
    Widget buildAnimalWidget(Animal animal) {
      return new ListTile(
        leading: new Image.asset(animal.imageName, height: 100.0),
        title: new Text(animal.name),
        subtitle: new Text(
          animal.description,
        ),
        isThreeLine: true,
      );
    }

    /// Builds one animal widget per animal.
    final animalWidgetList =
        getFakeAnimalData().map((animal) => buildAnimalWidget(animal)).toList();

    /// Build scaffolding around the list view to get default theme styling.
    /// Using list view to get scrolling view.
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Forest Falls Animal Rescue'),
      ),
      body: new ListView(
        padding: kMaterialListPadding,
        children: animalWidgetList,
      ),
    );
  }
}

/// An animal class to hold information about the animal.
class Animal {
  final String name;
  final String imageName;
  final String description;

  Animal(
    this.name,
    this.imageName,
    this.description,
  );
}

/// Return list of example animals to get started.
List<Animal> getFakeAnimalData() {
  return [
    new Animal(
      'Coffee',
      'images/coffee.jpg',
      'Coffee is a shiba that is used to posing for meme pictures.',
    ),
    new Animal(
      'Breakfast',
      'images/breakfast.jpg',
      'Breakfast likes to be the only cat in the house. No second breakfast.',
    ),
    new Animal(
      'Katie',
      'images/katie.jpg',
      'Katie'
          's previously lived with an older adult and was very quiet. Since '
          'coming to the shelter she has really oepned up and loves to play '
          'and chase squirrels.',
    ),
    new Animal(
        'Scarlett',
        'images/scarlett.jpg',
        'This is Scarlett, a petite Cavalier King Charles Spaniel mixed with '
        'something spicy, She is best with adults and mid sized humans.'),
    new Animal(
        'Annie',
        'images/annie.jpg',
        'This is Annie, the amazing two tailed Cocker Spaniel. She loves '
        'everyone, even little humans and those of the feline persuasion.'),
  ];
}
