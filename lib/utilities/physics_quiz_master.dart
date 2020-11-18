import 'dart:math';

import 'package:testmephysics/classes/physics_question_class.dart';

class PhysicsQuizMaster {
  // List to hold the categories the user want to be tested on.
  List<List<PhysicsQ>> _testBanks = [];

  // List to hold questions picked for a test
  List<PhysicsQ> _testQuestions = [];

  // Keep a tally on which question in our chosen list we are on
  int _questionNum = 0;

  //questions per category chosen by user.
  int _qpc;

  /// Helper Methods

  void nextQuestion() {
    // print('nextQuestion Started');
    // print('_questionNum = $_questionNum');
    if (_questionNum < _testQuestions.length - 1) {
      _questionNum++;
      // print('_questionNum = $_questionNum');
    }
  }

  int isFinished() {
    ///Returns 2 if the end of the test is reached
    ///Returns 1 if it is the last question
    ///Returns 0 otherwise
    // print('Test length = ${_testQuestions.length}');
    if (_questionNum >= _testQuestions.length - 1) {
      // print('Question number ${_questionNum + 1} reached, quiz is finished');
      return 2;
    } else {
      if (_questionNum == _testQuestions.length - 2) {
        return 1;
      }
      // print('Question number ${_questionNum + 1} complete');
      return 0;
    }
  }

  ///Reset the test length back to zero and the lists back to empty
  void start(Map _catMapList) {
    // print('First Start');
    _questionNum = 0;
    _testQuestions = [];
    _testBanks = [];
    _qpc = _catMapList['qpc'];
    // setInitialCategories();
    categoriesInPlay(_catMapList);
    chooseQuestionsForTest();
  }

  void restart(Map _catMapList) {
    print('restarted');
    _questionNum = 0;
    _testQuestions = [];
    _testBanks = [];
    _qpc = _catMapList['qpc'];
    categoriesInPlay(_catMapList);
    chooseQuestionsForTest();
  }

  void categoriesInPlay(Map _catMapList) {
    // print('categoryInPlay Started');
    if (_catMapList['eng']) {
      // print('Energy added');
      _testBanks.add(_questionBank1);
    }
    if (_catMapList['for']) {
      // print('forces added');
      _testBanks.add(_questionBank2);
    }
    if (_catMapList['fom']) {
      // print('forcesM added');
      _testBanks.add(_questionBank3);
    }
    if (_catMapList['wav']) {
      // print('wave added');
      _testBanks.add(_questionBank4);
    }
    if (_catMapList['elc']) {
      // print('elect added');
      _testBanks.add(_questionBank5);
    }
    if (_catMapList['mag']) {
      // print('mag added');
      _testBanks.add(_questionBank6);
    }
    if (_catMapList['som']) {
      // print('matter added');
      _testBanks.add(_questionBank7);
    }
    if (_catMapList['atm']) {
      // print('atom added');
      _testBanks.add(_questionBank8);
    }
    if (_catMapList['spy']) {
      // print('space added');
      _testBanks.add(_questionBank9);
    }
    // print('categoryInPlay complete');
  }

  ///Used to choose questions at Random from the selected category banks.
  /// could have used List.shuffle().
  void chooseQuestionsForTest() {
    // print('chooseQuestions Started');
    for (int i = 0; i < _testBanks.length; i++) {
      //List to hold choices made to we dont choose the same question twice
      List alreadyPicked = [];
      //Hold number of valid choices from random generator
      int countOfValid = 0;
      //Loop while we pick valid choices
      while (countOfValid < _qpc) {
        bool goodNum = true;
        // print('number = $number');
        int _chosenQuestionNum = Random().nextInt(10);
        // print('CQNumber: $_chosenQuestionNum');
        String _chosenQuestionNumStr = _chosenQuestionNum.toString();
        // Check to see if this number was already picked for the questions
        alreadyPicked.forEach((element) {
          if (element == _chosenQuestionNumStr) {
            goodNum = false;
          }
        });
        //If choice is OK add this question to the list, add the choice to
        // alreadypicked and increment the counter
        if (goodNum) {
          _testQuestions.add(_testBanks[i][_chosenQuestionNum]);
          alreadyPicked.add(_chosenQuestionNumStr);
          countOfValid++;
        }
      }
    }
  }

