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
  List<PhysicsQ> _questionBank1 = [
    PhysicsQ(
        category: 'Energy',
        number: 1,
        question: 'Kinetic Energy is the energy stored by a moving object.',
        answer: true,
        feedback:
            'To bring a moving object to rest (e.g. a bus) energy is transferred to heat from friction caused by the application of the brakes.  Stored Kinetic energy is dissipated in the form of heat.'),
    PhysicsQ(
        category: 'Energy',
        number: 2,
        question:
            'Today it is normal for Energy to be created, transferred, stored dissipated and destroyed in the use of modern electronic gadgets.',
        answer: false,
        feedback:
            'It is not possible to create or destroy energy forms.  It is only possible to transfer, store or dissipate energy.'),
    PhysicsQ(
        category: 'Energy',
        number: 3,
        question:
            'The amount of kinetic energy in a moving object can be calculated using the equation: 1/2 x mass x speed²',
        answer: true,
        feedback:
            'An phone weighing 164g, dropped from 2m has an impact speed of 6m/s.  It therefore has a kinetic energy gain of... 0.5 x 0.164 x 6 = 3.21 Joules.'),
    PhysicsQ(
        category: 'Energy',
        number: 4,
        question:
            'A person pulls a heavy box along the floor and measures that is takes 15Newtons(N) to move it 3m.  Work done then is 15/3 = 5N',
        answer: false,
        feedback: 'Work done in Joules = Force x Distance or 15 x 3 = 45 J.'),
    PhysicsQ(
        category: 'Energy',
        number: 5,
        question:
            '2 Electric cars have a race.  Car 1 weighs 21kN moves 0.4km in 11.8 Seconds.  Car 2 also weights 21kN moves 0.4km in 23.6 Seconds.  Car 1 must be twice as powerful as Car 2. ',
        answer: true,
        feedback:
            'Using Power(W) = Work(J) / Time(s): Car 1: Power = (21000x400) / 11.8 = 712 kWatts.  Car 2: Power = (21000x400) / 23.6 = 356 kWatts.'),
    PhysicsQ(
        category: 'Energy',
        number: 6,
        question:
            'A Electrical Transformer is one of the most efficient devices known and can frequently have efficiency measurements 1.2 to 1.3.',
        answer: false,
        feedback:
            'It is not possible to have an efficiency greater than 1. This would mean that more energy is being transferred than is being supplied. This breaks the law of conservation of energy.'),
    PhysicsQ(
        category: 'Energy',
        number: 7,
        question:
            'Double Glazing trapping air between two pains of glass uses the properties of thermal conductivity to provide a warmer environment than single glazing.',
        answer: true,
        feedback:
            'The Thermal Conductivity of Air is 0.02 W/m/°C whereas that of glass is 0.17 W/m/°C.  e.g. Air is about a 10 times better insulator than glass on its own. '),
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
        question:
            'The specific heat capacity of an object is the amount of energy is stores in order to release as useful work.',
        answer: false,
        feedback:
            'The specific heat capacity of a substance is the amount of energy needed to raise the temperature of 1 kg of the substance by 1°C.'),
    PhysicsQ(
        category: 'Energy',
        number: 10,
        question:
            'Wind, Solar and Nuclear Energy are the main types of renewable energy sources used today.',
        answer: false,
        feedback:
            'Wind and Solar are renewable energy sources but Nuclear power relies on Uranium that has to be dug out of the ground and is a NON renewable resource.'),
  ];

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
        question:
            'A free Body Diagram shows what happens when Kinetic Energy is transferred to motion in air as something falls.',
        answer: false,
        feedback:
            'A free Body Diagram is a simple drawing of an object/system showing the forces acting on it. The forces are usually shown as arrows pointing away from the centre of a box or dot.'),
    PhysicsQ(
        category: 'Forces',
        number: 3,
        question:
            'When a contact force such as friction or tension acts upon two bodies, they will both experience the same size force but in opposite directions.',
        answer: true,
        feedback:
            'When a contact force acts between two objects, both objects do experience the same size force, but in opposite directions. This is also known as Newton\'s Third Law of Motion'),
    PhysicsQ(
        category: 'Forces',
        number: 4,
        question:
            'With Elastic deformation some of the deformation is still in place once the deforming force is removed.',
        answer: false,
        feedback:
            'With Elastic deformation the deformation is removed once the deforming force is removed.'),
    PhysicsQ(
        category: 'Forces',
        number: 5,
        question:
            'The extension of an elastic object, such as a spring, is described by Hooke\'s law.',
        answer: true,
        feedback:
            'Extension is when an object length increases, and compression when it decreases length. The extension of an elastic object, such as a spring, is described by Hooke\'s law and is Force = spring constant X extension.'),
    PhysicsQ(
        category: 'Forces',
        number: 6,
        question:
            'Work is done when a spring is extended or compressed. Elastic kinetic energy is stored in the spring, providing that it was not deformed.',
        answer: false,
        feedback:
            'Work is done when a spring is extended or compressed. But it is Elastic Potential energy that is stored in the spring. Providing that it was not deformed the Work it can do will be equal to the stored energy.'),
    PhysicsQ(
        category: 'Forces',
        number: 7,
        question:
            'A force on an object may cause it to turn about a point. A MOMENT is the turning effect of a force and they act about a point., clockwise or anticlockwise. The point could be any point on the object, but a pivot/fulcrum is usually chosen.',
        answer: true,
        feedback:
            'A Moment is the turning effect of a force on an object that acts about a point in a clockwise or anticlockwise direction. The point could actually be any point on the object, but normally a pivot point or fulcrum is chosen.'),
    PhysicsQ(
        category: 'Forces',
        number: 8,
        question:
            'A lever comprises a handle, pivot point and effort to move an object.',
        answer: false,
        feedback:
            'A lever is made up of a pivot point, an effort and a load. However levers are effective as they use force multiplication (large moments) to make the effort used exert a larger force on the load.'),
    PhysicsQ(
        category: 'Forces',
        number: 9,
        question:
            'Pressure is the amount of force exerted on an object per unit area of the object.  The pressure in a liquid or gas acts "normal" to the surface.',
        answer: true,
        feedback:
            'Liquids and gases are fluids and so the pressure in then acts normal to a surface (at right angles (90°) to it). To calculate the pressure at the surface of a fluid use the equation: Pressure = Force / Area.'),
    PhysicsQ(
        category: 'Forces',
        number: 10,
        question:
            'A ‘system’ is something that is affected by external forces. When this happens it is called the principle of conservation of momentum.',
        answer: false,
        feedback:
            'A ‘closed system’ is not affected by external forces. This means that total system momentum before an event inside the system must equal total Momentum after the event.  e.g momentum is conserved.'),
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

  /// Topic 5 - Electricity
  List<PhysicsQ> _questionBank5 = [
    PhysicsQ(
        category: 'Electricity',
        number: 1,
        question:
            'An LED is a common component of Electrical Circuits.  LED stands for Low Emission Diode.',
        answer: false,
        feedback:
            'An LED is a common component of Electrical Circuits but LED stands for Light Emitting Diode.'),
    PhysicsQ(
        category: 'Electricity',
        number: 2,
        question:
            'A Thermistor is a type of resister that can change its resistance with temperature changes.',
        answer: true,
        feedback:
            'A Thermistor\'s resistance can change with temperature so that typically it will be higher Resistance at low temperatures and lower Resistance at higher temperatures.'),
    PhysicsQ(
        category: 'Electricity',
        number: 3,
        question:
            'A Diode is a semiconductor component that allows current to flow in one direction and not in another.',
        answer: true,
        feedback:
            'Diodes do allow current to pass more easily in one direction than another.  Typically they will need around 0.7 V potential difference applied however before they start to conduct / switch on.'),
    PhysicsQ(
        category: 'Electricity',
        number: 4,
        question:
            'Charge is a property of a body which experiences a force in an electric field. Charge is measured in milliAmps (mA).',
        answer: false,
        feedback:
            'Charge is measured in coulombs (C).  The amount of charge at a point in the circuit can be calculated using the equation: charge(Q)[Coulombs] = current(I)[Amps] x time(t) [seconds] '),
    PhysicsQ(
        category: 'Electricity',
        number: 5,
        question:
            'Current is a measure of the amount of electron flow in a circuit / component of a circuit. A device called an Ammeter is placed in parallel with the component to measure current passing through it.',
        answer: false,
        feedback:
            'An Ammeter needs to detect and measure all the current passing through a component.  To do this it needs to be placed in SERIES with the component it is measuring.'),
    PhysicsQ(
        category: 'Electricity',
        number: 6,
        question:
            'Voltage is a measure of the difference in charge between 2 points in a circuit.  e.g. across a component.',
        answer: true,
        feedback:
            'As current moves through a component, some charge will be converted to energy in order to do work or lost as heat. If 1 coulomb of charge, is converted to 1 joule of energy, then a Potential Difference of 1 volt will be seen across it.'),
    PhysicsQ(
        category: 'Electricity',
        number: 7,
        question:
            'Resistance of a piece of wire is inversely proportional to its length.  This means that its resistance decreases the longer the wire gets.',
        answer: false,
        feedback:
            'The longer a piece of wire is, the higher the resistance will be. Resistance is directly proportional to length of the wire.'),
    PhysicsQ(
        category: 'Electricity',
        number: 8,
        question:
            'When resistors are connected in parallel the overall resistance is reduced.',
        answer: true,
        feedback:
            'Resistors connected in parallel allow the current to follow multiple paths.  This presents less resistance to the electron flow than would be the case if they were in series.'),
    PhysicsQ(
        category: 'Electricity',
        number: 9,
        question:
            'As electrons move through conductors they vibrate causing more resistance.',
        answer: false,
        feedback:
            'As electrons move through wires, they collide with the ions in the wire which causes the ions to vibrate more. This increased vibration of the ions, increases the temperature and so resistance of the wire.'),
    PhysicsQ(
        category: 'Electricity',
        number: 10,
        question:
            'Electricity is typically transmitted from place to place at a low current but High Voltage.',
        answer: true,
        feedback:
            'Using Power = Current² x Resistance it can be seen that for a given power the current will have a large effect on the resistance. For this reason it is more efficient to transmit with High Voltage and Low Current.'),
  ];

