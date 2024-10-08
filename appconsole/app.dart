import 'classes.dart';
import 'dart:math';
import 'dart:io';

// Fonction Main
void main(List<String> args) {

  // Définition du bot
  final Bot b1 = Bot();

  // b1.force = 1;
  b1.vie = 100;


  // Demande à l'utiliseur à fin de récupérer son pseudo
  stdout.write("Quel est votre Nom ? ");
  String? nom  = stdin.readLineSync().toString();


  // Définition du joueur
  final Joueur j1 = Joueur();

  j1.pseudo = nom;

  j1.score = 0;


  int forceJoueur = 0;

  // Début du jeu

  // Tant que le robot n'est pas mort 
  while (b1.vie > 0) {

    // Création de deux dés de façon aléatoire
    for (var i = 0; i < 2; i++) {
      // Résultat de la fonction de lancé de dés
      int de = jeterDes();
      forceJoueur = forceJoueur + de;
    }

    // On demande à l'utilisateur d'appuyer sur entrée, et on garde la valeur null pour plus tard
    stdout.write("${j1.pseudo}, appuyez sur entrée pour lancer les dés");
    String? temp  = stdin.readLineSync();
    print(temp);

    // On indique le coup du joueur
    print("${j1.pseudo} attaque le bot avec une force de $forceJoueur");


    // On inflige les dégâts du Joueur au bot
    b1.vie = b1.vie - forceJoueur;

    // On augmente le nombre de tours
    j1.score = j1.score + 1;

    // On vérifie que le bot n'a pas de vie en négatif
    if (b1.vie < 0) {
      b1.vie = 0;
    }
    
    // On écrit les résultats
    print("Vie du bot : ${b1.vie}%");
    print("Fin du tour ${j1.score}...");

    // On reset la variable d'attaque, et on utilise la valeur null pour faire un retour à la ligne
    forceJoueur = 0;
    print(temp);
  }

  // On indique la fin du programme
  print("Félicitations ${j1.pseudo}, vous avez tué le bot ! Fin du programme.");

}


int jeterDes() {
  // On prend un nombre random partant de 0 à 5, puis on additionne 1 pour avoir uniquement des nombres entre 1 et 6
  int de = Random().nextInt(6)+1;

  // On renvoit la valeur
  return de;
}