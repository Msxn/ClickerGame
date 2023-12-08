# clicker_game

Projet de jeu clicker classique en Dart (Flutter.)

## Objectifs

- [X] Créer une première page d’accueil dont le titre est Ressources. Le jeu démarre tout de
suite. Utiliser un widget GridView pour présenter les ressources disponibles. La
GridView doit contenir 4 colonnes, peu importe la taille de l’écran. Chaque ressource est
un widget Ressource représenté par un rectangle de couleur sur la GridView (voir le
tableau des spécifications pour les détails)
- [X] Ajouter un bouton au widget Ressource ayant le label Miner. Lorsque ce bouton est
cliqué, une unité de ressource doit être récoltée. Afficher la quantité totale de ressource
récoltée sur chaque ressource. (**En réalité, c'est le InkWell qui est cliquable, je trouvais ça plus sympa**)
- [X] Ajouter un bouton dans l’AppBar de la route Ressources qui permet de naviguer vers une
nouvelle Route Recettes. Utiliser la méthode de navigation que vous souhaitez. Utiliser
une icône pertinente parmi celles proposées par Google Font. Cette route doit afficher
toutes les recettes du jeu sous forme de liste dans une ListView. Chaque recette doit
afficher le nom de la recette, sa description et son coût en ressources. Pour chaque
recette, ajouter un bouton Produire pour produire l’objet. Un objet produit est ajouté à
l’inventaire. (**Je n'ai juste pas réalisé l'import de la recette dans l'inventaire**)
- [X] Le bouton Produire ne doit pas fonctionner (ne rien faire) si les ressources ne sont pas
suffisantes pour produire l’objet. Bonus: donner un “look” disabled au bouton si la
recette n’est pas disponible (**Pour ma part une popup s'affiche "Vous n'avez pas assez de ressources**)
- [ ] Ajouter un bouton dans l’AppBar de la route Ressources qui permet de naviguer vers une
nouvelle Route Inventaire. Cette route doit afficher tous les items produits sur la route
Recettes dans une ListView. Chaque item doit afficher son nom et la quantité produite.
- [ ] Lorsque le joueur a fabriqué 1000 lingots de fer et 1000 lingots de cuivre, la nouvelle
ressource à récolter Charbon est affichée et disponible sur la route Ressources
- [ ] Ajouter un bouton dans l’AppBar de la route Inventaire qui permet de trier l’inventaire
par nom. Ajouter un bouton dans l’AppBar de la route Inventaire qui permet de trier
l’inventaire par quantité.
- [ ] Ajouter un nouvel élément de gameplay de votre choix : une nouvelle page, une nouvelle
action, une nouvelle interaction ou une nouvelle recette. Cet élément de gameplay doit
inclure au moins un nouveau widget dans l’application. Documenter le dans votre
README. Rappelez-vous qu’un idle game fonctionne sur l’addiction, le plaisir de
regarder les chiffres monter et le temps long.
- [ ] Bonus : un Mineur ou une Fonderie sont des bâtiments qui permettent d’automatiser la
production. C’est un élément de gameplay essentiel d’un clicker game, où le jeu doit
pouvoir avancer sans notre intervention (c’est pourquoi on appelle ces jeux idle game,
jeux d’attente/passif). Lorsqu’un Mineur est fabriqué et dans l’inventaire, il s’applique
automatiquement aux ressources métalliques (fer et cuivre). Un mineur extrait 3
items/seconde. Lorsqu’une fonderie est dans l’inventaire, elle transforme
automatiquement les minerai brut de fer et de cuivre en lingots. Une fonderie transforme
1 minerai brut/seconde. On ne peut pas construire plus de mineurs qu’il n’y a de type
de ressources (ici 2). Implémenter les recettes Mineur et Fonderie dans le jeu.
