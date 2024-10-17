# flutter_bloc_manip

Un projet Flutter utilisant le package `flutter_bloc` pour gérer l'état de manière efficace avec le design pattern BLoC.

## Description

Ce projet a été réalisé dans le cadre d'un cours pédagogique visant à se familiariser avec la gestion d'état dans Flutter à l'aide du package [flutter_bloc][flutter_bloc]. L'objectif est de manipuler et d'expérimenter le design pattern BLoC tout en créant une application simple de compteur.

Le projet implémente un compteur avec des boutons pour incrémenter et décrémenter une valeur. Le compteur est limité entre 0 et 10, et une `SnackBar` s'affiche lorsque l'utilisateur tente de dépasser ces limites.

### Fonctionnalités

- **Incrémentation et décrémentation** : Les valeurs du compteur peuvent être ajustées à l'aide des boutons "plus" et "moins".
- **Gestion des limites** : Le compteur est bloqué à une valeur minimale de 0 et une valeur maximale de 10.
- **SnackBar** : Un message s'affiche pour avertir l'utilisateur lorsque le compteur atteint ses limites (en dessous de 0 ou au-dessus de 10).
- **Historique des opérations** : Toutes les opérations d'incrémentation et de décrémentation sont enregistrées dans une liste d'historique accessible via une page dédiée.
- **BLoC pattern** : La logique de gestion de l'état est encapsulée dans un BLoC (`Business Logic Component`), séparant ainsi la logique métier de l'interface utilisateur.

## Prérequis

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart](https://dart.dev/get-dart)
- Packages utilisés :
  - [flutter_bloc][flutter_bloc]: pour la gestion de l'état

## Installation

1. Clonez ce dépôt sur votre machine :

   ```bash
   git clone https://github.com/votre-utilisateur/flutter_bloc_manip.git
   ```

2. Accédez au répertoire du projet :

   ```bash
   cd flutter_bloc_manip
   ```

3. Installez les dépendances :

   ```bash
   flutter pub get
   ```

## Utilisation

1. Exécutez l'application sur un émulateur ou un appareil connecté :
   flutter run

2. Utilisez les boutons "+" et "-" pour ajuster la valeur du compteur.

## Contribution

Les contributions sont les bienvenues. Pour proposer des améliorations ou signaler des problèmes, veuillez ouvrir une issue ou une pull request.

## Licence

Ce projet est sous licence MIT. Consultez le fichier `LICENSE` pour plus d'informations.

<!-- Liens -->
[flutter_bloc]: https://pub.dev/packages/flutter_bloc