  ///Get data for screen methods
  String getQuestionText() {
    // print('getQuestionText Started');
    return _testQuestions[_questionNum].question;
  }

  bool getAnswerBool() {
    return _testQuestions[_questionNum].answer;
  }

  String getCategoryText() {
    return _testQuestions[_questionNum].category;
  }

  String getFeedbackText() {
    return _testQuestions[_questionNum].feedback;
  }

  /// QUESTION DATA
  /// Topic 1 - Energy
  /// Topic 2 - Forces
  /// Topic 3 - Forces and Motion
  /// Topic 4 - Wave Motion
  /// Topic 5 - Electricity
  /// Topic 6 - Magnetism and Electromagnetism
  /// Topic 7 - Particle Model of matter
  /// Topic 8 - Atomic structure
  /// Topic 9 - Space Physics

  //Here is the list of questions
  /// Topic 1 - Energy
  /// //Todo
  List<PhysicsQ> _questionBank1 = [
    PhysicsQ(
        category: 'Energy',
        number: 1,
        question: 'Energy - 1',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Energy',
        number: 2,
        question: 'Energy - 2',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Energy',
        number: 3,
        question: 'Energy - 3',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Energy',
        number: 4,
        question: 'Energy - 4',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Energy',
        number: 5,
        question: 'Energy - 5',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Energy',
        number: 6,
        question: 'Energy - 6',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Energy',
        number: 7,
        question: 'Energy - 7',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Energy',
        number: 8,
        question: 'A system is an object or a group of objects.',
        answer: true,
        feedback:
            'It can be defined as an area of the universe that has been chosen for studying changes.  This can be a single item or something as large as a planet.'),
    PhysicsQ(
        category: 'Energy',
        number: 9,
        question: 'Energy - 9',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Energy',
        number: 10,
        question: 'Energy - 10',
        answer: false,
        feedback: 'TBC'),
  ];

//Todo
  /// Topic 2 - Forces
  List<PhysicsQ> _questionBank2 = [
    PhysicsQ(
        category: 'Forces',
        number: 1,
        question:
            'Gas molecules colliding with the walls of a container have a net force that pushes downwards.',
        answer: false,
        feedback:
            'The Molecules act on the container walls in all directions randomly, so net force on the container has no overall direction.'),
    PhysicsQ(
        category: 'Forces',
        number: 2,
        question: 'Forces - 2',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces',
        number: 3,
        question: 'Forces - 3',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces',
        number: 4,
        question: 'Forces - 4',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces',
        number: 5,
        question: 'Forces - 5',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces',
        number: 6,
        question: 'Forces - 6',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces',
        number: 7,
        question: 'Forces - 7',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces',
        number: 8,
        question: 'Forces - 8',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces',
        number: 9,
        question: 'Forces - 9',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces',
        number: 10,
        question: 'Forces - 10',
        answer: false,
        feedback: 'TBC'),
  ];

//Todo
  /// Topic 3 - Forces and Motion
  List<PhysicsQ> _questionBank3 = [
    PhysicsQ(
        category: 'Forces and Motion',
        number: 1,
        question: 'Forces and Motion - 1',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces and Motion',
        number: 2,
        question: 'Forces and Motion - 2',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces and Motion',
        number: 3,
        question: 'Forces and Motion - 3',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces and Motion',
        number: 4,
        question: 'Forces and Motion - 4',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces and Motion',
        number: 5,
        question: 'Forces and Motion - 5',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces and Motion',
        number: 6,
        question:
            'Newtons third laws states that whenever two objects interact, they exert equal and opposite forces on each other.',
        answer: true,
        feedback:
            'Also widely known as \'every action has an equal and opposite reaction\'.'),
    PhysicsQ(
        category: 'Forces and Motion',
        number: 7,
        question: 'Forces and Motion - 7',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces and Motion',
        number: 8,
        question: 'Forces and Motion - 8',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces and Motion',
        number: 9,
        question: 'Forces and Motion - 9',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Forces and Motion',
        number: 10,
        question: 'Forces and Motion - 10',
        answer: false,
        feedback: 'TBC'),
  ];