//Todo
  /// Topic 6 - Magnetism and Electromagnetism
  List<PhysicsQ> _questionBank6 = [
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 1,
        question:
            'Two magnets will either attract or repel each other such that like poles (S-S or N-N) repel, unlike poles (N-S or S-N) attract.',
        answer: true,
        feedback:
            'Magnets have differing poles and like poles (S-S or N-N) repel, unlike poles (N-S or S-N) attract. These attract/repel forces are non-contact which means that the magnets affect each other without touching.'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 2,
        question:
            'A permanent magnet can attract and repel another permanent magnet or magnetic material.',
        answer: false,
        feedback:
            'A permanent magnet can attract and repel another permanent magnet as that magnet will also have a magnetic field.  It can only attract but not repel a magnetic material.'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 3,
        question:
            'A wire carrying a current creates a magnetic field. If this field interacts with another magnetic field, it will cause a force that pushes the wire.',
        answer: true,
        feedback:
            'A wire carrying a current generates a magnetic field that interacting with another magnetic field, will cause a force that pushes at right angles to the other fields. This is called the motor effect.'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 4,
        question:
            'A DC current when connected to a loudspeaker will generate a sound proportional to the frequency of the current.',
        answer: false,
        feedback:
            'A loudspeaker does generate a sound by converting current signals into motion of the speaker cone and so sound waves that can be detected by our ears.  However this will need an AC current in order to move the speaker backwards and forwards.'),
    PhysicsQ(
        category: 'Magnetism and Electromagnetism',
        number: 5,
        question: 'Magnetism and Electromagnetism - 5',
        answer: true,
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
        answer: true,
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
        answer: true,
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