  /// Topic 4 - Waves
  List<PhysicsQ> _questionBank4 = [
    PhysicsQ(
        category: 'Waves',
        number: 1,
        question: 'Humans can detect electromagnetic waves with our eyes.',
        answer: false,
        feedback: 'Humans can only detect light in the visible spectrum'),
    PhysicsQ(
        category: 'Waves',
        number: 2,
        question: 'Direct current is used to generate radio waves.',
        answer: false,
        feedback: 'Alternating current is used to generate radio waves.'),
    PhysicsQ(
        category: 'Waves',
        number: 3,
        question: 'X-rays and gamma rays can both be used to treat cancers.',
        answer: true,
        feedback:
            'Both are electromagnetic waves used in the field of medicine.'),
    PhysicsQ(
        category: 'Waves',
        number: 4,
        question:
            'Lenses refract light travelling through them to form an image.',
        answer: true,
        feedback:
            'An image is formed on the retina after the light is refracted through the lens of the eye'),
    PhysicsQ(
        category: 'Waves',
        number: 5,
        question:
            'An opaque object absorbing all wavelengths of light will be bright white.',
        answer: false,
        feedback:
            'If all light wavelengths are absorbed it will reflect nothing and so be black.'),
    PhysicsQ(
        category: 'Waves',
        number: 6,
        question: 'Humans can hear ultrasound waves.',
        answer: false,
        feedback:
            'Ultrasound waves are above 20kHz which is above the upper limit a human can hear.'),
    PhysicsQ(
        category: 'Waves',
        number: 7,
        question:
            '25 Hz is the lowest frequency that a human with normal hearing can detect.',
        answer: false,
        feedback:
            '20 Hz is the lowest frequency that a human with normal hearing can detect.'),
    PhysicsQ(
        category: 'Waves',
        number: 8,
        question: 'S-waves are longitudinal waves.',
        answer: false,
        feedback:
            'S-waves are transverse waves, their speed and direction can change depending on the density of solid they are passing through. S-waves cannot travel through liquids.'),
    PhysicsQ(
        category: 'Waves',
        number: 9,
        question: 'P-waves are longitudinal waves.',
        answer: true,
        feedback: 'P-waves can travel through liquids and solids.'),
    PhysicsQ(
        category: 'Waves',
        number: 10,
        question:
            'The Amplitude of a wave is the measurement from the top (crest) to the bottom (trough) and is measured in nano-meters.',
        answer: false,
        feedback:
            'The Amplitude of a wave is the measurement from a point of zero displacement to the point of maximum displacement.  e.g. zero to crest or zero to trough.'),
  ];

//Todo
  /// Topic 5 - Electricity
  List<PhysicsQ> _questionBank5 = [
    PhysicsQ(
        category: 'Electricity',
        number: 1,
        question: 'Electricity - 1',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Electricity',
        number: 2,
        question: 'Electricity - 2',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Electricity',
        number: 3,
        question:
            'The force between 2 charged objects gets stronger as they move apart.',
        answer: false,
        feedback:
            'The amount the objects can interact with each other reduces as they move apart so the force on them also gets weaker.'),
    PhysicsQ(
        category: 'Electricity',
        number: 4,
        question:
            'As Air is an insulator, electric current cannot pass through it.',
        answer: false,
        feedback:
            'A Strong electric field around a charged object can Ionise the air making it much easier for current to pass through.'),
    PhysicsQ(
        category: 'Electricity',
        number: 5,
        question: 'Electricity - 5',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Electricity',
        number: 6,
        question: 'Electricity - 6',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Electricity',
        number: 7,
        question: 'Electricity - 7',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Electricity',
        number: 8,
        question: 'Electricity - 8',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Electricity',
        number: 9,
        question: 'Electricity - 9',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Electricity',
        number: 10,
        question: 'Electricity - 10',
        answer: false,
        feedback: 'TBC'),
  ];

//Todo
  /// Topic 6 - Magnetism and Electromagnetism
  List<PhysicsQ> _questionBank6 = [
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 1,
        question: 'Magnetism and Electromagnetism - 1',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 2,
        question: 'Magnetism and Electromagnetism - 2',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 3,
        question: 'Magnetism and Electromagnetism - 3',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 4,
        question: 'Magnetism and Electromagnetism - 4',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 5,
        question: 'Magnetism and Electromagnetism - 5',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 6,
        question: 'Magnetism and Electromagnetism - 6',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 7,
        question: 'Magnetism and Electromagnetism - 7',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 8,
        question: 'Magnetism and Electromagnetism - 8',
        answer: false,
        feedback: 'TBC'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 9,
        question:
            'You can use your right hand to determine the direction a coil of wire will rotate in a motor.',
        answer: false,
        feedback: 'You can use Flemming\'s left hand rule.'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 10,
        question: 'Magnetism and Electromagnetism - 10',
        answer: false,
        feedback: 'TBC'),
  ];

  /// Topic 7 - Particle Model of matter
  List<PhysicsQ> _questionBank7 = [
    PhysicsQ(
        category: 'Particle Model of Matter',
        number: 1,
        question:
            'When a Sealed syringe of air is compressed by the Piston pushing in, Its pressure will decrease as the volume decreases.',
        answer: false,
        feedback:
            'As the Piston makes the space in the syringe smaller, the volume of air decreases and the pressure will increase.'),
    PhysicsQ(
        category: 'Particle Model of Matter',
        number: 2,
        question: 'The Density of matter is generally highest in a Solid.',
        answer: true,
        feedback:
            'In the Particle Model, particles are arranged closely together in a solid.'),
    PhysicsQ(
        category: 'Particle Model of Matter',
        number: 3,
        question:
            'A syringe of air, when taken from a freezer, has a density of 2.8kg/m³kg.  As it warms the piston moves from 2cm³ to 4cm³ at which point the density will be 0.7kg/m³kg',
        answer: true,
        feedback:
            'The density of the air at 3cm³ will be half of 2cm³.  And again 4cm³ will be half of 3cm³ so for each cm moved, halve the density.'),
    PhysicsQ(
        category: 'Particle Model of Matter',
        number: 4,
        question:
            'To find the Specific Heat Capacity (SHC) of a metal block you will need to measure the voltage and current over time, along with the mass of the block.',
        answer: false,
        feedback:
            'You will also need to measure the temperature change over time.    SHC = Energy/mass x Temp rise.'),
    PhysicsQ(
        category: 'Particle Model of Matter',
        number: 5,
        question:
            'The relationship between water depth and pressure if linear.',
        answer: false,
        feedback:
            'Pressure at 10m is approximately twice that at the surface and at 20m 3 times that of the surface.'),
    PhysicsQ(
        category: 'Particle Model of Matter',
        number: 6,
        question:
            'The Specific Heat of Vaporisation is described as the amount of Energy needed to change 1kg of a substance from a Liquid to a vapour/gas with a rise of 1 degree C.',
        answer: false,
        feedback:
            'Specific Heat of Vaporisation is the amount of Energy needed to change 1kg of a substance from a Liquid to a vapour/gas with no change in ite Temperature.'),
    PhysicsQ(
        category: 'Particle Model of Matter',
        number: 7,
        question:
            'In a sample of a Gas, its particles move in random directions and varying speeds.',
        answer: true,
        feedback:
            'The energy in the gas also makes its particles move more vigorously than in a liquid state.'),
    PhysicsQ(
        category: 'Particle Model of Matter',
        number: 8,
        question:
            'Sublimation is the process of a gas changing to a liquid without crystals forming.',
        answer: false,
        feedback:
            'Sublimation is the process of a Solid changing to a Gas without passing through a liquid stage.'),
    PhysicsQ(
        category: 'Particle Model of Matter',
        number: 9,
        question:
            'Density of a substance tells you how much mass a defined amount of the substance will have. ',
        answer: true,
        feedback:
            'Density is defined as the mass of a substance per unit volume of that substance.'),
    PhysicsQ(
        category: 'Particle Model of Matter',
        number: 10,
        question:
            'In a closed system, when a substance changes state from a liquid to gas it will loose mass in the process.',
        answer: false,
        feedback:
            'When a substance changes state from a liquid to gas it will maintain its mass.  Reversing the process will take it back to its original form.  This is known as conservation of mass.'),
  ];

  /// Topic 8 - Atomic structure
  List<PhysicsQ> _questionBank8 = [
    PhysicsQ(
        category: 'Atomic Structure',
        number: 1,
        question:
            'The word Atom comes from ancient greek \'Atomos\' meaning uncuttable. They believed matter (like say metal) was made up of millions of tiny indivisible pieces of the same metal.',
        answer: true,
        feedback:
            'Democritus (an ancient greek philosopher) was one of the two founders of the \'Atomist\' theory and held that there are small indivisible bodies from which everything else is composed, and that these move about in an infinite void.'),
    PhysicsQ(
        category: 'Atomic Structure',
        number: 2,
        question:
            'Ernest Rutherford discovered that the plum pudding model of Atoms had been correct in his experiments with Alpha particles and gold leaf in 1905.',
        answer: false,
        feedback:
            'The model was incorrect. Positively charged Alpha particles did not all pass completely though the gold leaf as expected. His conclusions were that the Atom is mostly empty space, has a concentration of +ve charge, the +ve charge volume is tiny.'),
    PhysicsQ(
        category: 'Atomic Structure',
        number: 3,
        question:
            'The total number of protons and neutrons in an Atom is called the mass number. The number of protons is called the atomic number.',
        answer: true,
        feedback:
            'Mass number and atomic number are two important pieces of information about an atom.'),
    PhysicsQ(
        category: 'Atomic Structure',
        number: 4,
        question:
            'The Mass number and Atomic number of any element will be constant for that element. ',
        answer: false,
        feedback:
            'The Atomic number defines the element and will not change for that element but the mass number may change with different numbers of neutrons. Elements with different numbers of protons are known as Isotopes.'),
    PhysicsQ(
        category: 'Atomic Structure',
        number: 5,
        question:
            'If a nucleus has too few neutrons, it will emit a ‘package’ of two protons and two neutrons called an alpha particle.',
        answer: true,
        feedback:
            'Alpha Radiation is the emission of two protons and two neutrons by a decaying element nucleus.  This may also be known as a Helium-4 nucleus.'),
    PhysicsQ(
        category: 'Atomic Structure',
        number: 6,
        question:
            'Beta Radiation can be stopped by skin on a thin piece of paper.',
        answer: false,
        feedback:
            'Alpha Radiation can be stopped by skin on a thin piece of paper.  Beta - 3mm Aluminium foil, Gamma - Around 10cm of lead / steel / concrete.'),
    PhysicsQ(
        category: 'Atomic Structure',
        number: 7,
        question:
            'The Half Life of a sample of an isotope is the time taken for its nuclei to reduce by 50%.',
        answer: true,
        feedback:
            'Yes, for a particular sample this it the time taken for the number of its nuclei to half.'),
    PhysicsQ(
        category: 'Atomic Structure',
        number: 8,
        question:
            'Atoms must always have the same amount of electrons as protons so they remain in balance.',
        answer: false,
        feedback:
            'Atoms can loose or gain electrons. When they do they are known as Ions. If they gain electrons they become negatively charged ions and a loss will make them positively charged ions'),
    PhysicsQ(
        category: 'Atomic Structure',
        number: 9,
        question:
            'The control rods in a Nuclear Fission reactor are used to balance the heat generated and the removal of heat (by the cooling medium).',
        answer: true,
        feedback:
            'As the control rods are raised the reaction gets to a point where it is sustainable (known as critical).  The heat generated is removed and used to drive turbines.'),
    PhysicsQ(
        category: 'Atomic Structure',
        number: 10,
        question:
            'Nuclear Fission happens in a reactor when a Gamma ray from a Uranium-235 atom hits another Uranium-235 nucleus turning it into Uranium-236.',
        answer: false,
        feedback:
            'U-236 is made by the absorption of a neutron into U-235. It is unstable and emits another 2 to 3 neutrons as it decays.  If one of these neutrons hits another U-235 nucleus, again 2-3 neutrons will result.  This is known as a chain reaction.'),
  ];

  /// Topic 9 - Space Physics
  List<PhysicsQ> _questionBank9 = [
    PhysicsQ(
        category: 'Space Physics',
        number: 1,
        question: 'Pluto is the outermost planet of our solar system.',
        answer: false,
        feedback:
            'While Pluto is the outermost body of the solar system it is actually a dwarf planet.'),
    PhysicsQ(
        category: 'Space Physics',
        number: 2,
        question:
            'A comet is an object that orbits the Sun.  It is made from rocky materials, dust and ice.  As it gets closer to the sun some of the ice starts to vapourise giving the comet a tail of gas.',
        answer: true,
        feedback:
            'Comets are made from dust and ice and some rocky materials.'),
    PhysicsQ(
        category: 'Space Physics',
        number: 3,
        question:
            'The main process going on inside the Sun is a nuclear reaction known as "Fission".',
        answer: false,
        feedback:
            'The Nuclear fusion process happens in the Sun.  This is when hydrogen nuclei combine to form helium nuclei.'),
    PhysicsQ(
        category: 'Space Physics',
        number: 4,
        question:
            'A Natural Satellite is an object such as the moons that orbit around most of the planets in the solar system',
        answer: true,
        feedback:
            'Earth\'s Moon is a Natural Satellite but the international space station is man made so not a natural Satellite.'),
    PhysicsQ(
        category: 'Space Physics',
        number: 5,
        question:
            'The first stage of our Sun\'s development was something known as a protostar (proto - meaning first or earliest)',
        answer: false,
        feedback:
            'The first stage of a stars development is known as a Nebula.  This is a gigantic cloud of dust and gas in space that can slowly come together to form protostars and then stars and planets.'),
    PhysicsQ(
        category: 'Space Physics',
        number: 6,
        question:
            'A body in a stable circular orbit around the earth moves at a constant speed but its velocity is constantly changing.',
        answer: true,
        feedback:
            'Velocity is a vector and so has a speed and direction.  As the body travelling in a circle will change direction and so velocity, as it moves.  Changes in velocity result in an acceleration that balances out the gravitational pull.'),
    PhysicsQ(
        category: 'Space Physics',
        number: 7,
        question:
            'A man made satellite in a polar orbit around the Earth will take longer to orbit than a man made satellite in a geostationary orbit.',
        answer: false,
        feedback:
            'A geostationary orbit is much higher than a Polar orbit.  It takes 24 hours to complete e.g. the same the earth takes to complete 1 day.  Polar orbits are typically much lower so much quicker.'),
    PhysicsQ(
        category: 'Space Physics',
        number: 8,
        question:
            'The closer a satellite is to the body it orbits, the faster it must go to maintain that orbit.',
        answer: true,
        feedback:
            'Mercury (as the planet closest to the sun) orbits at around 47,000 m/s while Neptune (as the planet farthest from the sun) orbits at around 5000 m/s'),
    PhysicsQ(
        category: 'Space Physics',
        number: 9,
        question: 'All Asteroids orbit in a belt between Mars and Jupiter.',
        answer: false,
        feedback:
            'While most Asteroids in the Solar System are found between Mars and Jupiter, some orbit with Jupiter and others still may have more eccentric orbits leading them to cross earths orbit.'),
    PhysicsQ(
        category: 'Space Physics',
        number: 10,
        question: 'The Asteroid belt sits as a ring around Saturn.',
        answer: false,
        feedback:
            'It sits mostly between Jupiter and Mars and comprises many hundreds of thousands of (mainly rocky) objects.'),
  ];
}

// PhysicsQ(category: '', question: '', answer: false, feedback: ''),
